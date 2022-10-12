import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/order_controller.dart';
import 'package:opencart/model/orders/add_order.dart';
import 'package:opencart/model/system_info/order_statuses.dart';
import '../InterFace/Iorder.dart';
import '../model/ProductData.dart';
import '../model/addproductmodel.dart';
import '../model/orders/filter_order.dart';
import '../model/orders/order.dart';
import '../pages/orders/widgets/orderslistviewcontainer.dart';

class InitAddOrderController extends OrderController {
  RxInt _currentStep = 0.obs;

  RxInt get currentStep => _currentStep;

  set currentStep(RxInt value) => _currentStep = value;
  RxBool _isVaild = true.obs;

  RxBool get isVaild => _isVaild;


  tapped(int step) {
    _currentStep.value = step;
  }

  continued() {
    _currentStep.value < 1 ? _currentStep += 1 : null;
  }

  cancel() {
    _currentStep > 0 ? _currentStep -= 1 : null;
  }

  List<String> marketsAddProductList = ["متجر1", "متجر2", "متجر3", "متجر4"];
  RxBool isSwitchedOn = false.obs;
  RxBool isSwitchedOn2 = false.obs;

  var selectedmarketsAddProduct = Rxn<String>();
  List<String> languageAddProductList = ["عربي", "انجليزي", "فرنسي"];
  var selectedLanguageAddProduct= Rxn<String>();
  List<String> currencyAddProductList = ["ريال", "دولار"];
  var selectedCurrenctAddProduct= Rxn<String>();
  var selectedShippingAddProduct= Rxn<String>();
  var selectedpayMethodAddProduct= Rxn<String>();
  var selectedClintOptions = Rxn<String>();
  late List<Product> salesExpansionTitle2;
  late List<Product> salesExpansionTitle1;
  late List<Product> salesExpansionTitle3;
  late List<Product> salesExpansionTitle4;
  late List<Product> salesExpansionTitle5;
  var selectedOptionDate = DateTime.now().obs;

  List<String> clintOptionsList = ["عميل 1", "عميل 2", "عميل 3",];
  List<AddProductDataModel> addProductDataList = [];
  var prodcut;
  var qty;
  var model;
  var unitPrice;
  var total;

  List<Product> generateItems(int numberOfItems, String header) {
    return List.generate(numberOfItems, (int index) {
      return Product(
          header: header,
          body: ' - $index Details',
          isExpanded: false.obs);
    });
  }
  late RxBool searchFormVisible;

  late RxBool formVisible;
  RxInt formsIndex = 1.obs;



  @override
  void onInit() {
    salesExpansionTitle1 = generateItems(1, 'اضف طلب');
    salesExpansionTitle2 = generateItems(1, 'اضافة منتجات');
    salesExpansionTitle3 = generateItems(1, 'معلومات اكثر');
    salesExpansionTitle4 = generateItems(1, 'History');
    salesExpansionTitle5 = generateItems(1, 'Add History');
    searchFormVisible =false.obs;
    formVisible = false.obs;
    formsIndex = 1.obs;


    super.onInit();
  }

  chooseOptionDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedOptionDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != selectedOptionDate.value) {
      selectedOptionDate.value = pickedDate;
    }
  }

  void addProductModel(AddProductDataModel value) {
    addProductDataList.add(value);

    update();
  }
  void removeProductModel(int value) {
    if(addProductDataList.length ==1){addProductDataList.clear();}
    else{ addProductDataList.removeAt(value);
    }
    update();
  }

}
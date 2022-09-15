import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:meta/meta.dart';

import '../core/constrants/widgetconstrant.dart';
import '../model/ProductData.dart';

class WizardController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedCompany = ''.obs;
  /**/
  List<String> relatedProdOptionsList = ["منتج1", "منتج2", "منتج3", "منتج4"];
  List<String> compOptionsList = ["apple", "HTC", "Samsung", "Fox"];
  List<String> taxCategOptionsList = ["فئة1", "فئة2", "فئة3", "فئة4"];
  List<String> compCategOptionsList = ["فئة1", "فئة2", "فئة3", "فئة4"];
  List<String> marketsOptionsList = ["متجر1", "متجر2", "متجر3", "متجر4"];
  List<String> statuesOptionsList = ["حالة1", "حالة2", "حالة3",];
  List<String> orderOptionsList = ["امر1", "امر2", "امر3",];
  List<String> statues2OptionsList = ["حالة1", "حالة2", "حالة3",];
  List<String> weightOptionsList = ["فئة1", "فئة2", "فئة3", "فئة4"];
  List<String> unintOptionsList = ["وحدة1", "وحدة2", "وحدة3",];
  List<String> featureOptionsList = ["ميزة1", "ميزة2", "ميزة3",];
  List<String> optionsproductlist = ["Option1", "Option2", "Option3",];
  RxList<String> attrWidgetList = RxList<String>([]);
  Rx<List<String>> selectedCompanyList = Rx<List<String>>([]);


 void addAttribWidget(String value) {
    attrWidgetList.add(value);
    attrWidgetList.refresh();
    update();
  }
  void removeAttribWidget(int index) {
    attrWidgetList.removeAt(index);
    attrWidgetList.refresh();
    update();
  }

  /*  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);
  var selectedOption = ''.obs;*/

  RxBool isSwitchedOn = false.obs;
  RxBool isSwitchedOn2 = false.obs;
  RxBool _isVaild = true.obs;

  RxBool get isVaild => _isVaild;
  RxInt _currentStep = 0.obs;

  RxInt get currentStep => _currentStep;

  set currentStep(RxInt value) => _currentStep = value;

  tapped(int step) {
    _currentStep.value = step;
  }

  continued() {
    _currentStep.value < 7 ? _currentStep += 1 : null;
  }

  cancel() {
    _currentStep > 0 ? _currentStep -= 1 : null;
  }

  late List<Product> genrlproduct4;
  late List<Product> genrlproduct1;
  late List<Product> genrlproduct2;
  late List<Product> genrlproduct3;
  late List<Product> genrlproduct5;
  late List<Product> linkeproduct1;
  late List<Product> attributeproduct1;
  late List<Product> optionsproduct1;

// getUsers(){
//   repository.getUsers().then( (data){ this._userList.value = data; } );
//
// }
  @override
  void onInit() {
    super.onInit();
    genrlproduct1 = generateItems(1, 'معلومات المنتج');
    genrlproduct2 = generateItems(1, 'معلومات الموديل');
    genrlproduct3 = generateItems(1, 'معلومات التسعير');
    genrlproduct4 = generateItems(1, 'معلومات المخزون');
    genrlproduct5 = generateItems(1, 'تخصيص');
    linkeproduct1 = generateItems(1, 'معلومات الصنع');
    attributeproduct1 = generateItems(1, 'خصائص مميزات');
    optionsproduct1 = generateItems(1, 'Add Option');


  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
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
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  List<Product> generateItems(int numberOfItems, String header) {
    return List.generate(numberOfItems, (int index) {
      return Product(
          header: header,
          body: ' - $index Details',
          isExpanded: false.obs);
    });
  }
}

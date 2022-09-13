import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:meta/meta.dart';

import '../core/constrants/widgetconstrant.dart';
import '../model/ProductData.dart';

class WizardController extends GetxController {
  var selectedDate = DateTime.now().obs;

  List<String> relatedProdOptions = ["منتج1", "منتج2", "منتج3", "منتج4"];
  List<String> compOptions = ["apple", "HTC", "Samsung", "Fox"];
  List<String> taxCategOptions = ["فئة1", "فئة2", "فئة3", "فئة4"];
  List<String> compCategOptions = ["فئة1", "فئة2", "فئة3", "فئة4"];
  List<String> marketsOptions = ["متجر1", "متجر2", "متجر3", "متجر4"];
  List<String> statuesOptions = [
    "حالة1",
    "حالة2",
    "حالة3",
  ];
  List<String> orderOptions = [
    "امر1",
    "امر2",
    "امر3",
  ];
  List<String> statues2Options = [
    "حالة1",
    "حالة2",
    "حالة3",
  ];
  List<String> weightOptions = ["فئة1", "فئة2", "فئة3", "فئة4"];
  List<String> unintOptionsList = [
    "وحدة1",
    "وحدة2",
    "وحدة3",
  ];
  RxList<String> attrWidgetList = RxList<String>([]);



 void setAttrWidgetList(String value) {
    attrWidgetList.add(value);
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

  late List<Generl> genrlproduct4;
  late List<Generl> genrlproduct1;
  late List<Generl> genrlproduct2;
  late List<Generl> genrlproduct3;
  late List<Generl> genrlproduct5;
  late List<Generl> linkeproduct1;
  late List<Generl> attributeproduct1;

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

  List<Generl> generateItems(int numberOfItems, String header) {
    return List.generate(numberOfItems, (int index) {
      return Generl(
          header: header,
          body: 'Employee - $index Details',
          isExpanded: false.obs);
    });
  }
}

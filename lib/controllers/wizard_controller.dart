import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/porducts_controller.dart';
import 'package:opencart/model/attr_model.dart';
import 'package:opencart/model/option_model.dart';
import 'package:opencart/model/sub_model.dart';
import '../model/ProductData.dart';
import '../model/checkbox_data.dart';
import '../model/discount.dart';
import '../model/porducts/attribute.dart';
import '../model/porducts/category.dart';
import '../model/porducts/product.dart';
import '../model/porducts/stores.dart';

class WizardController extends ProductController {
  var productDescription = ProductDescription();
  var prod = Products();
  var selectProd = Rxn<Products>();
  var selectedOption = Rxn<ProductOption>();
  var selectedCategories = Rxn<Categories>();
  var selectedStores = Rxn<Stores>();
  var selectedProductAttribute = Rxn<ProductAttribute>();
  var ss = Rxn<String>();
  var productAttributeDescription = Rxn<ProductAttributeDescription>();
  var attribute = Rxn<Attribute>();

  List<ProductOptionValue> productOptionValue = [];
  List<ProductDescription> productDescriptionlist = [];
  List<ProductAttribute> productAttribute = [];
  var selectedDate = DateTime.now().obs;

  var selectedDeliveryOptionDate = DateTime.now().obs;

  var selectedCompany = ''.obs;
  var currentOptionDateIndex;

  var currentDeliveryDateIndex;
  var currentOptionTimeDateIndex;

  var selectedrelatedProdOptions = Rxn<String>();

  var selectedcompOptions = Rxn<String>();
  List<String> taxCategOptionsList = ["فئة1", "فئة2", "فئة3", "فئة4"];

  var selectedtaxCategOptions = Rxn<String>();

  var selectedcompCategOptions = Rxn<String>();
  List<String> marketsOptionsList = ["متجر1", "متجر2", "متجر3", "متجر4"];
  var selectedmarketsOptions = Rxn<String>();
  var selectedmarketsSeo = Rxn<String>();
  List<String> statuesOptionsList = [
    "حالة1",
    "حالة2",
    "حالة3",
  ];
  var selectedstatuesOptions = Rxn<String>();
  List<String> orderOptionsList = [
    "امر1",
    "امر2",
    "امر3",
  ];

  var selectedorderOptions = Rxn<String>();
  List<String> statues2OptionsList = [
    "حالة1",
    "حالة2",
    "حالة3",
  ];
  List<String> weightOptionsList = ["فئة1", "فئة2", "فئة3", "فئة4"];
  var selectedweightOptions = Rxn<String>();
  var selectedGroupOptions = Rxn<String>();
  List<String> unintOptionsList = [
    "وحدة1",
    "وحدة2",
    "وحدة3",
  ];
  var selectedunintOptions = Rxn<String>();
  List<String> featureOptionsList = [
    "ميزة1",
    "ميزة2",
    "ميزة3",
  ];
  var storesId = Rxn<int>();
  var categorieId = Rxn<int>();

  List<String> optionsproductlist = [
    "Checkbox",
    "Date",
    "Date & Time",
    "Delivery Date",
    "File"
  ];
  List<String> optioncheckchoose = [
    "small",
    "medium",
    "large",
  ];
  List<String> FirstDiscountChooseOptionList = ["default"];
  List<String> SecondDiscountChooseOptionList = ["default"];

  List<String> CheckBoxPriceChooseOptionlist = ["+", "-"];
  List<String> CheckBoxPointsChooseOptionlist = ["+", "-"];
  List<String> CheckBoxWeightChooseOptionlist = ["+", "-"];
  List<String> optionTaxcheckchoose = ['yes', 'no'];
  List<String> optionsproductyesnolist = ["yes", "no"];
  List<String> optionsproductdatelist = ["yes", "no"];
  List<String> SelectedTimeDateOption = ["yes", "no"];
  List<String> optionsproductdeliverydatelist = ["yes", "no"];
  List<String> subscrOptionsList = [
    "خطة1",
    "خطة2",
    "خطة3",
  ];

  var selectedsubscrOptions = Rxn<String>();
  List<String> custmGroupOptionsList = [
    "مجموعة1",
    "مجموعة2",
    "مجموعة3",
  ];
  List<String> testofatrr = [];
  TextEditingController myController = TextEditingController();

  RxList<TextEditingController> textEditingController =
      RxList<TextEditingController>();

  RxList<AttrModel> attrWidgetList = RxList<AttrModel>([]);
  RxList<OptModel> optWidgetList = RxList<OptModel>([]);

  RxList<SubModel> subscWidgetList = RxList<SubModel>([]);
  var manufacturersId = Rxn<int>();

  RxInt currentOptionCheckIndex = 0.obs;

  var isselectedCheckBoxOption = Rxn<String>();

  var isSelectedDeliveryDateOption = Rxn<String>();
  var isSelectedTimeDateOption = Rxn<String>();
  var selectedCheckBoxTaxOption = Rxn<String>();
  var selectedCheckBoxChooseOption = Rxn<String>();
  var firstSelectedDiscountChooseOption = Rxn<String>();
  var secondSelectedDiscountChooseOption = Rxn<String>();
  var selectedCheckBoxPriceChooseOption = Rxn<String>();
  var checkBoxPointsChooseOption = Rxn<String>();
  var checkBoxWeightChooseOption = Rxn<String>();

  dynamic checkBoxQty = 0;
  dynamic checkBoxPrice = 50.0;
  dynamic checkboxpoint = 0;
  dynamic checkboxweight = 10.0;

  dynamic firstDiscountQty = 0;

  dynamic firstDiscountPrice;
  dynamic secondDiscountPrice;
  dynamic firstDiscountPriority;
  dynamic secondDiscountPriority;
  dynamic startDate1;
  dynamic startDate2;
  dynamic endDate1;
  dynamic endDate2;
  RxList<CheckBoxDataModel> checkBoxDataList = RxList<CheckBoxDataModel>([]);
  RxList<DiscountDataModel> firstdiscountDataList =
      RxList<DiscountDataModel>([]);
  RxList<DiscountDataModel> seconddiscountDataList =
      RxList<DiscountDataModel>([]);

  int index = 0;

  void countingthindex() {
    index++;
  }

  void addAttribWidget(AttrModel value, text) {
    attrWidgetList.add(value);
    attrWidgetList.refresh();
    testofatrr.add(text);
    update();
  }

  void addOptWidget(OptModel value) {
    optWidgetList.add(value);
    optWidgetList.refresh();

    update();
  }

  void removeAttribWidget(int index) {
    attrWidgetList.removeAt(index);
    testofatrr.removeAt(index);
  }

  void  removeOptWidget(int index) {
    if (optWidgetList.length == 1) {
      optWidgetList.clear();
    } else {
      optWidgetList.removeAt(index);
      optWidgetList.refresh();
    }

    update();
  }

  void addSubscrWidget(SubModel value) {
    subscWidgetList.add(value);
    subscWidgetList.refresh();
    update();
  }

  void removeSubscrWidget(int value) {
    subscWidgetList.removeAt(value);
    subscWidgetList.refresh();
    update();
  }

  void addCheckBoxModel(CheckBoxDataModel value, int index) {
    checkBoxDataList.add(value);
    checkBoxDataList.refresh();
    optWidgetList[index].chbInnerModel.add(value);
    optWidgetList.refresh();
    update();
  }

  void removeCheckBoxModel(int value, int index) {
    if (optWidgetList[index].chbInnerModel.length == 1) {
      optWidgetList[index].chbInnerModel.clear();
      optWidgetList.refresh();
    } else {
      optWidgetList[index].chbInnerModel.removeAt(value);
      optWidgetList.refresh();
      optWidgetList[index].chbInnerModel.refresh();
    }
    update();
  }

  void addFirstDiscountModel(DiscountDataModel value) {
    firstdiscountDataList.add(value);
    firstdiscountDataList.refresh();

    update();
  }

  void removeFirstDiscountModel(int value) {
    if (firstdiscountDataList.length == 1) {
      firstdiscountDataList.clear();
    } else {
      firstdiscountDataList.removeAt(value);
      firstdiscountDataList.refresh();
    }
    update();
  }

  void addSecondDiscountModel(DiscountDataModel value) {
    seconddiscountDataList.add(value);
    seconddiscountDataList.refresh();

    update();
  }

  void removeSecondDiscountModel(int value) {
    if (seconddiscountDataList.length == 1) {
      seconddiscountDataList.clear();
    } else {
      seconddiscountDataList.removeAt(value);
      seconddiscountDataList.refresh();
    }
    update();
  }

  void changeValueSub(int index, var value) {
    subscWidgetList[index].subSelected = value!;
    subscWidgetList.refresh();
    update();
  }

  void changeValueGrp(int index, var value) {
    subscWidgetList[index].grpSelected = value!;
    subscWidgetList.refresh();
    update();
  }

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
  late List<Product> optionsproduct2;
  late List<OptModel> checkBox;
  late List<Product> checkBoxInner;
  late List<Product> datecontainertitle;
  late List<Product> timeDateContainerTitele;
  late List<Product> DeliveryDateContainerTitle;
  late List<Product> subscribeproduct1;
  late List<Product> discount1;
  late List<Product> discount2;
  late List<Product> discount3;
  late List<Product> seo1;
  late List<Product> seo2;
  late List<Product> seo3;


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
    // checkBox = generateItems(1,'CheckBox');

    // datecontainertitle=  generateItems(1,'Date');
    // timeDateContainerTitele = generateItems(1, ' Date & Time');
    // DeliveryDateContainerTitle = generateItems(1, 'Delivery Date');
    subscribeproduct1 = generateItems(1, 'اضافة خطة الاشتراك');
    discount1 = generateItems(1, 'اضافة تخفيض');
    discount2 = generateItems(1, 'اضافة خصم');
    discount3 = generateItems(1, 'نقاط ومكافئات');
    seo1 = generateItems(1, 'SEO');
    seo2 = generateItems(1, 'التصميم');
    seo3 = generateItems(1, 'التقرير');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  chooseGenerlDate() async {
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

  chooseTime(var index) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: optWidgetList[index].selectedTime.value,
        builder: (context, child) {
          return Theme(data: ThemeData.light(), child: child!);
        },
        initialEntryMode: TimePickerEntryMode.input,
        helpText: 'اختر وقت',
        cancelText: 'الغاء',
        confirmText: 'تأكيد',
        errorInvalidText: 'الرجاء ادخال وقت صحيح',
        hourLabelText: ' الساعة',
        minuteLabelText: 'الدقيقة');
    if (pickedTime != null &&
        pickedTime != optWidgetList[index].selectedTime.value) {
      optWidgetList[index].selectedTime.value = pickedTime;
      optWidgetList.refresh();
      update();
    }
  }

  chooseOptionDate(var index) async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: optWidgetList[index].selectedOptionDate.value,
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
    if (pickedDate != null &&
        pickedDate != optWidgetList[index].selectedOptionDate.value) {
      optWidgetList[index].selectedOptionDate.value = pickedDate;
      optWidgetList.refresh();
    }
  }

  chooseOptionTimeDate(var index) async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: optWidgetList[index].selectedOptionTimeDate.value,
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
    if (pickedDate != null &&
        pickedDate != optWidgetList[index].selectedOptionTimeDate.value) {
      optWidgetList[index].selectedOptionTimeDate.value = pickedDate;
      optWidgetList.refresh();
      update();
    }
  }

  chooseDeliveryDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDeliveryOptionDate.value,
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
    if (pickedDate != null && pickedDate != selectedDeliveryOptionDate.value) {
      selectedDeliveryOptionDate.value = pickedDate;
    }
  }

  List<Product> generateItems(int numberOfItems, String header) {
    return List.generate(numberOfItems, (int index) {
      return Product(
          header: header, body: ' - $index Details', isExpanded: false.obs);
    });
  }

  List<OptModel> generateOptModel(int numberOfItems, OptModel optModel) {
    return List<OptModel>.generate(numberOfItems, (int index) {
      return optModel;
    });
  }
}

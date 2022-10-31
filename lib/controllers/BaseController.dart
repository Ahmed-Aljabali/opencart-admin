import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../core/utils/utilities.dart';
import '../main.dart';
import '../model/ProductData.dart';
import '../model/addproductmodel.dart';


class BaseController extends GetxController{

  List<String> clintOptionsList = ["عميل 1", "عميل 2", "عميل 3",];
  List<AddProductDataModel> addProductDataList = [];

  var prodcut;
   var qty;
  var model;
  var unitPrice;
  var total;
  List<String> marketsAddProductList = ["متجر1", "متجر2", "متجر3", "متجر4"];
  RxBool isSwitchedOn = false.obs;
  RxBool isSwitchedOn2 = false.obs;
  RxBool _isVaild = true.obs;
  var selectedmarketsAddProduct = Rxn<String>();
  List<String> languageAddProductList = ["عربي", "انجليزي", "فرنسي"];
  var selectedLanguageAddProduct= Rxn<String>();
  List<String> currencyAddProductList = ["ريال", "دولار"];
  var selectedCurrenctAddProduct= Rxn<String>();
  List<String>shippingAddProductList = ["طريقة1 ", "طريقة2"];
  var selectedShippingAddProduct= Rxn<String>();
  List<String>payMethodAddProductList = ["نقد ", "حوالة مالية" , " شيك ", " عند الاستلام"];
  var selectedpayMethodAddProduct= Rxn<String>();
  var selectedClintOptions = Rxn<String>();
  late List<Product> salesExpansionTitle2;
  late List<Product> salesExpansionTitle1;
  late List<Product> salesExpansionTitle3;
  late List<Product> salesExpansionTitle4;
  late List<Product> salesExpansionTitle5;
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

  var client = getIt.get<http.Client>();
  String msg=String.fromCharCodes([]);
  var isDataLoading=false.obs;
  var erros=false.obs;

  var  error = <String>[]; // Good


 Future<http.Response> get(String url) async{
    var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.get(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}$url"),
    );
    var decodedResponse = jsonDecode(response.body);
    if (response.statusCode==400)
    {
      error=decodedResponse["error"].cast<String>();
      isDataLoading(true);
      erros(true);
      //error.refresh();
      update();
    }else if (response.statusCode==401)
    {
      Get.offAllNamed('/Login');
    }
    else if (response.statusCode==200)
    {
      isDataLoading(true);
      update();
    }
    return response;
  }


 Future<http.Response>   Update(String url,int id,Object object) async{
    var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.put(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}$url/$id"),
      body: jsonEncode(object)
    );
    var decodedResponse = jsonDecode(response.body);
    if (response.statusCode==400)
    {
      error=decodedResponse["error"].cast<String>();
      isDataLoading(true);
      update();
    }else if (response.statusCode==401)
    {
      Get.offAllNamed('/Login');
    }
    return response;
  }

  Future<http.Response> delete(String url,int id) async{
   isDataLoading(false);
    var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.delete(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}$url/$id"),
    );
    var decodedResponse = jsonDecode(response.body);
    if (response.statusCode==400)
    {
      error=decodedResponse["error"].cast<String>();
      isDataLoading(true);
      update();
    }else if (response.statusCode==401)
    {
      Get.offAllNamed('/Login');
    }

    return response;
  }



  Future<http.Response> getById(String url,String id) async{

    var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.get(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}$url/$id"),
    );

    var decodedResponse = jsonDecode(response.body);

    if (response.statusCode==400)
    {
      error=decodedResponse["error"].cast<String>();
      isDataLoading(true);
      update();
    }else if (response.statusCode==401)
    {
      Get.offAllNamed('/Login');
    }
    else if (response.statusCode==200)
    {
      isDataLoading(true);
      update();
    }
    return response;
  }

 Future<http.Response> post(Object object,String url)async {
   var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.post(
        headers:Utilities.header,
        Uri.parse("${Utilities.baseURL}$url"),
        body:jsonEncode(object)
    );
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
   if (response.statusCode==400)
   {
     error=decodedResponse["error"].cast<String>();
     isDataLoading(true);
     update();
   }
   else if (response.statusCode==401)
    {
      Get.offAllNamed('/Login');
    }

  return response;
  }

  Future<int> postImage(int id,File file)async {

   var postUri = Uri.parse("${Utilities.baseURL}products/$id/images");
   var perf= await Utilities.prefs;
    http.MultipartRequest request =  http.MultipartRequest("POST", postUri);
    request.headers['Authorization']='Bearer ${perf.getString('token')}';
  request.headers['Content-Type']="multipart/form-data";

    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'file',file.path,);

    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    var respon =await response.stream.bytesToString();
    if (response.statusCode==400)
  {
    //  error=decodedResponse["error"].cast<String>();
    isDataLoading(true);
    update();
  }
  else if (response.statusCode==401)
  {
    Get.offAllNamed('/Login');
  }
  else if (response.statusCode==200)
  {
    isDataLoading(true);
    msg="successfully saved";
    update();
  }

  return response.statusCode;

 }

Future<int> put(Object object,String url,int id)async {
  var perf= await Utilities.prefs;
  Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
  var response = await client.put(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}$url/$id"),
      body:jsonEncode(object)
  );
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  if (response.statusCode==400)
  {
    error=decodedResponse["error"].cast<String>();
    isDataLoading(true);
    update();
  }
  else if (response.statusCode==401)
  {
    Get.offAllNamed('/Login');
  }
  else if (response.statusCode==200)
  {
    isDataLoading(true);
    msg="successfully saved";
    update();
  }

  return response.statusCode;
}
/*  chooseOptionDate() async {
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
  }*/

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
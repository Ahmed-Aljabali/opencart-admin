import 'dart:convert';
import 'package:get/get.dart';
import 'package:opencart/model/customer.dart';
import '../Hepler/Base.dart';
import '../InterFace/ICustomer.dart';
import 'package:get_it/get_it.dart';

import '../model/addCustomer.dart';


class CustomerController extends GetxController implements ICustomer{
 var _data;
 String msg=String.fromCharCodes([]);
 Customer get data => _data;
 var isDataLoading=false.obs;
 var client =GetIt.instance.get<Http>();
 List<String>? error;

@override
void onInit(){
  error=List.empty();
  fetchCustomer("10","3");
  super.onInit();
}

  @override
  fetchCustomer(String limit,String page)async{
    isDataLoading(false);
    var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.client.get(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}customers/limit/$limit/page/$page"),
    );
    var decodedResponse = jsonDecode(response.body);
    if (response.statusCode==200)
    {
      _data=Customer.fromJson(decodedResponse);
      isDataLoading(true);
      update();

    }else if (response.statusCode==401){
      Get.offAllNamed('/Login');
    }
  }


 @override
  Future<String?> deleteCustomer(String id)async{
    isDataLoading(false);
    update();
    var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.client.get(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}customers/$id"),
    );
    var decodedResponse = jsonDecode(response.body);
    if (response.statusCode==200)
    {
      isDataLoading(true);
      msg="تم الحذف بنجاح";
      update();
    }else if (response.statusCode==401){
      Get.offAllNamed('/Login');
    }
    return msg;
  }


  @override
   addNewCustomer(PostCustomer customer) async{
    isDataLoading(false);
    var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.client.post(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}customers"),
      body:jsonEncode(customer.toJson())
    );
    var decodedResponse = jsonDecode(response.body)as Map<String, dynamic>;
    if (response.statusCode==400){
      isDataLoading(true);

    error=decodedResponse["error"].cast<String>();

      msg="تم الحفظ بنجاح";
      update();


    }
    if (response.statusCode==200)
    {
      isDataLoading(true);
      msg="تم الحفظ بنجاح";
      update();

    }else if (response.statusCode==401){
      Get.offAllNamed('/Login');
    }
  }




}
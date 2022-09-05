import 'dart:convert';
import 'package:get/get.dart';
import 'package:opencart/model/Customer.dart';
import '../Hepler/Base.dart';
import '../InterFace/ICustomer.dart';

class CustomerController extends GetxController implements ICustomer{
 final String limit;
 final String page;
 CustomerController(this.limit,this.page);
 var _data;
 String msg=String.fromCharCodes([]);
 Customer get data => _data;


 @override
 dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

@override
void onInit(){
  isDataLoading=false.obs;
  fetchCustomer(limit,page);
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
      print('saaaaaaaaaaaaaa');
      update();
    }else if (response.statusCode==401){
      Get.offAllNamed('/Login');
    }
    return msg;
  }





}
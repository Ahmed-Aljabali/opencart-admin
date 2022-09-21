import 'dart:convert';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import '../Hepler/Base.dart';
import '../InterFace/ICustomer.dart';
import 'package:get_it/get_it.dart';
import '../model/cutomers/add_customer.dart';
import '../model/cutomers/customer.dart';


class CustomerController extends BaseController implements ICustomers{


@override
void onInit(){
  error=List.empty();
  fetchCustomer("10","3");
  super.onInit();
}

  @override
  fetchCustomer(String limit,String page)async{
    var res = await get("customers/limit/$limit/page/$page");
    if (res.statusCode == 200) {
  //    _data=Product.fromJson(jsonDecode(res.body)).data;

    }
  }


 @override
  Future<String?> deleteCustomer(String id)async{
   var res = await delete("customers", id.toString());
   if (res.statusCode == 200) {
     msg = "تم الحذف بنجاح";
   }
   return msg;

  }


  @override
   addNewCustomer(PostCustomer customer) async{
    var res= await post(customer,"customers");
    if (res.statusCode==200) {
      msg="successfully saved";
    }
    return msg;

  }




}
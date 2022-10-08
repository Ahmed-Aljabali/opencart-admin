import 'dart:convert';
import 'package:opencart/controllers/BaseController.dart';
import '../InterFace/ICustomer.dart';
import '../model/cutomers/add_customer.dart';
import '../model/cutomers/customer.dart';


class CustomerController extends BaseController implements ICustomers{
  dynamic _trx;
  List<Customers> get trx => _trx;

  @override
  fetchCustomer(String limit,String page)async{
    var res = await get("customers/limit/$limit/page/$page");
    if (res.statusCode == 200)
    {
      _trx=CustomerData.fromJson(jsonDecode(res.body)).data;

    }
  }


 @override
  Future<String?> deleteCustomer(int id)async{
   var res = await delete("customers", id);
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
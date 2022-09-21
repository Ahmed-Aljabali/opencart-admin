import 'dart:convert';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/model/cutomers/customer.dart';
import 'package:opencart/model/cutomers/group_customer.dart';
import '../Interface/Igroup_customer.dart';


class GroupCustomerController extends BaseController implements IGroupCustomer{
  dynamic _data;
  GroupCustomer get data => _data;

  @override
  fetchGroupCustomer(String limit,String page)async{
    var res = await get("customergroups/limit/$limit/page/$page");
    if (res.statusCode == 200) {
      _data=GroupCustomer.fromJson(jsonDecode(res.body));
    }
  }
}
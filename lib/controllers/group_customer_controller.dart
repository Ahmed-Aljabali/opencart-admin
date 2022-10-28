import 'dart:convert';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/model/cutomers/group_customer.dart';
import '../Interface/Igroup_customer.dart';


class GroupCustomerController extends BaseController implements IGroupCustomer{
  dynamic _data;
  List<GroupCustomer> get data => _data;
  var itemsList = <GroupCustomer>[].obs;


  @override
  onInit()async{
    await fetchGroupCustomer("10","1");
    super.onInit();
  }

  @override
   fetchGroupCustomer(String limit,String page)async{
    var res = await get("customergroups/limit/$limit/page/$page");
    if (res.statusCode == 200) {
      _data=GroupCustomerData.fromJson(jsonDecode(res.body)).data;
    }
    itemsList.value=data;
  //  return data;
  }
}
import 'dart:convert';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/model/orders/add_order.dart';
import '../InterFace/Iorder.dart';
import '../model/orders/order.dart';

class OrderController extends BaseController implements IOrder {
  dynamic _trx;
  Orders get trx => _trx;
  @override
  void onInit(){
    //error=List.empty();
    super.onInit();
  }
  @override
  fetchOrder() async {
    var res = await get("orders");
    if (res.statusCode == 200) {
      _trx = Orders.fromJson(jsonDecode(res.body));
    }
  }


  @override
  updateStatusOrder(String id, String status) async {
    var res = await Update("order_status", id, {"status": status});
    if (res.statusCode == 200) {
      msg = jsonDecode(res.body);
    }
  }

  @override
  fetchOrderDetail(String id) async {
    var res = await getById("orders", id);
    if (res.statusCode == 200) {
      Get.toNamed('/OrderDetails');
      msg = jsonDecode(res.body);
    }
  }



  @override
  addOrder(AddOrders addOrder)async {
    var res = await post(addOrder,"orderadmin");
    if (res.statusCode== 200) {
      msg="تم الحفط بنجاح";
    }
  }
}
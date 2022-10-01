import 'dart:convert';
import 'package:opencart/controllers/BaseController.dart';
import '../model/orders/order.dart';
import '../model/system_info/order_statuses.dart';

class SystemINfoController extends BaseController{
  dynamic _orderStatuses;
  List<OrderStatuses> get orderStatuses => _orderStatuses;


  Future<List<OrderStatuses>> fetchOrderStatuses() async {
    var res = await get("init/order_statuses");
    if (res.statusCode == 200) {
      print(jsonDecode(res.body)['data']);
      _orderStatuses = OrderStatusesData.fromJson(jsonDecode(res.body)['data']).data;
    }
    print(_orderStatuses);
    return orderStatuses;
  }

}
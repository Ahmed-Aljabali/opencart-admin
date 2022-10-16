import 'dart:convert';
import 'package:opencart/controllers/BaseController.dart';
import '../model/orders/order.dart';
import '../model/system_info/contries.dart';
import '../model/system_info/order_statuses.dart';

class SystemINfoController extends BaseController{
  dynamic _orderStatuses;
  dynamic _countries;
  List<OrderStatuses> get orderStatuses => _orderStatuses;
  List<Countries> get countries => _countries;


  Future<List<OrderStatuses>> fetchOrderStatuses() async {
    var res = await get("init/order_statuses");
    if (res.statusCode == 200) {

      _orderStatuses = OrderStatusesData.fromJson(jsonDecode(res.body)).data;
    }
    return orderStatuses;
  }
  Future<List<Countries>> fetchCountries() async {
    var res = await get("countries");
    print(res.body);
    if (res.statusCode == 200) {
      _countries = CountriesData.fromJson(jsonDecode(res.body)).data;
    }
    return countries;
  }

}
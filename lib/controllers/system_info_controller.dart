import 'dart:convert';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/wizard_controller.dart';
import '../model/orders/order.dart';
import '../model/system_info/contries.dart';
import '../model/system_info/init_system.dart';
import '../model/system_info/order_statuses.dart';

class SystemINfoController extends BaseController{
  dynamic _orderStatuses;
  dynamic _countries;
  dynamic _lengthClasses;
  dynamic _weightClass;
  dynamic _taxClass;
  dynamic _stockStatuses;
  List<OrderStatuses> get orderStatuses => _orderStatuses;
  List<Countries> get countries => _countries;
  List<LengthClasses> get lengthClasses => _lengthClasses;
 List<WeightClasses> get weightClass => _weightClass;
 List<TaxClasses> get taxClass => _taxClass;
 List<StockStatuses> get stockStatuses => _stockStatuses;

  var selectLength = Rxn<LengthClasses>();
  var selectWeight= Rxn<WeightClasses>();
  var selectTax= Rxn<TaxClasses>();
  var selectStockStatuses= Rxn<StockStatuses>();
  var selectCountries= Rxn<Countries>();


  Future<List<OrderStatuses>> fetchOrderStatuses() async {
    var res = await get("init/order_statuses");
    if (res.statusCode == 200) {

      _orderStatuses = OrderStatusesData.fromJson(jsonDecode(res.body)).data;
    }
    return orderStatuses;
  }
   fetchInitSystem() async {
     var res = await get("init");
    if (res.statusCode == 200) {
      _lengthClasses = LengthData.fromJson(jsonDecode(res.body)).data;
      _weightClass = LengthData.fromJson(jsonDecode(res.body)).weightClass;
      _taxClass=LengthData.fromJson(jsonDecode(res.body)).taxClass;
      _stockStatuses=LengthData.fromJson(jsonDecode(res.body)).stock;
    }
     isDataLoading(true);
     update();
    return lengthClasses;
  }


   fetchCountries() async {
    var res = await get("countries");
    if (res.statusCode == 200) {
      _countries = CountriesData.fromJson(jsonDecode(res.body)).data;
    }
    isDataLoading(true);
    update();
    return countries;
  }

}
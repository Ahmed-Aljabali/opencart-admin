import 'dart:convert';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/model/orders/add_order.dart';
import 'package:opencart/model/system_info/order_statuses.dart';
import '../InterFace/Iorder.dart';
import '../model/ProductData.dart';
import '../model/orders/order.dart';
import '../pages/orders/widgets/orderslistviewcontainer.dart';

class OrderController extends BaseController implements IOrder {

  dynamic _trx;
  dynamic _listFilter;
  List<Orders> get data => _trx;
  List<Orders>? get listFilter => _listFilter;
  RxList<Orders>  listFilte = RxList<Orders>();
  RxBool orderListTypeGrid = false.obs;
  var selectedOrderStatuses= Rxn<OrderStatuses>();


  @override
  fetchOrder() async {
    var res = await get("orders");
    if (res.statusCode == 200) {
      _trx = OrdersData.fromJson(jsonDecode(res.body)).data;
    }
  }

  filterOrderList(){
    List<Orders> tet=[];
    for (var element in data) {
      if (element.name.toString().contains("Ahmed")||element.status==""||
          element.total==""||element.products.toString()==""||element.dateadded=="" ){
        tet.add(element);

      }
      _listFilter=tet;

    }
    // _listFilter= data.where((element) =>
    //      element.name.toString().contains("Ahmed")
    // ).where((element) => element.status=="paddin").toList();

    update();
  }


  @override
  updateStatusOrder(int id, String status) async {
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
  deleteOrder(int id) async {
    isDataLoading(false);
    var res = await delete("orders", id);

    if (res.statusCode == 200) {
      msg ="تم الحذف بنجاح";
      fetchOrder();
      update();

    }
  }

  @override
  addOrder(AddOrders addOrder)async {
    isDataLoading(false);
    var res = await post(addOrder,"orderadmin");
    if (res.statusCode== 200) {
      fetchOrder();
      update();
      msg="تم الحفط بنجاح";
    }
  }

}
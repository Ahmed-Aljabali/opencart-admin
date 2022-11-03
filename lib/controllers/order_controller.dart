import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/model/orders/add_order.dart';
import 'package:opencart/model/orders/payment_metho.dart';
import 'package:opencart/model/system_info/order_statuses.dart';
import '../InterFace/Iorder.dart';
import '../model/ProductData.dart';
import '../model/orders/filter_order.dart';
import '../model/orders/order.dart';
import '../model/orders/shipping_methods.dart';
import '../pages/orders/widgets/orderslistviewcontainer.dart';

class OrderController extends BaseController implements IOrder {

  dynamic _trx;
  dynamic _listFilter;
  dynamic _paymentMethod;
  dynamic _shippingMethods;
  List<Orders> get data => _trx;
  List<Orders>? get listFilter => _listFilter;
  RxList<Orders>  listFilte = RxList<Orders>();
  RxList<ShippingMethods>  listShippingMethods = RxList<ShippingMethods>();
  RxList<PaymentMethod>  listPaymentMethod = RxList<PaymentMethod>();
  RxBool orderListTypeGrid = false.obs;

  var selectedOrderStatuses= Rxn<OrderStatuses>();
  var addOrders = AddOrders().obs;
  var customer =Customer().obs;
  var paymentMethod =Rxn<OrderShippingMethod>();
  var orderShippingMethods =Rxn<OrderShippingMethod>();
  var shippingMethods =Rxn<ShippingMethods>();
  var paymentAddress =Rxn<PaymentAddress>();
  var shippingAddress =Rxn<ShippingAddress>();
  var filterOrder = FilterOrder();
  var productsOrder = ProductsOrder();
  var listProductsOrder = RxList<ProductsOrder>();
  var selectPaymentMethod = Rxn<PaymentMethod>();
  var selectShippingMethods = Rxn<ShippingMethods>();


  var  shippingLastNameController = TextEditingController();
  var  shippingFirstNameController = TextEditingController();
  var  shippingAddressController = TextEditingController();
  var  shippingAddress2Controller = TextEditingController();
  var  shippingCodeZoneController = TextEditingController();
  var  shippingCityController = TextEditingController();


  var  paymentLastNameController = TextEditingController();
  var  paymentFirstNameController = TextEditingController();
  var  paymentAddressController = TextEditingController();
  var  paymentAddress2Controller = TextEditingController();
  var  paymentCodeZoneController = TextEditingController();
  var  paymentCityController = TextEditingController();


  @override
  void dispose() {

    listFilter!.clear();
    super.dispose();
  }


  @override
  void onClose() {
   listFilter!.clear();
    super.onClose();
  }

 initPaymentMethod()async {
    var res = await get("paymentmethods");
    if (res.statusCode == 200) {
      _paymentMethod= PaymentMethodData.fromJson(jsonDecode(res.body)).data;
    }
    listPaymentMethod.value=_paymentMethod;
    return listPaymentMethod;
  }
  initShippingMethods()async {
    var res = await get("shippingmethods");
    if (res.statusCode == 200) {
      _shippingMethods= ShippingMethodsData.fromJson(jsonDecode(res.body)).data;
    }
    listShippingMethods.value=_shippingMethods;

    return listShippingMethods;
  }

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
      if (element.name.toString().contains(filterOrder.name.toString())||
          element.status==filterOrder.status||
          element.total==filterOrder.total ||
          element.products.toString()==filterOrder.prodName||
          element.dateadded==filterOrder.date||
          element.orderid==filterOrder.idOrder
      )
      {
        tet.add(element);

      }
      _listFilter=tet;

    }
    filterOrder.idOrder=0;
    filterOrder.name="";
    filterOrder.status="";
    filterOrder.date="";
    filterOrder.total="";
    filterOrder.prodName="";
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
  print(addOrder.toJson());

    var res = await post(addOrder,"orderadmin");
    print(res.body);
    if (res.statusCode== 200) {
      fetchOrder();
      update();
      msg="تم الحفط بنجاح";
    }
  }


}
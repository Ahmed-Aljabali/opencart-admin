

import '../model/orders/add_order.dart';

abstract class IOrder{
  fetchOrder();
  addOrder(AddOrders  addOrder);
  updateStatusOrder(String id,String status);
  fetchOrderDetail(String id);
}
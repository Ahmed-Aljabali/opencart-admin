

import '../model/orders/add_order.dart';

abstract class IOrder{
  fetchOrder();
  addOrder(AddOrders  addOrder);
  updateStatusOrder(int id,String status);
  fetchOrderDetail(String id);
  deleteOrder(int id);
}
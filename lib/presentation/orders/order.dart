// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:opencart/Controllers/order_controller.dart';
//
// import '../../model/orders/add_order.dart';
//
// class Order extends StatefulWidget {
//   const Order({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return OrderState();
//   }
//
// }
//
// class OrderState extends State<Order>{
//   OrderController  order = Get.put(OrderController());
//
//   @override
//   void initState(){
//     order.fetchOrder();
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         appBar: AppBar(
//         title:const Text("order"),
//     ),
//     body:Obx(() => !order.isDataLoading.value? const Center(
//       child: CircularProgressIndicator(),
//     ): Center(
//         child: ListView.builder(
//           itemCount: order.data.data.length,
//          itemBuilder: (ctx,i){
//             return Center(
//                 child:FractionallySizedBox(
//               alignment: Alignment.center,
//               widthFactor: 0.5,
//               child:  SizedBox(
//                 height: 100,
//                 child:Row(
//                   children: [
//                     FlatButton(
//                     child:const Text("Customer"),
//                     onPressed: (){
//                       Get.toNamed('/Customer');
//
//               }),
//
//                     FlatButton(
//                         child:const Text("add Order"),
//                         onPressed: (){
//                         //  Get.toNamed('/AddOrder');
//
//                           Get.toNamed('/Product');
//
//                         }),
//                     FlatButton(
//                     child:const Text("Prod"),
//                     onPressed: (){
//                       Get.toNamed('/Product');
//
//               }),
//                 Text(order.data.data[i].orderid.toString()),
//                 FlatButton(onPressed: (){
//                   order.updateStatusOrder(order.data.data[i].orderid.toString(), "Pending");
//
//                 }, child:const Text('تحديث الطلب')),
//                   FlatButton(onPressed: (){
//                   order.fetchOrderDetail(order.data.data[i].orderid.toString());
//
//                 }, child:const Text('تفاصيل'))
//
//                 ],)  ,
//               ),
//             ));
//          },
//       ))));
//
//   }
//
//
// }
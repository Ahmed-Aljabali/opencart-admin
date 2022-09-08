import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/Controllers/order_controller.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key,}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrderDetailsState();
  }

}

class OrderDetailsState extends State<OrderDetail>{
  final OrderController order = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title:const Text("order"),
        ),
        body:Obx(() => !order.isDataLoading.value? const Center(
          child: CircularProgressIndicator(),
        ): Center(
            child: Text(order.msg.toString()))));

  }


}
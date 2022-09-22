import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../Controllers/order_controller.dart';

class OrderPage extends GetView<OrderController> {

  @override
  // TODO: implement controller
  OrderController get controller => super.controller;
  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    controller.fetchOrder();
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Text(controller.trx.data.toString()),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

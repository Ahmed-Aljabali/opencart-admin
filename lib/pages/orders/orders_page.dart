import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/OrdersController.dart';

class OrderPage extends GetView<OrdersController> {
  int counter = 0;
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
                () => Text(controller.counter.value.toString()),
              ),
              /* ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text("Increase "),
                onPressed: () {
                  controller.increaseCounter();
                },
              ),*/
            ],
          ),
        ),
      ),
    );
    ;
  }
}

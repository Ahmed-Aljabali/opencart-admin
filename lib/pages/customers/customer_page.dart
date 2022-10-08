import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:opencart/Controllers/customer_controller.dart';

class CustomerPage extends GetView<CustomerController> {
  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    controller.fetchCustomer("10","3");

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
                  () => !controller.isDataLoading.value? const Center(
          child: CircularProgressIndicator(),
                 ): Text("controller.trx.data.toString()"),
            ),
          ],
        ),
      ),
    );

  }
}

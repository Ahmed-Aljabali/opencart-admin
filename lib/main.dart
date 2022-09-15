import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:opencart/pages/dashboard/dashboard_binding.dart';
import 'package:opencart/pages/loginpage.dart';

import 'package:opencart/presentation/Login.dart';
import 'package:http/http.dart' as http;
import 'package:opencart/presentation/orders/order.dart';
import 'package:opencart/presentation/orders/order_detail.dart';

import 'Hepler/Base.dart';
import 'model/customer.dart';
import 'model/dashboard.dart';


void main() {
 // Get.put(Http());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => MyDashBoard(),
          binding: DashBoardBindings(),
        ),
        GetPage(
          name: "/login",
          page: () => AuthThreePage(),
        )
      ],
    );
  }
}




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:opencart/pages/dashboard/dashboard_binding.dart';
import 'package:opencart/pages/loginpage.dart';
import 'package:opencart/presentation/Login.dart';
import 'package:http/http.dart' as http;

import 'Hepler/Base.dart';
import 'model/dashboard.dart';


final  getIt =GetIt.instance;
void startUp(){
 // getIt.registerLazySingleton(() => Http());
}
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/Login",

      getPages: [
       // GetPage(name: "/Login", page:()=>const Login()),
       // GetPage(name: "/Order", page:()=>const Order()),
      //  GetPage(name: "/OrderDetails", page:()=>const OrderDetail()),
     //   GetPage(name: "/Customer", page:()=>const Customer(page:"3"))
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




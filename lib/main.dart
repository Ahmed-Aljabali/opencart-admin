import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/pages/customers/customer_page.dart';
import 'package:opencart/pages/dashboard/dashboard_binding.dart';
import 'package:opencart/pages/loginpage/loginpage.dart';
import 'package:opencart/presentation/Login.dart';
import 'package:http/http.dart' as http;
import 'package:opencart/presentation/customers/add_customer.dart';
import 'package:opencart/presentation/customers/customer.dart';
import 'package:opencart/presentation/orders/add_order.dart';
import 'package:opencart/presentation/orders/order.dart';
import 'package:opencart/presentation/orders/order_detail.dart';
import 'package:opencart/presentation/products/add_prodcts.dart';
import 'package:opencart/presentation/products/product.dart';
import 'package:opencart/presentation/products/update_product.dart';
import 'model/dashboard.dart';


final  getIt =GetIt.instance;
void startUp(){
  getIt.registerLazySingleton<http.Client>(() => http.Client());
}
void main() {
  startUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: DashBoardBindings(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        textTheme:const TextTheme( subtitle1: TextStyle(fontFamily: 'Cairo Regular'),) ,

        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(
              vertical: 10.0, ),


          fillColor:Colors.transparent,
          hintStyle: TextStyle(
            color: Colors.grey,

            fontSize: 13, fontFamily: 'Cairo Regular',
          ),


          enabledBorder: OutlineInputBorder(

            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(width: 1, color: Colors.blue),
          ),),
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/Login",
      getPages: [

        GetPage(
          name: "/",
          page: () => MyDashBoard(),
          binding: DashBoardBindings(),
        ),
        // GetPage(
        // name: "/login",
        // page: () => AuthThreePage(),
        // ),
        GetPage(name: "/Login", page:()=>AuthThreePage(),binding: DashBoardBindings()),
        //  GetPage(name: "/Customer", page:()=>const OrderDetail()),
        GetPage(name: "/Customer", page:()=>CustomerPage()),
        GetPage(name: "/AddCustomer", page:()=>const AddCustomer()),
        GetPage(name: "/Product", page:()=>const Product()),
        GetPage(name: "/AddProduct", page:()=>const AddProduct()),
        GetPage(name: "/UpdateProduct", page:()=>const UpdateProduct()),
        GetPage(name: "/AddOrder", page:()=>const AddOrder()),

      ],
    );
  }
}
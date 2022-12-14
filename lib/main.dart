import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:opencart/pages/dashboard/dashboard_binding.dart';
import 'package:opencart/pages/loginpage/loginpage.dart';
import 'package:http/http.dart' as http;
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
        unselectedWidgetColor: Colors.green,
        primaryColor: Colors.green,
        textTheme:const TextTheme( subtitle1: TextStyle(fontFamily: 'Cairo Regular'),) ,
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(
             vertical: 10.0,),
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
        primarySwatch: Colors.green,
      ),
      initialRoute: "/Login",
      getPages: [

        GetPage(name: "/", page: () => const MyDashBoard(), binding: DashBoardBindings(),),

        GetPage(name: "/Login", page:()=>AuthThreePage(),binding: DashBoardBindings()),

      ],
    );
  }
}
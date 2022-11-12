import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<dynamic> errorDialog(String middleText){
  return Get.defaultDialog(
      title: "خطأ في ادخال البيانات",
      middleText: middleText,
      textCancel: "تم",
      backgroundColor: Colors.white60,
      titleStyle: TextStyle(color: Colors.redAccent),
      middleTextStyle: TextStyle(color: Colors.redAccent),
      radius: 30
  );
}
Future<dynamic> errorInternetDialog(){
  return Get.defaultDialog(
      title: "يجب الاتصال بالاتنرنت",
      textCancel: "تم",
      backgroundColor: Colors.white60,
      titleStyle: TextStyle(color: Colors.redAccent),
      radius: 30
  );
}
Future<dynamic> successMessage(String title){
  return Get.defaultDialog(
      title:title,
      textCancel: "تم",

      backgroundColor: Colors.white60,
      titleStyle: TextStyle(color: Colors.redAccent),

      radius: 30
  );
}
Future<dynamic> successDialog(String title){
  return Get.defaultDialog(
      title:title,
      textCancel: "تم",
      backgroundColor: Colors.white60,
      titleStyle: TextStyle(color: Colors.green),
      middleTextStyle: TextStyle(color: Colors.green),
      radius: 30
  );
}
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../Hepler/Base.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';


class LoginController extends GetxController with StateMixin{
 // var client =  http.Client();
  Http client =GetIt.instance.get<Http>();
//var client =Http();
@override
void  onInit() {
  getToken();
}

login(User user)async {
    var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.client.post(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}login"),
      body:jsonEncode(user.toJson())
    );
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    if (response.statusCode==200)
    {
      Get.offNamed('/Order');
    }else{

      Get.defaultDialog(
        title: "خطا في الدخول",
        middleText: "البيانات المدخله غير صحيحه",
       // content: getContent(),
        barrierDismissible: false,
        radius: 50.0,
        cancel: cancelBtn(),
      );
    }

 }
  Widget cancelBtn() {
    return ElevatedButton(onPressed: () {
      Get.back();
    }, child:const Text("Cancel"));
  }


  getToken() async{
      var response = await client.client.post(
          headers:Utilities.header ,
          Uri.parse("${Utilities.baseURL}oauth2/token/client_credentials"),
                );
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var perf= await Utilities.prefs;
     perf.setString("token", decodedResponse["data"]["access_token"]);
    }


}

import 'dart:convert';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import '../Hepler/Base.dart';

import '../model/user.dart';

class LoginController extends BaseController with StateMixin{
 @override
void  onInit() {
  getToken();
  super.onInit();
}

login(User user)async {
  var res= await post(user,"login");
  if (res.statusCode==200) {
    Get.offNamed('/');
  }
  return msg;


 }

  getToken() async{
      var response = await client.post(
          headers:Utilities.header ,
          Uri.parse("${Utilities.baseURL}oauth2/token/client_credentials"),
                );
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var perf= await Utilities.prefs;
     perf.setString("token", decodedResponse["data"]["access_token"]);
    }


}

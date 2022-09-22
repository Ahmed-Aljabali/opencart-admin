

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


// class Http {
//   var client =  http.Client();
// }


abstract class Utilities{
  // var client =  http.Client();

   static String baseURL="https://api-oauth.opencart-api.com/api/rest_admin/";
   static Future<SharedPreferences> prefs = SharedPreferences.getInstance();
   static Map<String,String> header =
{
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Basic ZGVtb19vYXV0aF9jbGllbnQ6ZGVtb19vYXV0aF9zZWNyZXQ='
};
}

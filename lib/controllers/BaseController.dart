import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../hepler/Base.dart';
import '../main.dart';

class BaseController extends GetxController{
  var client = getIt.get<http.Client>();
  String msg=String.fromCharCodes([]);
  var isDataLoading=false.obs;
  //var di = dio.Dio();

  List<String>? error;

 Future<http.Response> get(String url) async{
    var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.get(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}$url"),
    );
    var decodedResponse = jsonDecode(response.body);
    if (response.statusCode==400)
    {
      error=decodedResponse["error"].cast<String>();
      isDataLoading(true);
      update();
    }else if (response.statusCode==401)
    {
      Get.offAllNamed('/Login');
    }
    else if (response.statusCode==200)
    {
      isDataLoading(true);
      update();
    }
    return response;
  }


 Future<http.Response>   Update(String url,String id,Object object) async{
    var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.put(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}$url/$id"),
      body: jsonEncode(object)
    );
    var decodedResponse = jsonDecode(response.body);
    if (response.statusCode==400)
    {
      error=decodedResponse["error"].cast<String>();
      isDataLoading(true);
      update();
    }else if (response.statusCode==401)
    {
      Get.offAllNamed('/Login');
    }
    else if (response.statusCode==200)
    {
      isDataLoading(true);
      update();
    }
    return response;
  }

  Future<http.Response> delete(String url,String id) async{
    var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.delete(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}$url/$id"),
    );
    var decodedResponse = jsonDecode(response.body);
    if (response.statusCode==400)
    {
      error=decodedResponse["error"].cast<String>();
      isDataLoading(true);
      update();
    }else if (response.statusCode==401)
    {
      Get.offAllNamed('/Login');
    }
    else if (response.statusCode==200)
    {
      isDataLoading(true);
      update();
    }
    return response;
  }



  Future<http.Response> getById(String url,String id) async{

    var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.get(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}$url/$id"),
    );

    var decodedResponse = jsonDecode(response.body);

    if (response.statusCode==400)
    {
      error=decodedResponse["error"].cast<String>();
      isDataLoading(true);
      update();
    }else if (response.statusCode==401)
    {
      Get.offAllNamed('/Login');
    }
    else if (response.statusCode==200)
    {
      isDataLoading(true);
      update();
    }
    return response;
  }

 Future<http.Response> post(Object user,String url)async {
   var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.post(
        headers:Utilities.header,
        Uri.parse("${Utilities.baseURL}$url"),
        body:jsonEncode(user)
    );
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
   if (response.statusCode==400)
   {
     error=decodedResponse["error"].cast<String>();
     isDataLoading(true);
     update();
   }
   else if (response.statusCode==401)
    {
      Get.offAllNamed('/Login');
    }
  else if (response.statusCode==200)
    {
      isDataLoading(true);
      msg="successfully saved";
      update();
    }

  return response;
  }

  Future<int> postImage(int id,File file)async {

   var postUri = Uri.parse("${Utilities.baseURL}products/$id/images");
   var perf= await Utilities.prefs;
    http.MultipartRequest request =  http.MultipartRequest("POST", postUri);
    request.headers['Authorization']='Bearer ${perf.getString('token')}';
  request.headers['Content-Type']="multipart/form-data";

    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'file',file.path,);

    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    var respon =await response.stream.bytesToString();
    if (response.statusCode==400)
  {
    //  error=decodedResponse["error"].cast<String>();
    isDataLoading(true);
    update();
  }
  else if (response.statusCode==401)
  {
    Get.offAllNamed('/Login');
  }
  else if (response.statusCode==200)
  {
    isDataLoading(true);
    msg="successfully saved";
    update();
  }

  return response.statusCode;

 }

Future<int> put(Object object,String url,int id)async {
  var perf= await Utilities.prefs;
  Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
  var response = await client.put(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}$url/$id"),
      body:jsonEncode(object)
  );
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  if (response.statusCode==400)
  {
    error=decodedResponse["error"].cast<String>();
    isDataLoading(true);
    update();
  }
  else if (response.statusCode==401)
  {
    Get.offAllNamed('/Login');
  }
  else if (response.statusCode==200)
  {
    isDataLoading(true);
    msg="successfully saved";
    update();
  }

  return response.statusCode;
}
}
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../Hepler/Base.dart';
import '../InterFace/Iorder.dart';
import '../model/order.dart';

class OrderController extends GetxController implements IOrder{
  Http client =GetIt.instance.get<Http>();
  var _trx;
  var msg;
  var isDataLoading=false.obs;
  Orders get trx => _trx;

  @override
  void  onInit() {
    fetchOrder();
    super.onInit();
  }

   @override
  fetchOrder() async{
     var perf= await Utilities.prefs;
     Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
     var response = await client.client.get(
         headers:Utilities.header,
         Uri.parse("${Utilities.baseURL}orders"),
     );
     var decodedResponse = jsonDecode(response.body);
     if (response.statusCode==200)
     {
       isDataLoading(true);
      _trx=  Orders.fromJson(decodedResponse);
       update();
     }else if (response.statusCode==401){
       Get.offAllNamed('/Login');
     }
   }



  @override
  updateStatusOrder(String id,String status)async{
    var perf= await Utilities.prefs;

    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.client.put(
      headers:Utilities.header,
      Uri.parse("${Utilities.baseURL}order_status/$id"),
      body:jsonEncode({"status":status})
     );
   // var decodedResponse = jsonDecode(response.body);
    if (response.statusCode==200)
    {
      update();
    }else if (response.statusCode==401){
      Get.toNamed('/Login');
    }
  }

  @override
  fetchOrderDetail(String id)async{
    var perf= await Utilities.prefs;
    Utilities.header['Authorization']='Bearer ${perf.getString('token')}';
    var response = await client.client.get(
        headers:Utilities.header,
        Uri.parse("${Utilities.baseURL}orders/$id"));
    var decodedResponse = jsonDecode(response.body);
    if (response.statusCode==200)
    {
      Get.toNamed('/OrderDetails');

      msg=decodedResponse;
      update();
    }else if (response.statusCode==401){
      Get.toNamed('/Login');
    }
  }

}

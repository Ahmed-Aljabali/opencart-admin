import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/Controllers/OrderController.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrderState();
  }

}

class OrderState extends State<Order>{
  final  order = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
        title:const Text("order"),
    ),
    body:Obx(() => !order.isDataLoading.value? const Center(
      child: CircularProgressIndicator(),
    ): Center(
        child: ListView.builder(
          itemCount: order.trx.data.length,
         itemBuilder: (ctx,i){
            return Center(
                child:FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 0.5,
              child:  SizedBox(
                height: 100,
                child:Row(
                  children: [
                    FlatButton(
                    child:const Text("Customer"),
                    onPressed: (){
                      Get.toNamed('/Customer');

              }),
                Text(order.trx.data[i].orderid.toString()),
                FlatButton(onPressed: (){
                  order.updateStatusOrder(order.trx.data[i].orderid.toString(), "Pending");

                }, child:const Text('تحديث الطلب')),
                  FlatButton(onPressed: (){
                  order.fetchOrderDetail(order.trx.data[i].orderid.toString());

                }, child:const Text('تفاصيل'))

                ],)  ,
              ),
            ));
         },
      ))));

  }


}
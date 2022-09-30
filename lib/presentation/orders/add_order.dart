import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/order_controller.dart';
import '../../model/orders/add_order.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddOrderState();
  }

}

class AddOrderState extends State<AddOrder>{
  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final  orderController = Get.put(OrderController());
    return Scaffold(
        appBar: AppBar(
          title:const Text("Customer"),
        ),
        body:Obx(() => !orderController.isDataLoading.value? const Center(
          child: CircularProgressIndicator(),
        ): Center(
            child:Row(children: [

              FlatButton(
                  child:const Text("add Order"),
                  onPressed: (){
                    var paymentaddress=PaymentAddress(firstname: "Ahmed",lastname: "Aljabali",zone: "0");
                    var customer =Customer(lastname: "Aljabali",firstname: "Ahmed",customerId: 5,telephone: "776816212");
                    var order = AddOrders(paymentAddress: paymentaddress,customer:customer );
                    orderController.addOrder(order);
                  }),


            ],)

        )
        ));

  }


}
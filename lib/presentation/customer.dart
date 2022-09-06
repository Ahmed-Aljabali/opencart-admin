import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/Controllers/CustomerController.dart';

class Customer extends StatefulWidget {
  final String page;
  const Customer({Key? key,required this.page}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomerState();
  }

}

class CustomerState extends State<Customer>{
  var page;
  @override
  void initState(){
    page=widget.page;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final  customerController = Get.put(CustomerController("10",page));
    return Scaffold(
        appBar: AppBar(
          title:const Text("Customer"),
        ),
        body:Obx(() => !customerController.isDataLoading.value? const Center(
          child: CircularProgressIndicator(),
        ): Center(
            child:Row(children: [

              FlatButton(
                  child:const Text("Customer"),
                  onPressed: (){
                     customerController.fetchCustomer("10", "10");
                  }),

              FlatButton(
                  child:const Text("delet"),
                  onPressed: ()async{
                   var  msg =await  customerController.deleteCustomer("9");
                   Get.defaultDialog(
                     title: "خطا في الدخول",
                     middleText: msg.toString(),
                     // content: getContent(),
                     barrierDismissible: false,
                     radius: 50.0,
                     cancel: cancelBtn(),
                   );
                  }),
              Text( customerController.data.data!.isEmpty==true?"لأيوجد بيانات ":customerController.data.data![0]!.customerid.toString()
              )

            ],)

        )
        ));

  }


}
Widget cancelBtn() {
  return ElevatedButton(onPressed: () {
    Get.back();
  }, child: Text("Cancel"));
}
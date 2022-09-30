import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/Controllers/customer_controller.dart';

import '../../model/cutomers/add_customer.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddCustomerState();
  }

}

class AddCustomerState extends State<AddCustomer>{
  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final  customerController = Get.put(CustomerController());
    return Scaffold(
        appBar: AppBar(
          title:const Text("Customer"),
        ),
        body:Obx(() => !customerController.isDataLoading.value? const Center(
          child: CircularProgressIndicator(),
        ): Center(
            child:Row(children: [

              FlatButton(
                  child:const Text("Add New"),
                  onPressed: (){
                     var addCustomer =PostCustomer();
                    customerController.addNewCustomer(addCustomer);
                  }),



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
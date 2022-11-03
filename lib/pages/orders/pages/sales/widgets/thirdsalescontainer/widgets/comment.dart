import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/Init_add_order_controller.dart';
import 'package:opencart/core/utils/math_utils.dart';
import '../../../../../../../core/constrants/widgetconstrant.dart';


class Comment extends GetView<InitAddOrderController> {
  const Comment({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {


    return      SizedBox(
      height: MediaQuery.of(context).size.height*0.3,
      child: Column(

        children: <Widget>[
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 20, top: 10,bottom: 10),
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 25,
                      ))),
              Expanded(
                  child: Container(

                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: const Text(
                        'تعليق',
                        style: TextStyle(color: Colors.grey, fontSize: 22,fontFamily: 'Cairo Regular'),
                        textAlign: TextAlign.center,
                      ))),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
            indent: 20,
            endIndent: 15,
          ),

          Container(
            padding: getPadding(right: 10,left: 10,bottom: 20,top: 20),
            child:    Expanded(
              child: MyTextFieldWidget(hintText: "تعليق", height: 60,
                onChanged: (value) {
                   controller.addOrders.value.comment=value;
                },),
            ),),
          MaterialButton(
              child:  Text(
                'حفظ',
                style:  TextStyle(fontSize: 25, color: Colors.white,fontFamily: 'Cairo Regular'),
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              minWidth: 100,
              height: 60,
              color: Colors.green,
              onPressed: () {
                Get.back();
              })


        ],
      ),
    );

  }
}
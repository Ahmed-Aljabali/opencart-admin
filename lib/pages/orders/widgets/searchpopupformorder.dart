import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/order_controller.dart';

import '../../../controllers/wizard_controller.dart';
import '../../../core/constrants/widgetconstrant.dart';
import '../../../model/checkbox_data.dart';

class OrderSearchForm extends GetView<OrderController> {


  @override
  Widget build(BuildContext context) {

  return Column(

    children: <Widget>[
      Container(
        padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Expanded(
              child: MyTextFieldWidget(hintText: "Product ID", onChanged: (value) {  },),
            ),
            Expanded(
                child: MyTextFieldWidget(
                  hintText: 'اسم المنتج',

                  onChanged: (value) {




                  },
                )),



          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Expanded(
              child: MyTextFieldWidget(hintText: "السعر", onChanged: (value) {  },),
            ),
            Expanded(
                child: MyTextFieldWidget(
                  hintText: 'الحالة',

                  onChanged: (value) {




                  },
                )),



          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Expanded(
              child: MyTextFieldWidget(hintText: "الوحدة", onChanged: (value) {  },),
            ),
            Expanded(
                child: MyTextFieldWidget(
                  hintText: 'الكمية',

                  onChanged: (value) {




                  },
                )),



          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Expanded(
              child: MyTextFieldWidget(hintText: "طريقة الدفع", onChanged: (value) {  },),
            ),
            Expanded(
                child: MyTextFieldWidget(
                  hintText: 'طريقة الشحن',

                  onChanged: (value) {




                  },
                )),



          ],
        ),
      ),

      Container(
        padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Expanded(
              child: MyTextFieldWidget(hintText: "الوزن", onChanged: (value) {  },),
            ),
            Expanded(
                child: MyTextFieldWidget(
                  hintText: 'اللون',

                  onChanged: (value) {




                  },
                )),



          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Expanded(
                child: MyTextFieldWidget(hintText: "التاريخ", onChanged: (value) {  },),
              ),
              Expanded(
                  child: MyTextFieldWidget(
                    hintText: 'العروض',

                    onChanged: (value) {




                    },
                  )),



            ],
          ),
        ),
      ),

      //first row the amount and small medium large

      //the forth row the weight and the method of weight

      // tow buttons of save and cancel
    ],
  );

  }
}
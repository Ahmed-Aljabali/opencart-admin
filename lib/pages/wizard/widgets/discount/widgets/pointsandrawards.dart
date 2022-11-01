import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/core/utils/math_utils.dart';

import '../../../../../controllers/group_customer_controller.dart';
import '../../../../../controllers/wizard_controller.dart';
import '../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../model/cutomers/group_customer.dart';
import '../../../../../model/discount.dart';

class PointsAndRewards extends GetView<WizardController> {




  @override
  Widget build(BuildContext context)  {
    DiscountDataModel discountDataModel;


    return SizedBox(
      child: Column(
        children: <Widget>[



          Container(
            padding: const EdgeInsets.only( right: 10,top: 10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: MyTextFieldWidget(
                      hintText: 'نقاط المكافأة',
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        controller.prod.reward = value;

                      },
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: MyTextFieldWidget(
                      hintText: 'النقاط المطلوبة',
                      onChanged: (value) {
                        controller.prod.points = value;

                      },
                    )),
              ],
            ),
          ), // price and priority
          Container(padding: getPadding(all: 10 ),
            alignment: Alignment.center,
            height: 63,
            child: Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 1,right: 1),
                child: DecoratedBox(
                  decoration: BoxDecoration(

                      color:Colors.white, //background color of dropdown button
                      border: Border.all(color: Colors.black, width:0.5), //border of dropdown button
                      borderRadius: BorderRadius.circular(4), //border raiuds of dropdown button
                      boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                            blurRadius: 3) //blur radius of shadow
                      ]
                  ),
                  // child: Center(
                  //   child: DropdownButton<GroupCustomer>(
                  //     alignment: AlignmentDirectional.bottomCenter,
                  //     underline: Container(color: Colors.transparent),
                  //     hint: const Text("مجموعة العملاء"),
                  //     value: controller.secondSelectedDiscountGroupCustomer.value,
                  //     onChanged: (v) {
                  //       controller.secondSelectedDiscountGroupCustomer.value = v;
                  //
                  //     },
                  //     items: CustomerGroup.itemsList.value
                  //         .map<DropdownMenuItem<GroupCustomer>>(
                  //             (GroupCustomer value) {
                  //           return DropdownMenuItem<GroupCustomer>(
                  //             value: value,
                  //             child: Text(value.name.toString()),
                  //           );
                  //         }).toList(),
                  //   ),
                  // ),
                ),
              ),
            ),
          ),

          // tow buttons of save and cancel
        ],
      ),
    );
  }
}
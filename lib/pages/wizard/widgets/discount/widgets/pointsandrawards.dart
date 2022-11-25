import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/core/utils/math_utils.dart';

import '../../../../../controllers/wizard_controller.dart';
import '../../../../../core/constrants/widgetconstrant.dart';

class MainPointsAndRewards extends GetView<MainWizardController> {




  @override
  Widget build(BuildContext context)  {



      return Container(
        padding: getPadding(bottom: 20),
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
                      child: DynamicTextFieldWidget(
                        controller:controller.rewardsController ,
                        onFieldSubmitted: (c){

                        },
                        hintText: 'نقاط المكافأة',
                        keyboardType: TextInputType.number,

                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: DynamicTextFieldWidget(
                        controller:controller.pointsController ,
                        onFieldSubmitted: (x){


                        },
                        hintText: 'النقاط المطلوبة',
                        keyboardType: TextInputType.number,
                      )),
                ],
              ),
            ),
            // Container(padding: getPadding(all: 10 ),
            //   alignment: Alignment.center,
            //   height: 63,
            //   child: Expanded(
            //     child: Container(
            //       padding: EdgeInsets.only(left: 1,right: 1),
            //       child: DecoratedBox(
            //         decoration: BoxDecoration(
            //
            //             color:Colors.white, //background color of dropdown button
            //             border: Border.all(color: Colors.black, width:0.5), //border of dropdown button
            //             borderRadius: BorderRadius.circular(4), //border raiuds of dropdown button
            //             boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
            //               BoxShadow(
            //                   color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
            //                   blurRadius: 3) //blur radius of shadow
            //             ]
            //         ),
            //         child:  Center(
            //           child: DropdownButton<String>(
            //             hint:  const Text("مجموعة العملاء"),
            //             value: controller.selectedGroupOptions.value,
            //             onChanged:(v) {
            //               controller.selectedGroupOptions.value = v!;
            //
            //             },
            //             items:controller.custmGroupOptionsList.
            //             map<DropdownMenuItem<String>>((String value) {
            //               return   DropdownMenuItem<String>(
            //                 enabled: true,
            //                 value: value,
            //                 child: Text(value),
            //               );
            //             }).toList(),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            // tow buttons of save and cancel
          ],
        ),
      );


}}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:opencart/controllers/wizard_controller.dart';

import '../../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../../model/ProductData.dart';

class CheckBoxRequiredOptionPicker extends StatelessWidget {
  WizardController controller;

  var index;

  CheckBoxRequiredOptionPicker({required this.controller,this.index});


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(

        children: [

          Container(

            child: Expanded(

              child: DecoratedBox(

                  decoration: BoxDecoration(

                      color: Colors.white60,
                      //background color of dropdown button
                      border: Border.all(color: Colors.black38, width: 0.5),
                      //border of dropdown button
                      borderRadius: BorderRadius.circular(10),
                      //border raiuds of dropdown button
                      boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.2),
                            //shadow for button
                            blurRadius: 3) //blur radius of shadow
                      ]
                  ),

                  child: Container(

                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.3,

                    child: Center(
                      child: DropdownButton<String>(
                        hint: Text("مطلوب"),
                        value: controller.optWidgetList[index].isselectedCheckBoxOption,
                        onChanged: (v) {
                          controller.optWidgetList[index].isselectedCheckBoxOption = v!;


                          // print(v);
                        },
                        items: controller.optionsproductyesnolist.
                        map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )
              ),
            ),
          ),

        ],);
    });
  }


}

import 'dart:ui';

import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/wizard_controller.dart';
import '../../../../core/constrants/text_constrants.dart';
import '../../../../core/constrants/widgetconstrant.dart';
import '../../../../model/ProductData.dart';





class OptionsProductContainer extends StatelessWidget {
  const OptionsProductContainer({

    required this.controller,
  }) ;

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Obx(() => ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.optionsproduct1[panelIndex].isExpanded!.value =
            !isExpanded;
          },
          children: controller.optionsproduct1.map<ExpansionPanel>((Product item) {
            return ExpansionPanel(
                backgroundColor: Colors.grey[200],
                canTapOnHeader: true,
                headerBuilder: ((context, isExpanded) {
                  return ListTile(
                      title: Text(
                        item.header!,
                        style: TextStyle(fontSize: 20,),
                        textAlign: TextAlign.center,
                      ));
                }),
                body: Container(
                  /* padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 10),*/
                  margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      TextDropdownFormField(



                        options: controller.optionsproductlist,
                        decoration: CategInputDecoration.copyWith(hintText: "options",labelText:"options",),
                        dropdownHeight: controller.optionsproductlist.length * 50,
                      ),// الشركة المصنعة


                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList())),
    );
  }
}
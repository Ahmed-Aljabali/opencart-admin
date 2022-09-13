import 'dart:ui';

import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/wizard_controller.dart';
import '../../../../core/constrants/text_constrants.dart';
import '../../../../model/ProductData.dart';





class ThirdProductContainer extends StatelessWidget {
  const ThirdProductContainer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Obx(() => ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.genrlproduct3[panelIndex].isExpanded!.value =
                !isExpanded;
          },
          children: controller.genrlproduct3.map<ExpansionPanel>((Generl item) {
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
                    const TextField(

                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'price',
                      hintStyle: TextStyle(
                        fontSize: 19,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 40.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey, width: 0.5),
                        borderRadius:
                        BorderRadius.all(Radius.circular(5.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey, width: 2.0),
                        borderRadius:
                        BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                    ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 59,
                        child: TextDropdownFormField(

                          options: controller.taxCategOptions,
                          decoration: taxCategInputDecoration,
                          dropdownHeight: controller.taxCategOptions.length * 50,
                        ),
                      ),
                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList())),
    );
  }
}
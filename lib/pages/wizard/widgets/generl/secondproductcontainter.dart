import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../controllers/wizard_controller.dart';
import '../../../../core/constrants/widgetconstrant.dart';

import '../../../../controllers/productpagecontroller.dart';
import '../../../../model/ProductData.dart';

class Secondproductcontainer extends StatelessWidget {
  const Secondproductcontainer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Obx(() => ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.genrlproduct2[panelIndex].isExpanded!.value =
                !isExpanded;
          },
          children: controller.genrlproduct2.map<ExpansionPanel>((Product item) {
            return ExpansionPanel(
                backgroundColor: Colors.grey[200],
                canTapOnHeader: true,
                headerBuilder: ((context, isExpanded) {
                  return ListTile(
                      title: Text(
                    item.header!,
                    style: TextStyle(fontSize: 20, ),
                    textAlign: TextAlign.center,
                  ));
                }),
                body: Container(
                  /* padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 10),*/
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                  child: Column(
                    children: [
                      MyTextFieldWidget(hintText:"Model" ,onChanged: (value){print(value);}),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFieldWidget(hintText:"SKU" ,onChanged: (value){print(value);}),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFieldWidget(hintText:"Universal Product Code",onChanged: (value){print(value);}),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFieldWidget(hintText:"EAN" ,onChanged: (value){print(value);}),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFieldWidget(hintText:"JAN" ,onChanged: (value){print(value);}),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFieldWidget(hintText:"ISBN" ,onChanged: (value){print(value);}),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFieldWidget(hintText:"MPN" ,onChanged: (value){print(value);}),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFieldWidget(hintText:"Location" ,onChanged: (value){print(value);}),

                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList())),
    );
  }
}

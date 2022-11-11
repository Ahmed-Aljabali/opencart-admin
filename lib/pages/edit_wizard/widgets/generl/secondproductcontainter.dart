import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:opencart/controllers/edit_wizard_controller.dart';

import '../../../../controllers/wizard_controller.dart';
import '../../../../core/constrants/widgetconstrant.dart';
import '../../../../model/ProductData.dart';

class SecondProductContainer extends GetView<EditWizardController> {

  @override
  Widget build(BuildContext context) {
    return Obx(() => ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          controller.genrlproduct2[panelIndex].isExpanded!.value =
              !isExpanded;
        },
        children: controller.genrlproduct2.map<ExpansionPanel>((Product item) {
          return ExpansionPanel(
              backgroundColor: Colors.white,
              canTapOnHeader: true,
              headerBuilder: ((context, isExpanded) {
                return ListTile(
                    title: Text(
                  item.header!,
                  style: const TextStyle(fontSize: 20, ),
                  textAlign: TextAlign.center,
                ));
              }),
              body: Container(
                /* padding: EdgeInsets.only(
                      top: 10, bottom: 10, right: 10, left: 10),*/
                margin:
                    const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                child: Column(
                  children: [
                    MyTextFieldWidget(hintText:"Model" ,onChanged: (value)=>controller.prod.model=value),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(hintText:"SKU" ,onChanged: (value)=>controller.prod.sku=value),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(hintText:"Universal Product Code",onChanged: (value)=>controller.prod.upc=value),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(hintText:"EAN" ,onChanged: (value)=>controller.prod.ean=value),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(hintText:"JAN" ,onChanged: (value)=>controller.prod.jan=value),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(hintText:"ISBN" ,onChanged: (value)=>controller.prod.isbn=value),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(hintText:"MPN" ,onChanged: (value)=>controller.prod.mpn=value),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(hintText:"Location" ,onChanged: (value)=>controller.prod.location=value),

                  ],
                ),
              ),
              isExpanded: item.isExpanded!.value);
        }).toList()));
  }
}

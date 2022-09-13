import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../controllers/wizard_controller.dart';
import '../../../../core/constrants/widgetconstrant.dart';

import '../../../../controllers/productpagecontroller.dart';
import '../../../../model/ProductData.dart';

class Firstproductcontainer extends StatelessWidget {
  const Firstproductcontainer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Obx(() => ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.genrlproduct1[panelIndex].isExpanded!.value =
                !isExpanded;
          },
          children: controller.genrlproduct1.map<ExpansionPanel>((Generl item) {
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
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      MyTextFieldWidget(hintText:  "اسم المنتج", onChanged: (value){print(value);},),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFieldWidget(hintText:"وصف المنتج" ,onChanged: (value){print(value);}),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFieldWidget(hintText:"MetaTagTitle" ,onChanged: (value){print(value);}),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFieldWidget(hintText:"Meta Tag Description" ,onChanged: (value){print(value);}),
                      SizedBox(height: 10,),
                      MyTextFieldWidget(hintText:"Meta Tag KeyWord" ,onChanged: (value){print(value);}),
                      SizedBox(height: 10,),
                      MyTextFieldWidget(hintText:"Product Tags" ,onChanged: (value){print(value);}),

                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList())),
    );
  }
}



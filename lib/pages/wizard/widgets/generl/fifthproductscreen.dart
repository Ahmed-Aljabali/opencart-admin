
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:opencart/core/constrants/widgetconstrant.dart';


import '../../../../controllers/wizard_controller.dart';
import '../../../../model/ProductData.dart';
import 'fothproductcontainer.dart';


class FifhProductScreen extends StatelessWidget {
   FifhProductScreen({
    required this.controller,
  });

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          controller.genrlproduct5[panelIndex].isExpanded!.value =
              !isExpanded;
        },
        children: controller.genrlproduct5.map<ExpansionPanel>((Product item) {
          return ExpansionPanel(
              backgroundColor: Colors.grey[200],
              canTapOnHeader: true,
              headerBuilder: ((context, isExpanded) {
                return ListTile(
                    title: Text(
                  item.header!,
                  style: const TextStyle(fontSize: 20,),
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
                    LSwitchListTile(
                      isChecked: controller.isSwitchedOn2.value,
                      listSwitchFun: (b) {
                        controller.isSwitchedOn2.value = b;
                      },
                      listSwitchText: '1قابل للشحن',
                    ),
                    MyTextFieldWidget(hintText: "الطول", keyboardType: TextInputType.number,onChanged: (v){print(v);}),
                    const SizedBox(height: 10,),
                    MyTextFieldWidget(hintText: "العرض",keyboardType: TextInputType.number, onChanged: (v){print(v);}),
                    const SizedBox(height: 10,),
                    MyTextFieldWidget(hintText: 'الارتفاع',keyboardType: TextInputType.number, onChanged: (v){}),
                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 1,right: 1),
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white60, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                  boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child:Center(
                                child: DropdownButton<String>(
                                  hint:  const Text("وحدة القياس"),
                                  value: controller.selectedunintOptions.value,
                                  onChanged:(v) {
                                    controller.selectedunintOptions.value = v!;},
                                  items:controller.unintOptionsList.
                                  map<DropdownMenuItem<String>>((String value) {
                                    return   DropdownMenuItem<String>(
                                      enabled: true,
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(hintText: 'الوزن', onChanged: (v){print(v);},keyboardType: TextInputType.number,),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 1,right: 1),
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white60, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                  boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child:Center(
                                child: DropdownButton<String>(
                                  hint:  const Text("فئة الوزن"),
                                  value: controller.selectedweightOptions.value,
                                  onChanged:(v) {
                                    controller.selectedweightOptions.value = v!;},
                                  items:controller.weightOptionsList.
                                  map<DropdownMenuItem<String>>((String value) {
                                    return   DropdownMenuItem<String>(
                                      enabled: true,
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 1,right: 1),
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white60, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                  boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child:Center(
                                child: DropdownButton<String>(
                                  hint:  const Text("الحالة"),
                                  value: controller.selectedstatuesOptions.value,
                                  onChanged:(v) {
                                    controller.selectedstatuesOptions.value = v!;},
                                  items:controller.statuesOptionsList.
                                  map<DropdownMenuItem<String>>((String value) {
                                    return   DropdownMenuItem<String>(
                                      enabled: true,
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 1,right: 1),
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white60, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                  boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child:Center(
                                child: DropdownButton<String>(
                                  hint:  const Text("امر الترتيب"),
                                  value: controller.selectedorderOptions.value,
                                  onChanged:(v) {
                                    controller.selectedorderOptions.value = v!;},
                                  items:controller.orderOptionsList.
                                  map<DropdownMenuItem<String>>((String value) {
                                    return   DropdownMenuItem<String>(
                                      enabled: true,
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              isExpanded: item.isExpanded!.value);
        }).toList()));
  }
}

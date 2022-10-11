import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/wizard_controller.dart';
import '../../../../../model/ProductData.dart';
import '../../../../core/constrants/widgetconstrant.dart';
class Seo extends GetView<WizardController> {


  @override
 Widget build(BuildContext context) {
    return Obx(() => Column(children: [
      ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.seo1[panelIndex].isExpanded!.value = !isExpanded;
          },
          dividerColor: Colors.blueAccent,
          children: controller.seo1.map<ExpansionPanel>((Product item) {
            return ExpansionPanel(
                backgroundColor: Colors.white,
                canTapOnHeader: true,
                headerBuilder: ((context, isExpanded) {
                  return ListTile(

                      title: Text(
                        item.header!,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ));
                }),
                body:  Container(
                  padding: const EdgeInsets.only( right: 10,top: 10),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child:   Container(
                            alignment: Alignment.center,
                            height: 41,
                            child: Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 1,right: 1),
                                child: DecoratedBox(
                                    decoration: BoxDecoration(

                                        color:Colors.white, //background color of dropdown button
                                        border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                                        borderRadius: BorderRadius.circular(4), //border raiuds of dropdown button
                                        boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                          BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                              blurRadius: 3) //blur radius of shadow
                                        ]
                                    ),
                                    child:Center(
                                      child: DropdownButton<String>(
                                        alignment: Alignment.center,
                                        hint:  const Text("المتجر"),
                                        value: controller.selectedmarketsSeo.value,
                                        onChanged:(v) {
                                          controller.selectedmarketsSeo.value = v!;},
                                        items:controller.marketsOptionsList.
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
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      /* Expanded(

                  child: Card(

                    margin: EdgeInsets.only(right:39),
                    child:
                  ),
                ),*/
                      Expanded(
                          child: MyTextFieldWidget(
                            hintText: 'الكلمة الرئيسية',
                            onChanged: (value) {},
                          )),
                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList()),
      ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.seo2[panelIndex].isExpanded!.value = !isExpanded;
          },
          dividerColor: Colors.blueAccent,
          children: controller.seo2.map<ExpansionPanel>((Product item) {
            return ExpansionPanel(
                backgroundColor: Colors.white,
                canTapOnHeader: true,
                headerBuilder: ((context, isExpanded) {
                  return ListTile(

                      title: Text(
                        item.header!,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ));
                }),
                body:Container(
                  padding: const EdgeInsets.only( right: 10,top: 10 , bottom:  10),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child:   Container(
                            alignment: Alignment.center,
                            height: 41,
                            child: Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 1,right: 1),
                                child: DecoratedBox(
                                    decoration: BoxDecoration(

                                        color:Colors.white, //background color of dropdown button
                                        border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                                        borderRadius: BorderRadius.circular(4), //border raiuds of dropdown button
                                        boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                          BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                              blurRadius: 3) //blur radius of shadow
                                        ]
                                    ),
                                    child:Center(
                                      child: DropdownButton<String>(
                                        alignment: Alignment.center,
                                        hint:  const Text("المتجر"),
                                        value: controller.selectedmarketsSeo.value,
                                        onChanged:(v) {
                                          controller.selectedmarketsSeo.value = v!;},
                                        items:controller.marketsOptionsList.
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
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      /* Expanded(

                  child: Card(

                    margin: EdgeInsets.only(right:39),
                    child:
                  ),
                ),*/
                      Expanded(
                          child:   Container(
                            alignment: Alignment.center,
                            height: 41,
                            child: Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 1,right: 1),
                                child: DecoratedBox(
                                    decoration: BoxDecoration(

                                        color:Colors.white, //background color of dropdown button
                                        border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                                        borderRadius: BorderRadius.circular(4), //border raiuds of dropdown button
                                        boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                          BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                              blurRadius: 3) //blur radius of shadow
                                        ]
                                    ),
                                    child:Center(
                                      child: DropdownButton<String>(
                                        alignment: Alignment.center,
                                        hint:  const Text("تجاوز المخطط"),
                                        value: controller.selectedmarketsSeo.value,
                                        onChanged:(v) {
                                          controller.selectedmarketsSeo.value = v!;},
                                        items:controller.marketsOptionsList.
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
                          )),
                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList()),
      ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.seo3[panelIndex].isExpanded!.value = !isExpanded;
          },
          dividerColor: Colors.blueAccent,
          children: controller.seo3.map<ExpansionPanel>((Product item) {
            return ExpansionPanel(
                backgroundColor: Colors.white,
                canTapOnHeader: true,
                headerBuilder: ((context, isExpanded) {
                  return ListTile(
                      title: Text(
                        item.header!,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ));
                }),
                body:Container(
                  padding: const EdgeInsets.only( right: 10,top: 10 , bottom:  10),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child:   Container(
                            alignment: Alignment.center,
                            height: 41,
                            child: Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 1,right: 1),
                                child: DecoratedBox(
                                    decoration: BoxDecoration(

                                        color:Colors.white, //background color of dropdown button
                                        border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                                        borderRadius: BorderRadius.circular(4), //border raiuds of dropdown button
                                        boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                          BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                              blurRadius: 3) //blur radius of shadow
                                        ]
                                    ),
                                    child:Center(
                                      child: DropdownButton<String>(
                                        alignment: Alignment.center,
                                        hint:  const Text("المتجر"),
                                        value: controller.selectedmarketsSeo.value,
                                        onChanged:(v) {
                                          controller.selectedmarketsSeo.value = v!;},
                                        items:controller.marketsOptionsList.
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
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      /* Expanded(

                  child: Card(

                    margin: EdgeInsets.only(right:39),
                    child:
                  ),
                ),*/
                      Expanded(
                          child:   Container(
                            alignment: Alignment.center,
                            height: 41,
                            child: Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 1,right: 1),
                                child: DecoratedBox(
                                    decoration: BoxDecoration(

                                        color:Colors.white, //background color of dropdown button
                                        border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                                        borderRadius: BorderRadius.circular(4), //border raiuds of dropdown button
                                        boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                          BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                              blurRadius: 3) //blur radius of shadow
                                        ]
                                    ),
                                    child:Center(
                                      child: DropdownButton<String>(
                                        alignment: Alignment.center,
                                        hint:  const Text("تجاوز المخطط"),
                                        value: controller.selectedmarketsSeo.value,
                                        onChanged:(v) {
                                          controller.selectedmarketsSeo.value = v!;},
                                        items:controller.marketsOptionsList.
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
                          )),
                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList()),

    ],));
  }
}

import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';



import '../../../../controllers/wizard_controller.dart';
import '../../../../core/constrants/text_constrants.dart';
import '../../../../core/constrants/widgetconstrant.dart';
import '../../../../model/ProductData.dart';





class FirstProductLinkeExpantionPanel extends StatelessWidget {
  const FirstProductLinkeExpantionPanel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Obx(() => ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.linkeproduct1[panelIndex].isExpanded!.value =
            !isExpanded;
          },
          children: controller.linkeproduct1.map<ExpansionPanel>((Product item) {
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
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 1,right: 1),
                            child: DecoratedBox(
                                decoration: BoxDecoration(

                                    color:Colors.white60, //background color of dropdown button
                                    border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                    borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                    boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                          blurRadius: 3) //blur radius of shadow
                                    ]
                                ),
                                child:Container(
                                  child: Center(
                                    child: DropdownButton<String>(
                                      hint:  Text("الشركة المصنعة"),
                                      value: controller.selectedcompOptions.value,
                                      onChanged:(v) {
                                        controller.selectedcompOptions.value = v!;},
                                      items:controller.compOptionsList.
                                      map<DropdownMenuItem<String>>((String value) {
                                        return   DropdownMenuItem<String>(
                                          enabled: true,
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
                      ),
                      SizedBox(height: 10,),
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 1,right: 1),
                            child: DecoratedBox(
                                decoration: BoxDecoration(

                                    color:Colors.white60, //background color of dropdown button
                                    border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                    borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                    boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                          blurRadius: 3) //blur radius of shadow
                                    ]
                                ),
                                child:Container(
                                  child: Center(
                                    child: DropdownButton<String>(
                                      hint:  Text("الفئات"),
                                      value: controller.selectedcompCategOptions.value,
                                      onChanged:(v) {
                                        controller.selectedcompCategOptions.value = v!;},
                                      items:controller.compCategOptionsList.
                                      map<DropdownMenuItem<String>>((String value) {
                                        return   DropdownMenuItem<String>(
                                          enabled: true,
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
                      ),

                      SizedBox(height: 10,),

                      Container(height:47,child: MyTextFieldWidget(hintText: 'الفلتر', onChanged: (value){print(value);})),// الفلتر
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 1,right: 1),
                            child: DecoratedBox(
                                decoration: BoxDecoration(

                                    color:Colors.white60, //background color of dropdown button
                                    border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                    borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                    boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                          blurRadius: 3) //blur radius of shadow
                                    ]
                                ),
                                child:Container(
                                  child: Center(
                                    child: DropdownButton<String>(
                                      hint:  Text("المتاجر"),
                                      value: controller.selectedmarketsOptions.value,
                                      onChanged:(v) {
                                        controller.selectedmarketsOptions.value = v!;},
                                      items:controller.marketsOptionsList.
                                      map<DropdownMenuItem<String>>((String value) {
                                        return   DropdownMenuItem<String>(
                                          enabled: true,
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
                      ),

                      SizedBox(height: 10,),
                      Container(height:47,child: MyTextFieldWidget(hintText: 'التحميلات', onChanged: (value){print(value);})),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 1,right: 1),
                            child: DecoratedBox(
                                decoration: BoxDecoration(

                                    color:Colors.white60, //background color of dropdown button
                                    border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                    borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                    boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                          blurRadius: 3) //blur radius of shadow
                                    ]
                                ),
                                child:Container(
                                  child: Center(
                                    child: DropdownButton<String>(
                                      hint:  Text("منتجات ذات صلة"),
                                      value: controller.selectedrelatedProdOptions.value,
                                      onChanged:(v) {
                                        controller.selectedrelatedProdOptions.value = v!;},
                                      items:controller.relatedProdOptionsList.
                                      map<DropdownMenuItem<String>>((String value) {
                                        return   DropdownMenuItem<String>(
                                          enabled: true,
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
                      ),

                    /*  Container(
                        constraints: BoxConstraints(maxWidth: 250),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[

                            Text('Choose One Item With Done Button',style:  TextStyle(fontSize: 14,color: Colors.black)),


                          ],
                        ),
                      ),*/// addition

                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList())),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:opencart/core/utils/math_utils.dart';
import '../../../../../controllers/Init_add_order_controller.dart';
import '../../../../../model/ProductData.dart';


class ForthSalesContainer extends StatelessWidget {
  final InitAddOrderController controller;

  const ForthSalesContainer   ({
    Key? key,
    required this.controller,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {



    return  Obx(() {
      return ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.salesExpansionTitle4[panelIndex].isExpanded!.value =
            !isExpanded;
          },
          children: controller.salesExpansionTitle4.map<ExpansionPanel>((Product item) {
            return ExpansionPanel(
                backgroundColor: Colors.grey[200],
                canTapOnHeader: true,
                headerBuilder: ((context, isExpanded) {
                  return ListTile(
                      title: Text(
                        item.header!,
                        style: const TextStyle(fontSize: 20, ),
                        textAlign: TextAlign.center,
                      ));
                }),
                body:  Container(
                  padding: getPadding(all: 8),
                    child: Column(children: <Widget>[
                      Container(

                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade400),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Table(
                                border: TableBorder.all( color: Colors.blue.shade400),
                                children: [
                                  TableRow(
                                      decoration: BoxDecoration(
                                          color:Colors.blueGrey.withOpacity(0.16),

                                      ),
                                      children: [
                                        Container(
                                            height: 40.0,
                                            child: Center(child: Text(' Customer Notified',textScaleFactor: 0.7, textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Cairo Regular'))))
                                      ]),
                                  TableRow(
                                      decoration: BoxDecoration(
                                          color:Colors.blueGrey.withOpacity(0.16),

                                      ),
                                      children: [
                                        Container(
                                            height: 40.0,
                                            child: Center(child: Text('',style:TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Cairo Regular'))))
                                      ]),


                                ],
                              ),
                            ),
                            Expanded(
                              child: Table(
                                border: TableBorder.all( color: Colors.blue.shade400),
                                children: [
                                  TableRow(
                                      decoration: BoxDecoration(
                                          color:Colors.blueGrey.withOpacity(0.16),

                                      ),
                                      children: [
                                        Container(
                                            height: 40.0,
                                            child: Center(child: Text('Status',style:TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Cairo Regular'))))
                                      ]),
                                  TableRow(
                                      decoration: BoxDecoration(
                                          color:Colors.blueGrey.withOpacity(0.16),

                                      ),
                                      children: [
                                        Container(
                                            height: 40.0,
                                            child: Center(child: Text('',style:TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Cairo Regular'))))
                                      ]),


                                ],
                              ),
                            ),
                            Expanded(
                              child: Table(
                                border: TableBorder.all( color: Colors.blue.shade400),
                                children: [
                                  TableRow(
                                      decoration: BoxDecoration(
                                          color:Colors.blueGrey.withOpacity(0.16),

                                      ),
                                      children: [
                                        Container(
                                            height: 40.0,
                                            child: Center(child: Text(' Comment',style:TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Cairo Regular'))))
                                      ]),
                                  TableRow(
                                      decoration: BoxDecoration(
                                          color:Colors.blueGrey.withOpacity(0.16),

                                      ),
                                      children: [
                                        Container(
                                            height: 40.0,
                                            child: Center(child: Text('',style:TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Cairo Regular'))))
                                      ]),


                                ],
                              ),
                            ),
                            Expanded(
                              child: Table(
                                border: TableBorder.all( color: Colors.blue.shade400),
                                children: [
                                  TableRow(
                                      decoration: BoxDecoration(
                                          color:Colors.blueGrey.withOpacity(0.16),

                                      ),
                                      children: [
                                        Container(
                                            height: 40.0,
                                            child: Center(child: Text(' Date Added',style:TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Cairo Regular'))))
                                      ]),
                                  TableRow(
                                      decoration: BoxDecoration(
                                          color:Colors.blueGrey.withOpacity(0.16),

                                      ),
                                      children: [
                                        Container(
                                            height: 40.0,
                                            child: Center(child: Text('',style:TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Cairo Regular'))))
                                      ]),


                                ],
                              ),
                            ),




                          ],
                        ),
                      ),

                    ])),
                isExpanded: item.isExpanded!.value);
          }).toList());
    });
  }
}



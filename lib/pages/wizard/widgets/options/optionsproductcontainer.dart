import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:opencart/model/option_model.dart';
import 'package:opencart/pages/wizard/widgets/options/datecontainer/datecontainer.dart';
import 'package:opencart/pages/wizard/widgets/options/deliverydatecontainer/deliverydatecontainer.dart';


import '../../../../controllers/wizard_controller.dart';
import '../../../../core/constrants/text_constrants.dart';
import '../../../../core/constrants/widgetconstrant.dart';
import '../../../../model/ProductData.dart';
import 'checkboxcontainer/checkboxcontainer.dart';
import 'timeanddateconainer/timedatecontainer.dart';





class OptionsProductContainer extends StatelessWidget {
  const OptionsProductContainer({

    required this.controller,
  }) ;

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(

      child:  Obx(() =>ExpansionPanelList(
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
                  margin: EdgeInsets.only(bottom: 10, left: 5),
                  width:  MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(



                              child:  ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.optWidgetList.length,
                                itemBuilder: (context, index) {
                                  print(controller.optWidgetList.value[index]);
                                  if(controller.optWidgetList.value[index]=="Date") {
                                    controller.currentOptionDateIndex = index;

                                    return DateContainer(controller:controller);
                                  } else if(controller.optWidgetList[index].optType=="Checkbox") {
                                    controller.currentOptioncheckIndex= index;
                                    return controller.optWidgetList[index].optModelList;
                                  }
                                  else if(controller.optWidgetList.value[index]=="Date & Time") {
                                    controller.currentOptionTimeDateIndex= index;
                                    return TimeDateContainer(controller: controller,);
                                  } else if(controller.optWidgetList.value[index]=="Delivery Date") {
                                    controller.currentDeliveryDateIndex= index;
                                    return DeliveryDateContainer(controller: controller,);
                                  }
                                  else {
                                    return Container();
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10,right: 7),
                        child: Row(
                          children: [ /* Expanded(

                  child: Card(

                    margin: EdgeInsets.only(right:39),
                    child:
                  ),
                ),*/
                            Expanded(

                              child: Container(
                                padding: EdgeInsets.only(left: 10,right: 10),
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

                                      width:MediaQuery.of(context).size.width*0.5,

                                      child: Center(
                                        child: DropdownButton<String>(
                                          hint:  Text("Add An  Option"),
                                          value: controller.selectedOption.value,
                                          onChanged:(v) {


                                            controller.selectedOption.value = v!;

                                             // controller.addOptWidget(OptModel(controller.selectedOption.value!, CheckBoxContainer(controller: controller),"yes"));
                                            controller.addCheckBx(v);
                                            // print(v);
                                          },
                                          items:controller.optionsproductlist.
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

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList())



      ),


    );
  }
}
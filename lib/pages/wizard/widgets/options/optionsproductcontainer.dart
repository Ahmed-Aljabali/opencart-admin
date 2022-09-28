import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:opencart/model/option_model.dart';
import 'package:opencart/model/porducts/product.dart';
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
    return Obx(() =>ExpansionPanelList(
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
                      style: const TextStyle(fontSize: 20,),
                      textAlign: TextAlign.center,
                    ));
              }),
              body: Container(
                margin: const EdgeInsets.only(bottom: 10, left: 5),
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
                                if(controller.optWidgetList[index].optType=="date") {
                                  controller.currentOptionDateIndex = index;
                                     return controller.optWidgetList[index].optModelList;
                                } else if(controller.optWidgetList[index].optType=="checkbox") {
                                  controller.currentOptionCheckIndex= index;
                                  return controller.optWidgetList[index].optModelList;
                                }
                                else if(controller.optWidgetList[index].optType=="datetime") {
                                  controller.currentOptionTimeDateIndex= index;
                                     return controller.optWidgetList[index].optModelList;
                                } else if(controller.optWidgetList[index].optType=="Delivery Date") {
                                  controller.currentDeliveryDateIndex= index;
                                  return controller.optWidgetList[index].optModelList;
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
                      padding: const EdgeInsets.only(top: 10,right: 7),
                      child: Row(
                        children: [
                          Expanded(

                            child: Container(
                              padding: const EdgeInsets.only(left: 10,right: 10),
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

                                  child:SizedBox(
                                    width:MediaQuery.of(context).size.width*0.5,
                                    child: Center(
                                      child: FutureBuilder<List<ProductOption>>(
                                              future:controller.initProductOptions(),
                                              builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                              var data = snapshot.data!.obs.value;
                                              return DropdownButton<ProductOption>(
                                                hint:  const Text("Add An  Option"),
                                              value:controller.selectedOption.value,
                                              icon: const Icon(Icons.keyboard_arrow_down),
                                                items:data.
                                                map<DropdownMenuItem<ProductOption>>((ProductOption value) {
                                                  return   DropdownMenuItem<ProductOption>(
                                                    enabled: true,
                                                    value: value,
                                                    child: Text(value.type),
                                                  );
                                                }).toList(),

                                                onChanged:(v) {
                                                  if(v?.type=="date") {
                                                    controller.addOptWidget(OptModel(v!.type, DateContainer(controller: controller),"yes"));

                                                  } else if(v?.type=="checkbox") {
                                                    controller.addOptWidget(OptModel(v!.type, CheckBoxContainer(controller: controller),"yes"));

                                                  }
                                                  else if(v?.type=="datetime") {
                                                    controller.addOptWidget(OptModel(v!.type, TimeDateContainer(controller: controller),"yes"));

                                                  } else if(v?.type=="Delivery Date") {
                                                    controller.addOptWidget(OptModel(controller.selectedOption.value?.type, DeliveryDateContainer(controller: controller),"yes"));

                                                  }
                                                  controller.prod.productOption?.add(
                                                      ProductOption(type: v?.type,
                                                          optionId: v?.optionId,
                                                          required: v?.required,
                                                        productOptionValue: controller.productOptionValue
                                                      ));
                                                },
                                              );
                                              }
                                              else {
                                              return const CircularProgressIndicator();
                                              }
                                              },
                                              )

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



    );
  }
}
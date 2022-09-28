import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/core/constrants/widgetconstrant.dart';
import '../../../../controllers/wizard_controller.dart';
import '../../../../model/ProductData.dart';





class ThirdProductContainer extends StatelessWidget {
  final WizardController controller;

   const ThirdProductContainer({Key? key, required this.controller}):super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          controller.genrlproduct3[panelIndex].isExpanded!.value =
              !isExpanded;
        },
        children: controller.genrlproduct3.map<ExpansionPanel>((Product item) {
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

                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [

                    MyTextFieldWidget(hintText: 'price', onChanged: (value)=>print(value),),

                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 47,
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
                                  hint:  const Text("فئة الضريبة"),
                                  value: controller.selectedtaxCategOptions.value,
                                  onChanged:(v) {


                                    controller.selectedtaxCategOptions.value = v!;


                                    // print(v);
                                  },
                                  items:controller.taxCategOptionsList.
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
                      ), /*TextDropdownFormField(

                        options: controller.taxCategOptionsList,
                        decoration: CategInputDecoration,
                        dropdownHeight: controller.taxCategOptionsList.length * 50,
                      ),*/
                    ),
                  ],
                ),
              ),
              isExpanded: item.isExpanded!.value);
        }).toList()));
  }
}
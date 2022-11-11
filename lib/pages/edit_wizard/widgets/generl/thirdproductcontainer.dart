import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/core/constrants/widgetconstrant.dart';
import '../../../../controllers/edit_wizard_controller.dart';
import '../../../../controllers/system_info_controller.dart';
import '../../../../controllers/wizard_controller.dart';
import '../../../../model/ProductData.dart';
import '../../../../model/system_info/init_system.dart';

class ThirdProductContainer extends GetView<EditWizardController> {

  var initSystem=Get.put(SystemINfoController());

  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    initSystem.fetchInitSystem();

    return super.createElement();
  }
  @override
  Widget build(BuildContext context) {

    return Obx(() => ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          controller.genrlproduct3[panelIndex].isExpanded!.value =
              !isExpanded;
        },
        children: controller.genrlproduct3.map<ExpansionPanel>((Product item) {
          return ExpansionPanel(
              backgroundColor: Colors.white,
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

                    DynamicTextFieldWidget(
                      controller:  controller.price,
                      keyboardType: TextInputType.  number,
                        hintText: 'price',
                      onFieldSubmitted: (v){

                      },
                    ),

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
          child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child:

          initSystem.isDataLoading.value==false?
          CircularProgressIndicator():
          Center(
          child: DropdownButton<TaxClasses>(
          alignment: AlignmentDirectional.bottomCenter,
          underline: Container(color: Colors.transparent),
          hint: const Text("فئة الضربية"),
          value: initSystem.selectTax.value,
          onChanged: (v) {
          initSystem.selectTax.value=v;
          controller.prod.taxClassId=v!.taxClassId;
          },
          items: initSystem.taxClass
              .map<DropdownMenuItem<TaxClasses>>(
          (TaxClasses value) {
          return DropdownMenuItem<TaxClasses>(
          value: value,
          child: Text(value.title),
          );
          }).toList(),
          ),
          ),
          )
                      ), /*TextDropdownFormField(

                        options: controller.taxCategOptionsList,
                        decoration: CategInputDecoration,
                        dropdownHeight: controller.taxCategOptionsList.length * 50,
                      ),*/
                    ),
                      )
                    )
                  ],
                ),
              ),
              isExpanded: item.isExpanded!.value);
        }).toList()));
  }
}
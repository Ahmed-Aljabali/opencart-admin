import 'dart:ui';



import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:opencart/model/attr_model.dart';

import '../../../../controllers/wizard_controller.dart';
import '../../../../core/constrants/text_constrants.dart';
import '../../../../core/constrants/widgetconstrant.dart';
import '../../../../model/ProductData.dart';



class FirstProductAttributeContainer extends GetView<WizardController> {

  @override
  Widget build(BuildContext context) {
    controller.textEditingController.add(TextEditingController());
    return Obx(() => Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.attributeproduct1[panelIndex].isExpanded!.value =
            !isExpanded;
          },
          children: controller.attributeproduct1.map<ExpansionPanel>((Product item) {
            return ExpansionPanel(
                backgroundColor: Colors.white,
                canTapOnHeader: true,
                headerBuilder: ((context, isExpanded) {
                  return ListTile(
                      title: Text(
                        item.header!,
                        style: TextStyle(fontSize: 20,),
                        textAlign: TextAlign.center,
                      ));
                }),
                body: Expanded(

                  child: Container(
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    margin: const EdgeInsets.only(bottom: 10, left: 5),
                    width:  MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                 height:controller.attrWidgetList.length.toDouble()*55 ,

                                child:  ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.attrWidgetList.length,
                                  itemBuilder: (context, index) {
                                    return Container(

                                      padding: const EdgeInsets.only(top: 1,bottom: 1),
                                      child: Row(

                                        children: [
                                          Expanded(
                                            child:DynamicTextFieldWidget(
                                              hintText: "اضافة",
                                              controller:  controller.textEditingController[index],

                                              keyboardType: TextInputType.text,
                                              onFieldSubmitted: (String value) {  },

                                            ), /*MyTextFieldWidget(


                                              onChanged: (value) {controller.testofatrr.add(value);
                                              print(controller.testofatrr[index]);},
                                              hintText: ' $index إضافة',

                                            ),*/
                                          ),

                                          Container(

                                            height: 51,
                                            alignment: Alignment.center,
                                            child: Container(


                                              padding: const EdgeInsets.only(left: 1,right: 1),
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
                                                        hint:  const Text("الميزة"),
                                                        value: controller.attrWidgetList[index].attrSelected,
                                                        onChanged:(v) {
                                                          controller.attrWidgetList[index].attrSelected = v!;},
                                                        items:controller.attrWidgetList[index].attrList.
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
                                          RawMaterialButton  (

                                            elevation: 1.0,

                                            shape: CircleBorder(),
                                            fillColor: Colors.blueAccent,
                                            onPressed: (){
                                              String s = "$index ";

                                                     controller.attrWidgetList.length==1 ? {
                                                         controller.attrWidgetList
                                                          .clear(),controller.testofatrr.clear(),
                                                          controller.index = 0,controller.myController.clear()

                                                    }
                                                  :index==0?controller.removeAttribWidget(index+1):controller.removeAttribWidget(index);


                                              },
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                            constraints: BoxConstraints.tightFor(
                                              width: 30.0,
                                              height: 30.0,
                                            ),
                                          ),

                                        ],),
                                    ); ;
                                      },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                               child: const Icon(Icons.add,color: Colors.white,size: 35,),
                            color: Colors.blueAccent,
                            textColor: Colors.blueAccent,
                            onPressed: () {
              //                controller.addAttribWidget(AttrModel(["ميزة1", "ميزة2", "ميزة3"], "ميزة1"),controller.myController.text);
                              controller.addAttribWidget(AttrModel(["ميزة1", "ميزة2", "ميزة3"], "ميزة1"),controller.myController.text);
                              controller.textEditingController.add(TextEditingController(text: controller.myController.text));

                            },

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList()),
    ));
  }
}
/*
 Expanded(
                child: SizedBox(
                  height: 200.0,
                  child:  ListView.builder(

                    itemCount: controller.attrWidgetList.length,
                    itemBuilder: (context, index) {
                      String s = '$index ffsdf';
                      return  CustomTextFiled(s) ;


                    },
                  ),
                ),
              ),*/ // the expanded widgent on the attribute widget
/*
Container(
margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
width: MediaQuery.of(context).size.width * 0.9,
child: Column(
children: [

Row(
children: <Widget>[
Expanded(
child: SizedBox(
height: 300.0,
child:  ListView.builder(
shrinkWrap: false,
itemCount: controller.attrWidgetList.length,
itemBuilder: (context, index) {
String s = '$index ffsdf';
return  CustomTextFiled(s) ;


},
),
),
),
],
),
MaterialButton(
color: Colors.grey,
textColor: Colors.blueAccent,
onPressed: () {

controller.setAttrWidgetList("dd");

},
),
],
),
);*/// the whole container mohd adnan worked

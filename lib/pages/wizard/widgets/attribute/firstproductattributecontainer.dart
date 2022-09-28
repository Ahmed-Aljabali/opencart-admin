import 'dart:ui';



import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:opencart/model/attr_model.dart';
import 'package:opencart/model/porducts/attribute.dart';

import '../../../../controllers/wizard_controller.dart';
import '../../../../core/constrants/widgetconstrant.dart';
import '../../../../model/ProductData.dart';


class FirstProductAttributeContainer extends StatelessWidget {
   FirstProductAttributeContainer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WizardController controller;


  @override
  Widget build(BuildContext context) {
  var text;
    List<TextEditingController> controllersText = [];

    return Obx(() => ExpansionPanelList(

        expansionCallback: (panelIndex, isExpanded) {
          controller.attributeproduct1[panelIndex].isExpanded!.value =
          !isExpanded;
        },
        children: controller.attributeproduct1.map<ExpansionPanel>((Product item) {
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
              body: Expanded(

                child: Container(

                  padding:const EdgeInsets.only(top: 5,bottom: 5),
                  margin:const EdgeInsets.only(bottom: 10, left: 5),
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
                                  final controllers3 = TextEditingController();

                                  return Container(

                                    padding:const EdgeInsets.only(top: 1,bottom: 1),
                                    child: Row(

                                      children: [

                                        Expanded(
                                          child:  DecoratedBox(
                                              decoration: BoxDecoration(

                                                  color:Colors.white60, //background color of dropdown button
                                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                                  boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                                    //blur radius of shadow
                                                  ]
                                              ),

                                              child:Container(
                                                margin: const EdgeInsets.only(left: 5),

                                                child: Center(
                                                  child: MyTextFieldWidget(
                                                    onChanged: (value) {
                                                      controller.textAttribute.add(value);
                                                    },

                                                    hintText: ' $index إضافة',
                                                  )
                                                ),
                                              )
                                          )
                                          ,

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
                                                    boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                                      BoxShadow(
                                                          color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                                          blurRadius: 3) //blur radius of shadow
                                                    ]
                                                ),
                                                child:Center(
                                                  child: FutureBuilder<List<Attribute>>(
                                                    future:controller.initAttribute(),
                                                    builder: (context, snapshot) {
                                                      if (snapshot.hasData) {
                                                        var data = snapshot.data!.obs.value;
                                                        return DropdownButton<Attribute>(
                                                          hint:  const Text("الميزه"),
                                                          //value:controller.selectedAttribute.obs.value.,
                                                          icon: const Icon(Icons.keyboard_arrow_down),
                                                          items:data.
                                                          map<DropdownMenuItem<Attribute>>((Attribute value) {
                                                            return   DropdownMenuItem<Attribute>(
                                                              enabled: true,
                                                              value: value,
                                                              child: Text(value.name!),
                                                            );
                                                          }).toList(),

                                                          onChanged:(v) {

                                                          },

                                                        );
                                                      }
                                                      else {
                                                        return const CircularProgressIndicator();
                                                      }
                                                    },
                                                  ),
                                                )
                                            ),
                                          ),
                                        ),
                                        RawMaterialButton  (
                                          elevation: 1.0,
                                          shape: const CircleBorder(),
                                          fillColor: Colors.blueAccent,
                                          onPressed: (){
                                            String s = "$index ";
                                            controller.removeAttribWidget(index);
                                            String s2 = "$index ";

                                            },
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                          constraints: const BoxConstraints.tightFor(
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
                      child:  const Icon(Icons.add,color: Colors.white,size: 35,),
                          color: Colors.blueAccent,
                          textColor: Colors.blueAccent,
                          onPressed: () {
                           print(text);
                            controller.addAttribWidget(AttrModel(text, "ميزة1"));


                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              isExpanded: item.isExpanded!.value);
        }).toList()));
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

import 'dart:ui';


import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/wizard_controller.dart';
import '../../../../core/constrants/text_constrants.dart';
import '../../../../core/constrants/widgetconstrant.dart';
import '../../../../model/ProductData.dart';
import '../../../mainproductpage/widgets/custom_list_title.dart';


class FirstProductAttributeContainer extends StatelessWidget {
  const FirstProductAttributeContainer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Obx(() => ExpansionPanelList(
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
                        style: TextStyle(fontSize: 20,),
                        textAlign: TextAlign.center,
                      ));
                }),
                body: Container(
                  margin: EdgeInsets.only(bottom: 10, left: 5),
                  width:  MediaQuery.of(context).size.width,
                  child: Column(
                    children: [

                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                               height:controller.attrWidgetList.length.toDouble()*50 ,

                              child:  ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.attrWidgetList.length,
                                itemBuilder: (context, index) {
                                  String s = '$index اضافة';
                                  return Row(

                                    children: [
                                      Expanded(
                                        child: MyTextFieldWidget(
                                          hintText: 'إضافة',
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      Expanded(

                                        child:  TextDropdownFormField(


                                          options: controller.featureOptionsList,
                                          decoration: InputDecoration(

                                              hintText: "الميزة",
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(

                                                borderSide:
                                                BorderSide(color: Colors.grey, width: 2.0),
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(32.0)),
                                              ),
                                              contentPadding:
                                              EdgeInsets.only(left: 15, right: 29),
                                              suffixIcon: Icon(Icons.arrow_drop_down),
                                              labelText: "الميزة",

                                              alignLabelWithHint: true),
                                          dropdownHeight: controller.featureOptionsList.length * 50,
                                        ),
                                      ),
                                      RawMaterialButton(

                                        elevation: 1.0,

                                        shape: CircleBorder(),
                                        fillColor: Colors.blueAccent,
                                        onPressed: (){    controller.removeAttribWidget(index);},
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
                                     /* Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[

                                          FloatingActionButton(
                                              heroTag: "tag4",
                                              backgroundColor: Colors.lightBlue,
                                              child: Text("Add"),

                                              onPressed: () {}),
                                        ],
                                      ),*/
                                     /* MaterialButton(onPressed: (){}  , child:Icon(Icons.close,color: Colors.white,) ,color: Colors.green,)*/
                        
                                    ],); ;
                                    },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: MaterialButton(
child: Icon(Icons.add,color: Colors.white,size: 35,),
                          color: Colors.blueAccent,
                          textColor: Colors.blueAccent,
                          onPressed: () {

                            controller.addAttribWidget("dd");

                          },
                        ),
                      ),
                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList())),
    );
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

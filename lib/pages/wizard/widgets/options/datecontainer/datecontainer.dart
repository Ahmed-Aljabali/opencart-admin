import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:opencart/pages/wizard/widgets/options/checkboxcontainer/widgets/buttomsheetcontainer.dart';
import 'package:opencart/pages/wizard/widgets/options/checkboxcontainer/widgets/checkboxrequiredoptionpicker.dart';
import 'package:opencart/pages/wizard/widgets/options/datecontainer/widgets/daterequiredoptionpicker.dart';

import '../../../../../controllers/wizard_controller.dart';
import '../../../../../core/constrants/text_constrants.dart';
import '../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../model/ProductData.dart';





class DateContainer extends StatelessWidget {
  const DateContainer({

    required this.controller,
  }) ;

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(


      child:  Obx(() =>ExpansionPanelList(

          expansionCallback: (panelIndex, isExpanded) {
            controller.datecontainertitle[panelIndex].isExpanded!.value =
            !isExpanded;
          },
          dividerColor: Colors.blueAccent,
          children: controller.datecontainertitle.map<ExpansionPanel>((Product item) {
            return ExpansionPanel(

                backgroundColor: Colors.grey[200],
                canTapOnHeader: true,
                headerBuilder: ((context, isExpanded) {
                  return ListTile(
                    leading: InkWell(child: Icon(Icons.remove), onTap: (){controller.removeOptWidget(controller.currentOptionDateIndex);},),

                      title: Text(
                        item.header!,
                        style: TextStyle(fontSize: 20,),
                        textAlign: TextAlign.center,
                      ));
                }),
                body: Container(

                  margin: EdgeInsets.only(bottom: 10, left: 5),


                  child: Column(

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /*RawMaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            elevation: 1.0,


                            fillColor: Colors.blueAccent,
                            onPressed: (){},
                            child: Icon(

                              Icons.close,
                              color: Colors.white,
                              size: 20.0,
                            ),

                            constraints: BoxConstraints.tightFor(
                              width: 25.0,
                              height: 25.0,
                            ),
                          ),*/


                          Expanded(
                              child:DateRequiredOptionPicker( controller: controller)),
                          SizedBox(width: 2,),
                          Container(
                            padding: EdgeInsets.only(right:5,),


                            child:Text('مطلوب',style: TextStyle(fontSize: 20,),textAlign: TextAlign.right,),
                          ),


                        ],
                      ),
                      SizedBox(height: 5,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /*RawMaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            elevation: 1.0,


                            fillColor: Colors.blueAccent,
                            onPressed: (){},
                            child: Icon(

                              Icons.close,
                              color: Colors.white,
                              size: 20.0,
                            ),

                            constraints: BoxConstraints.tightFor(
                              width: 25.0,
                              height: 25.0,
                            ),
                          ),*/


                          Expanded(
                              child:TextField(


                                onTap: () {
                                  controller.chooseOptionDate();
                                },
                                textAlign: TextAlign.center,
                                readOnly: true,
                                decoration: InputDecoration(
                                  fillColor:Colors.white60, //background color of dropdown button

                                  prefixIcon: Icon(
                                    Icons.date_range_rounded,
                                    color: Colors.blueAccent,
                                  ),
                                  hintText: DateFormat("dd-MM-yyyy")
                                      .format(controller.selectedOptionDate.value)
                                      .toString(),
                                  hintStyle: TextStyle(
                                    fontSize: 19,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 40.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
                              ),),
                          SizedBox(width: 2,),
                          Container(
                            padding: EdgeInsets.only(right:5,),


                            child:Text('حدد التاريخ',style: TextStyle(fontSize: 20,),textAlign: TextAlign.right,),
                          ),


                        ],
                      ),


                       //date
            // add material button



                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList())



      ),


    );
  }
}







/*
Expanded(
child: Card(

margin: EdgeInsets.only(right:39),
child: Row(
children: [



Expanded(
child: DropdownButton<String>(
alignment : AlignmentDirectional.bottomCenter,
underline: Container(width:MediaQuery.of(context).size.width,color:Colors.transparent),
disabledHint:Text('required'),
hint: const Text("Required"),
value: controller.selectedCheckBoxChooseOption.value,
onChanged:(v) {
controller.selectedCheckBoxChooseOption.value = v.toString() ;


// print(v);
},
items:controller.optioncheckchoose.
map<DropdownMenuItem<String>>((String value) {
return   DropdownMenuItem<String>(

value: value,
child: Text(value),
);
}).toList(),
),
),
Container(


child:    Text("قابل للضريبة"),),
],
),
),
),*/ // the expanded

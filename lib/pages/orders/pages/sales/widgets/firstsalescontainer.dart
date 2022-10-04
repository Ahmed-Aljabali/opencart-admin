import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/order_controller.dart';
import 'package:opencart/core/utils/math_utils.dart';
import '../../../../../controllers/wizard_controller.dart';
import '../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../model/ProductData.dart';


class FirstSalesContainer extends StatelessWidget {
  final BaseController controller;

  const FirstSalesContainer ({
    Key? key,
    required this.controller,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {



    return  Obx(() {
  return ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          controller.salesExpansionTitle1[panelIndex].isExpanded!.value =
          !isExpanded;
        },
        children: controller.salesExpansionTitle1.map<ExpansionPanel>((Product item) {
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
              body: Container(
                /* padding: EdgeInsets.only(
                      top: 10, bottom: 10, right: 10, left: 10),*/
                margin:
                const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    MyTextFieldWidget(hintText:  "فاتورة ", onChanged:(value)=>null,readOnly: true,textAlign: TextAlign.right,),
                    Container(color: Colors.white,
                      margin: getMargin(top: 10),
                      alignment: Alignment.center,
                      height: 44,
                      child: Expanded(
                        child: Container(
color: Colors.white,
                                             child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white60, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                                  borderRadius: BorderRadius.circular(5), //border raiuds of dropdown button
                                  boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child:Align(
                                alignment: Alignment.center,
                                child: DropdownButton<String>(
                                  isExpanded: true,

                                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                                  alignment: AlignmentDirectional.bottomEnd,
                                  hint:  const Text("اضافة عميل"),
                                  value: controller.selectedClintOptions.value,
                                  onChanged:(v) {
                                    controller.selectedClintOptions.value = v!;},
                                  items:controller.clintOptionsList.
                                  map<DropdownMenuItem<String>>((String value) {
                                    return   DropdownMenuItem<String>(
                                      alignment: AlignmentDirectional.center,
                                      enabled: true,
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Expanded(
                            child:Container(

                              height: 60,
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.white,
                                child: TextField(



                                  onTap: () {
                                    controller.chooseOptionDate();
                                  },
                                  textAlign: TextAlign.center,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    fillColor:Colors.white60, //background color of dropdown button

                                    prefixIcon: const Icon(
                                      Icons.date_range_rounded,
                                      color: Colors.blueAccent,
                                    ),
                                    hintText: DateFormat("dd-MM-yyyy")
                                        .format(controller.selectedOptionDate.value)
                                        .toString(),
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey, width: 0.5),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey, width: 1.0),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),),
                          Expanded(
                            child: MyTextFieldWidget(hintText: "رقم الفاتورة", onChanged: (value) {  },),
                          ),




                        ],
                      ),
                    ),


                  ],
                ),
              ),
              isExpanded: item.isExpanded!.value);
        }).toList());
});
  }
}


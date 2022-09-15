import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../../controllers/wizard_controller.dart';
import '../../../../model/ProductData.dart';
import 'fothproductcontainer.dart';


class FifhProductScreen extends StatelessWidget {
  const FifhProductScreen({
    required this.controller,
  });

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Obx(() =>
          ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.genrlproduct5[panelIndex].isExpanded!.value =
                !isExpanded;
          },
          children: controller.genrlproduct5.map<ExpansionPanel>((Product item) {
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
                  /* padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 10),*/
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                  child: Column(
                    children: [
                      LSwitchListTile(
                        isChecked: controller.isSwitchedOn2.value,
                        listSwitchFun: (b) {
                          controller.isSwitchedOn2.value = b;
                        },
                        listSwitchText: '1قابل للشحن',
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "الطول",
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "العرض",
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'الارتفاع',
                          hintStyle: TextStyle(
                            fontSize: 17,
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextDropdownFormField(
                        options: controller.unintOptionsList,
                        decoration: InputDecoration(
                            hintText: " وجدة القياس ",
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
                            labelText: "وجدة القياس",
                            alignLabelWithHint: false),
                        dropdownHeight: controller.unintOptionsList.length * 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'الوزن',
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextDropdownFormField(
                        options: controller.weightOptionsList,
                        decoration: InputDecoration(
                            hintText: " فئة الوزن",
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
                            labelText: "فئة الوزن ",
                            alignLabelWithHint: false),
                        dropdownHeight: controller.weightOptionsList.length * 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextDropdownFormField(
                        options: controller.statuesOptionsList,
                        decoration: InputDecoration(
                            hintText: "الحالة",
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
                            labelText: "الحالة",
                            alignLabelWithHint: false),
                        dropdownHeight: controller.statues2OptionsList.length * 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextDropdownFormField(
                        options: controller.orderOptionsList,
                        decoration: InputDecoration(
                            hintText: "امر الترتيب",
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
                            labelText: "امر الترتيب",
                            alignLabelWithHint: false),
                        dropdownHeight: controller.orderOptionsList.length * 50,
                      ),
                      /*  Container(
                        constraints: BoxConstraints(maxWidth: 250),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Dropdown with  Hint',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.blueGrey)),
                            Container(
                              margin: EdgeInsets.only(left: 16, right: 16),
                              child: Card(
                                  child: DropdownButton<String>(
                                hint: const Text('Choose'),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownNames = newValue;
                                  });
                                },
                                value: dropdownNames,
                                items: <String>[
                                  'Sara',
                                  'Jaad',
                                  'Rama',
                                  'Ali'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                        margin:
                                            EdgeInsets.only(left: 4, right: 4),
                                        child: Text(value,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blueGrey))),
                                  );
                                }).toList(),
                              )),
                            ),
                          ],
                        ),
                      ),*/ //dropdownlist
                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList())),
    );
  }
}

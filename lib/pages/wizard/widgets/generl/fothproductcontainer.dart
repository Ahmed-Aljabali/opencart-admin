import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/wizard_controller.dart';
import '../../../../model/ProductData.dart';



class ForthProductContainer extends StatelessWidget {
  const ForthProductContainer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Obx(() => ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.genrlproduct4[panelIndex].isExpanded!.value =
                !isExpanded;
          },
          children: controller.genrlproduct4.map<ExpansionPanel>((Product item) {
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
                  margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "الكمية",
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
                          hintText: "الحد الادنى للكمية",
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
                      LSwitchListTile(
                        isChecked: controller.isSwitchedOn.value,
                        listSwitchFun: (b) {
                          controller.isSwitchedOn.value = b;
                        },
                        listSwitchText: 'Subact Stoc',
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      TextDropdownFormField(
                        options: controller.statuesOptionsList,
                        decoration: InputDecoration(
                            hintText: "جالة نفاذ المخزون",
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
                            labelText: "جالة نفاذ المخزون",
                            alignLabelWithHint: false),
                        dropdownHeight: controller.statuesOptionsList.length * 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /*  DropDownMultiSelect(
                        options: controller.options,
                        whenEmpty: 'حالة نفاذ المخزون',
                        onChanged: (value) {
                          controller.selectedOptionList.value = value;
                          controller.selectedOption.value = "";
                          controller.selectedOptionList.value;

                          controller.selectedOption.value =
                              controller.selectedOption.value;
                        },
                        selectedValues: controller.selectedOptionList.value,
                      ),*/

                      Text(
                        "التاريخ المتاح",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextField(
                        onTap: () {
                          controller.chooseDate();
                        },
                        textAlign: TextAlign.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.date_range_rounded,
                            color: Colors.blueAccent,
                          ),
                          hintText: DateFormat("dd-MM-yyyy")
                              .format(controller.selectedDate.value)
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
                      ), //datepicker
                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList())),
    );
  }
}

class LSwitchListTile extends GetView<WizardController> {
  var listSwitchText;
  bool isChecked;

  Function listSwitchFun;

  LSwitchListTile(
      {required this.listSwitchText,
      required this.listSwitchFun(bool b),
      required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SwitchListTile(
        hoverColor: Colors.blueAccent,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          listSwitchText,
          style: TextStyle(fontSize: 18),
        ),
        value: isChecked,

        onChanged: (bool value) => listSwitchFun(value),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/order_controller.dart';
import '../../../../../controllers/wizard_controller.dart';
import '../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../core/utils/math_utils.dart';
import '../../../../../model/ProductData.dart';
import '../../../../wizard/widgets/generl/fothproductcontainer.dart';


class FifthSalesContainer extends StatelessWidget {
  final BaseController controller;

  const FifthSalesContainer ({
    Key? key,
    required this.controller,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {



    return  Obx(() {
      return ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.salesExpansionTitle5[panelIndex].isExpanded!.value =
            !isExpanded;
          },
          children: controller.salesExpansionTitle5.map<ExpansionPanel>((Product item) {
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
                  color: Colors.blueGrey.withOpacity(0.16),
                  /* padding: EdgeInsets.only(
                      top: 10, bottom: 10, right: 10, left: 10),*/
                  margin:
                  const EdgeInsets.only(top: 10, bottom: 10,),
                  width: MediaQuery.of(context).size.width ,
                  child: Column(
                    children: [
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
                                    hint:  const Text("حالة الطلب"),
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
                      SizedBox(height: 15,),
                      Row(crossAxisAlignment :CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Expanded(
                          child: HistoryLSwitchListTile(
                            isChecked: controller.isSwitchedOn.value,
                            listSwitchFun: (b) {
                              controller.isSwitchedOn.value = b;
                            },
                            listSwitchText: 'النشرة الاخبارية',
                          ),
                        ),
                        Expanded(
                          child: HistoryLSwitchListTile(
                            isChecked: controller.isSwitchedOn.value,
                            listSwitchFun: (b) {
                              controller.isSwitchedOn.value = b;
                            },
                            listSwitchText: 'Override',
                          ),
                        ),

                      ],),
                      Container(

                          child: MyTextFieldWidget(hintText: 'تعليق', onChanged: (v){print(v);}))



                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList());
    });
  }
}


class HistoryLSwitchListTile extends GetView<BaseController> {
  var listSwitchText;
  bool isChecked;

  Function listSwitchFun;

  HistoryLSwitchListTile(
      {required this.listSwitchText,
        required this.listSwitchFun(bool b),
        required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      hoverColor: Colors.blueAccent,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        listSwitchText,
        style: const TextStyle(fontSize: 13),
      ),
      value: isChecked,

      onChanged: (bool value) => listSwitchFun(value),
    );
  }
}

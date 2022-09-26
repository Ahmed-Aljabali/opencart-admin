


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/pages/wizard/widgets/discount/widgets/discountbuttomsheetcontainer.dart';
import 'package:opencart/pages/wizard/widgets/discount/widgets/editdiscountbuttomsheetcontainert.dart';
import 'package:opencart/pages/wizard/widgets/options/checkboxcontainer/widgets/buttomsheetcontainer.dart';
import 'package:opencart/pages/wizard/widgets/options/checkboxcontainer/widgets/checkboxrequiredoptionpicker.dart';

import '../../../../../controllers/wizard_controller.dart';
import '../../../../../core/utils/math_utils.dart';
import '../../../../../model/ProductData.dart';

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({
    required this.controller,
  });

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          controller.discount1[panelIndex].isExpanded!.value = !isExpanded;
        },
        dividerColor: Colors.blueAccent,
        children: controller.discount1.map<ExpansionPanel>((Product item) {
          return ExpansionPanel(
              backgroundColor: Colors.white,
              canTapOnHeader: true,
              headerBuilder: ((context, isExpanded) {
                return ListTile(
                  /*  leading: InkWell(
                      child: const Icon(
                        Icons.remove,
                      ),
                      onTap: () {
                        controller.removeOptWidget(
                            controller.currentOptioncheckIndex);
                      },
                    ),*/// leading if you want to delete the expansion panle of the disount
                    title: Text(
                      item.header!,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ));
              }),
              body: Container(
                margin: const EdgeInsets.only(bottom: 10, left: 5),
                child: Column(
                  children: [


                    Container(
                      padding: const EdgeInsets.only(right: 5,top: 10,bottom: 10),

                      child: Center(

                        child: DataTable(


                          dataRowColor:MaterialStateColor.resolveWith((states) {return  const Color.fromARGB(255,255, 255, 255);},),
                          horizontalMargin: 3,
                          headingRowColor: MaterialStateColor.resolveWith((states) {return  const Color.fromARGB(255,238, 238, 238);},),

                          headingTextStyle:  TextStyle(
                            color: const Color.fromARGB(255,30, 102, 160),
                            fontSize:
                              12,

                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w900,
                            height: 2.00,
                          ),
                          dividerThickness: 1,
                          columnSpacing: 10,

                          border: TableBorder.all(color: Colors.black.withOpacity(0.05)),
                          rows: controller.discountDataList
                              .map(((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                InkWell(child: const Icon(Icons.edit),onTap: ()

                                {  }, ),

                              ),
                              DataCell(
                                InkWell(child: const Icon(Icons.remove),onTap: (){controller.removeDiscountModel(element.index);},),
                                /*    RawMaterialButton(
                                            elevation: 1.0,
                                            shape: CircleBorder(),
                                            fillColor: Colors.blueAccent,
                                            onPressed: () {
                                              controller.removeCheckBoxModel(element.index);
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 10.0,
                                            ),
                                            constraints:
                                            BoxConstraints.tightFor(
                                              width: 30.0,
                                              height: 30.0,
                                            ),
                                          ),*/
                              ),

                              DataCell(Text(  element.endDate.toString()   )),
                              DataCell(Text(  element.startDate.toString()  )),
                              DataCell(Text(  element.price.toString()  )),
                              DataCell(Text(  element.priority.toString()   )),
                     DataCell(Text( element.qty.toString()   )),
                          DataCell(Text(element.clintGroup.toString()   )),
                              DataCell(Text( element.index.toString()  )),


                            ],
                          )),
                          )
                              .toList(),
                          columns: const [
                            DataColumn(label: Text('نعديل',textAlign: TextAlign.center,)),
                            DataColumn(label:  Text('حذف',textAlign: TextAlign.center,)),
                            DataColumn(label: Text('تاريخ\nالانتهاء')),
                            DataColumn(label: Text('تاريخ\nالبدء')),
                            DataColumn(label: Text('السعر')),
                            DataColumn(label: Text('الاولوية')),
                            DataColumn(label: Text('الكمية')),
                            DataColumn(label: Text('مجموعة\nالعملاء')),
                            DataColumn(label: Text('vn'))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 5),
                      child: RawMaterialButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all( Radius.circular(10.0))),
                        elevation: 1.0,
                        fillColor: Colors.blueAccent,
                        onPressed: () {
                          showModalBottomSheet<void>(
                            shape:  const RoundedRectangleBorder(
                                borderRadius:  BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20))
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return  ButtomCheetDiscountContainer(


                                  controller: controller);
                            },
                          );
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        constraints: BoxConstraints.tightFor(
                          width: MediaQuery.of(context).size.width,
                          height: 40.0,
                        ),
                      ),
                    ), // add material button
                  ],
                ),
              ),
              isExpanded: item.isExpanded!.value);
        }).toList()));
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

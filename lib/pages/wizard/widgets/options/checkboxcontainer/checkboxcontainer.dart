


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/pages/wizard/widgets/options/checkboxcontainer/widgets/buttomsheetcontainer.dart';
import 'package:opencart/pages/wizard/widgets/options/checkboxcontainer/widgets/checkboxrequiredoptionpicker.dart';

import '../../../../../controllers/wizard_controller.dart';
import '../../../../../core/utils/math_utils.dart';
import '../../../../../model/ProductData.dart';

class CheckBoxContainer extends StatelessWidget {
    const CheckBoxContainer({
    required this.controller,
  });


  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    var index;
    return Obx(() => ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          index = panelIndex;
          controller.checkBox[panelIndex].isExpanded!.value = !isExpanded;
        },
        dividerColor: Colors.blueAccent,
        children: controller.checkBox.map<ExpansionPanel>((Product item) {
          return ExpansionPanel(
              backgroundColor: Colors.grey[200],
              canTapOnHeader: true,
              headerBuilder: ((context, isExpanded) {
                return ListTile(
                    leading: InkWell(
                      child: const Icon(
                        Icons.remove,
                      ),
                      onTap: () {
                        controller.removeOptWidget(controller.currentOptionCheckIndex);
                      },
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        Expanded(
                            child: CheckBoxRequiredOptionPicker(
                                controller: controller,index: index,)),
                        const SizedBox(
                          width: 2,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            right: 5,
                          ),
                          child: const Text(
                            'مطلوب',
                            style:  TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      padding: const EdgeInsets.only(right: 5,top: 10,bottom: 10),

                      child: Center(

                        child: DataTable(


                          dataRowColor:MaterialStateColor.resolveWith((states) {return  const Color.fromARGB(255,255, 255, 255);},),
                          horizontalMargin: 3,
                          headingRowColor: MaterialStateColor.resolveWith((states) {return  const Color.fromARGB(0,248, 248, 248);},),

                          headingTextStyle:  TextStyle(
                            color: const Color.fromARGB(255,30, 102, 160),
                            fontSize:
                              12,

                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w900,
                            height: 3.00,
                          ),
                          dividerThickness: 1,
                          columnSpacing: 10,

                          border: TableBorder.all(color: Colors.black.withOpacity(0.05)),
                          rows: controller.checkBoxDataList
                              .map(((element) => DataRow(
                                      cells: <DataCell>[
                                        DataCell(
                                          InkWell(child: const Icon(Icons.edit),onTap: (){controller.removeCheckBoxModel(element.index);},),

                                        ),
                                        DataCell(
                                          InkWell(child: const Icon(Icons.remove),onTap: (){controller.removeCheckBoxModel(element.index);},),


                                        ),
                                        DataCell(Text(element.weight.toString())),
                                        DataCell(Text(element.qty.toString())),
                                        DataCell(Text(element.tax.toString())),
                                        DataCell(Text(element.price.toString())),
                                        DataCell(Text(element.point.toString())),
                                        DataCell(Text(element.optionValue.toString())),

                                      ],
                                    )),
                              )
                              .toList(),
                          columns: const [
                           DataColumn(label: Text('نعديل',textAlign: TextAlign.center,)),
                           DataColumn(label:  Text('حذف',textAlign: TextAlign.center,)),
                           DataColumn(label: Text('الوزن')),
                           DataColumn(label: Text('الكمية')),
                           DataColumn(label: Text('الضريبة')),
                           DataColumn(label: Text('السعر')),
                           DataColumn(label: Text('النقاط')),
                           DataColumn(label: Text(' الاختيار'))
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
                              return  ButtomCheetCheckBoxContainer(


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

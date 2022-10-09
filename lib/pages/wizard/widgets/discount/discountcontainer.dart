import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/pages/wizard/widgets/discount/widgets/firstdiscountbuttomsheetcontainer.dart';
import 'package:opencart/pages/wizard/widgets/discount/widgets/pointsandrawards.dart';
import 'package:opencart/pages/wizard/widgets/discount/widgets/seconddiscountbuttonsheetcontainer.dart';
import '../../../../../controllers/wizard_controller.dart';
import '../../../../../model/ProductData.dart';
class DiscountContainer extends StatelessWidget {
   const DiscountContainer({Key? key,
    required this.controller,
  }) : super(key: key);

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(children: [
      ExpansionPanelList(
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

                    Column(
                      children: [


                        Container(
                          padding: const EdgeInsets.only(right: 5,top: 10,bottom: 10),

                          child: Center(

                            child: DataTable(


                              dataRowColor:MaterialStateColor.resolveWith((states) {return  const Color.fromARGB(255,255, 255, 255);},),
                              horizontalMargin: 3,
                              headingRowColor: MaterialStateColor.resolveWith((states) {return  const Color.fromARGB(255,238, 238, 238);},),

                              headingTextStyle:  const TextStyle(
                                color:  Color.fromARGB(255,30, 102, 160),
                                fontSize:
                                12,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w900,
                                height: 2.00,
                              ),
                              dividerThickness: 1,
                              columnSpacing: 10,

                              border: TableBorder.all(color: Colors.black.withOpacity(0.05)),
                              rows: controller.firstdiscountDataList
                                  .map(((element) => DataRow(
                                cells: <DataCell>[
                                  DataCell(
                                    InkWell(child: const Icon(Icons.edit),onTap: ()

                                    {  }, ),

                                  ),
                                  DataCell(
                                    InkWell(child: const Icon(Icons.remove),onTap: (){controller.removeFirstDiscountModel(element.index);},),

                                  ),

                                  DataCell(Text( element.endDate.toString()   )),
                                  DataCell(Text(  element.startDate.toString()  )),
                                  DataCell(Text(  element.price.toString()  )),
                                  DataCell(Text(  element.priority.toString()   )),
                                  DataCell(Text( element.qty.toString()   )),
                                  DataCell(Text(element.clintGroup.toString()   )),



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
                                  return  FirstButtomCheetDiscountContainer(


                                    );
                                },
                              );
                            },
                            constraints: BoxConstraints.tightFor(
                              width: MediaQuery.of(context).size.width,
                              height: 40.0,
                            ),
                            child: const  Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // add material button
                      ],
                    ),
                  ],
                ),
              ),
              isExpanded: item.isExpanded!.value);
        }).toList()),
      ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.discount2[panelIndex].isExpanded!.value = !isExpanded;
          },
          dividerColor: Colors.blueAccent,
          children: controller.discount2.map<ExpansionPanel>((Product item) {
            return ExpansionPanel(
                backgroundColor: Colors.white,
                canTapOnHeader: true,
                headerBuilder: ((context, isExpanded) {
                  return ListTile(

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

                      Column(
                        children: [


                          Container(
                            padding: const EdgeInsets.only(right: 5,top: 10,bottom: 10),

                            child: Center(

                              child: DataTable(


                                dataRowColor:MaterialStateColor.resolveWith((states) {return  const Color.fromARGB(255,255, 255, 255);},),
                                horizontalMargin: 3,
                                headingRowColor: MaterialStateColor.resolveWith((states) {return  const Color.fromARGB(255,238, 238, 238);},),

                                headingTextStyle:  const TextStyle(
                                  color:  Color.fromARGB(255,30, 102, 160),
                                  fontSize:
                                  12,

                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w900,
                                  height: 2.00,
                                ),
                                dividerThickness: 1,
                                columnSpacing: 10,

                                border: TableBorder.all(color: Colors.black.withOpacity(0.05)),
                                rows: controller.seconddiscountDataList
                                    .map(((element) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(InkWell(child: const Icon(Icons.edit),onTap: () {  }, ),),
                                    DataCell(InkWell(child: const Icon(Icons.remove),onTap: (){controller.removeSecondDiscountModel(element.index);},),),
                                    DataCell(Text( element.endDate.toString()   )),
                                    DataCell(Text(  element.startDate.toString()  )),
                                    DataCell(Text(  element.price.toString()  )),
                                    DataCell(Text(  element.priority.toString()   )),

                                    DataCell(Text(element.clintGroup.toString()   )),



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

                                  DataColumn(label: Text('مجموعة\nالعملاء')),

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
                                    return  SecondButtomCheetDiscountContainer(


                                      );
                                  },
                                );
                              },
                              constraints: BoxConstraints.tightFor(
                                width: MediaQuery.of(context).size.width,
                                height: 40.0,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // add material button
                        ],
                      ),
                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList()),
      ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.discount3[panelIndex].isExpanded!.value = !isExpanded;
          },
          dividerColor: Colors.blueAccent,
          children: controller.discount3.map<ExpansionPanel>((Product item) {
            return ExpansionPanel(
                backgroundColor: Colors.white,
                canTapOnHeader: true,
                headerBuilder: ((context, isExpanded) {
                  return ListTile(
                      title: Text(
                        item.header!,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ));
                }),
                body:PointsAndRewards(),
                isExpanded: item.isExpanded!.value);
          }).toList()),

    ],));
  }
}

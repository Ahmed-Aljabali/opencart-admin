import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/order_controller.dart';
import 'package:opencart/pages/wizard/widgets/options/checkboxcontainer/widgets/buttomsheetcontainer.dart';
import '../../../../../controllers/Init_add_order_controller.dart';
import '../../../../../controllers/wizard_controller.dart';
import '../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../model/ProductData.dart';
import '../../../../wizard/widgets/options/checkboxcontainer/widgets/checkboxrequiredoptionpicker.dart';
import 'addproductbottomsheet.dart';


class SecondSalesContainer1 extends StatelessWidget {
  final InitAddOrderController controller;

  const SecondSalesContainer1   ({
    Key? key,
    required this.controller,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {



    return  Obx(() {
      return ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.salesExpansionTitle2[panelIndex].isExpanded!.value =
            !isExpanded;
          },
          children: controller.salesExpansionTitle2.map<ExpansionPanel>((Product item) {
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
                      MyTextFieldWidget(hintText:  "اسم المنتج", onChanged:(value)=>null),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextFieldWidget(hintText:"وصف المنتج" ,onChanged: (value)=>null,),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextFieldWidget(hintText:"MetaTagTitle" ,onChanged:(value)=>null,),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextFieldWidget(hintText:"Meta Tag Description" ,onChanged:(value)=>null,),
                      const SizedBox(height: 10,),
                      MyTextFieldWidget(hintText:"Meta Tag KeyWord" ,onChanged:(value)=>null,),
                      const SizedBox(height: 10,),
                      MyTextFieldWidget(hintText:"Product Tags" ,onChanged:(value)=>null,),

                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList());
    });
  }
}





class SecondSalesContainer extends StatelessWidget {
  const SecondSalesContainer({
    required this.controller,
  });


  final InitAddOrderController controller;

  @override
  Widget build(BuildContext context) {
    var index;
    return Obx(() => ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          index = panelIndex;
          controller.salesExpansionTitle2[panelIndex].isExpanded!.value = !isExpanded;
        },
        dividerColor: Colors.blueAccent,
        children: controller.salesExpansionTitle2.map<ExpansionPanel>((Product item) {
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
                margin: const EdgeInsets.only(bottom: 10,    ),
                child: Column(
                  children: [


                    Container(
                      padding: const EdgeInsets.only(right: 5,top: 10,bottom: 10),

                      child: Center(

                        child: DataTable(


                          dataRowColor:MaterialStateColor.resolveWith((states) {return  const Color.fromARGB(255,255, 255, 255);},),
                          horizontalMargin: 3,
                          headingRowColor: MaterialStateColor.resolveWith((states) {return Colors.blueGrey.withOpacity(0.16);},),

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
                          rows: controller.addProductDataList
                              .map(((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                InkWell(child: const Icon(Icons.edit),onTap: (){controller.removeProductModel(element.index);},),

                              ),
                              DataCell(
                                InkWell(child: const Icon(Icons.remove),onTap: (){controller.removeProductModel(element.index);},),


                              ),

                              DataCell(Text(element.total.toString())),
                              DataCell(Text(element.unitPrice.toString())),
                              DataCell(Text(element.model.toString())),
                              DataCell(Text(element.qty.toString())),
                              DataCell(Text(element.prodcut.toString())),

                            ],
                          )),
                          )
                              .toList(),
                          columns: const [
                            DataColumn(label: Text('نعديل',textAlign: TextAlign.center,)),
                            DataColumn(label:  Text('حذف',textAlign: TextAlign.center,)),

                            DataColumn(label: Text('المجموع')),
                            DataColumn(label: Text('سعر الوحدة')),
                            DataColumn(label: Text('الموديل')),
                            DataColumn(label: Text('الكمية')),
                            DataColumn(label: Text('المنتج'))
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        padding: const EdgeInsets.only(right: 5),
                        child: RawMaterialButton(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all( Radius.circular(10.0))),
                          elevation: 1.0,
                          fillColor: Colors.grey.withOpacity(0.5),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              shape:  const RoundedRectangleBorder(
                                  borderRadius:  BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20))
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return  ButtomCheetAddProductContainer(


                                    controller: controller);
                              },
                            );
                          },
                          child: const Icon(
                            Icons.add,
                            color: const Color.fromARGB(255,30, 102, 160),
                          ),
                          constraints: BoxConstraints.tightFor(
                            width: MediaQuery.of(context).size.width,
                            height: 40.0,
                          ),
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


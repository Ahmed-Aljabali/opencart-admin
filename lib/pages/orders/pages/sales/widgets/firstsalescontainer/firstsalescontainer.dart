import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:opencart/core/utils/math_utils.dart';
import 'package:opencart/model/cutomers/customer.dart';
import 'package:opencart/model/orders/voucher.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/firstsalescontainer/widgets/addclintbottomsheet.dart';
import '../../../../../../Controllers/customer_controller.dart';
import '../../../../../../controllers/Init_add_order_controller.dart';
import '../../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../../model/ProductData.dart';


class FirstSalesContainer extends GetView<InitAddOrderController> {

  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    controller.initVouchers();
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    var customerController =Get.put(CustomerController());
    return  Obx(() {
  return ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          controller.salesExpansionTitle1[panelIndex].isExpanded!.value =
          !isExpanded;
        },
        children: controller.salesExpansionTitle1.map<ExpansionPanel>((Product item) {
          return ExpansionPanel(
              backgroundColor: Colors.white,
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
                    Center(
                      child: DropdownButton<Vouchers>(
                        hint:  const Text("الفاتورة"),
                        value:controller.selectVoucher.value,
                        onChanged:(v) {
                          controller.selectVoucher.value=v;
                          controller.addOrders.value.voucher=v!.code;
                        },
                        items:controller.dataVoucher.
                        map<DropdownMenuItem<Vouchers>>((Vouchers value) {
                          return   DropdownMenuItem<Vouchers>(
                            enabled: true,
                            value: value,
                            child: Text(value.code!),
                          );
                        }).toList(),
                      ),
                    )
                    ,
                    Container(
                        padding: getPadding(top: 8),
                        height: 51,
                         child: Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(

                            color:Colors.white,

                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const <BoxShadow>[

                            ]
                        ),

                        child:  Center(
                          child: TextField(


                            readOnly: true,
                            onTap: (){
                              showModalBottomSheet<void>(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30))),
                              context: context,
                              builder: (BuildContext context) {
                                return    Expanded(
                                  child: Padding(
                                    padding: getPadding(all: 10),
                                    child: const AddClintForm(),
                                  ),
                                );
                              },
                            );},
                            //controller:  controller.controllers.value,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.add),
                              fillColor:Colors.transparent,
                              hintText:'العميل',
                              hintStyle:  TextStyle(
                                fontSize: 13,
                              ),
                              contentPadding:  EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),

                            ),
                          ),
                        ),
                      ),
                    )
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
                                    // controller.chooseOptionDate();
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



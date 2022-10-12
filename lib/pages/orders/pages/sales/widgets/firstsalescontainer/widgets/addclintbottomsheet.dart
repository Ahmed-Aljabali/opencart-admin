import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/Init_add_order_controller.dart';
import 'package:opencart/controllers/order_controller.dart';
import 'package:opencart/controllers/system_info_controller.dart';
import 'package:opencart/core/utils/math_utils.dart';
import 'package:opencart/model/system_info/order_statuses.dart';

import '../../../../../../../Controllers/customer_controller.dart';
import '../../../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../../../model/cutomers/customer.dart';

class AddClintForm extends GetView<InitAddOrderController> {

  const AddClintForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customerController =Get.put(CustomerController());

    return SingleChildScrollView(
      child: Column(

        children: <Widget>[
          Row(
            children: [
              Container(

                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 25,
                      ))),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'اضافة العميل',
                        style: TextStyle(color: Colors.grey, fontSize: 22,fontFamily: 'Cairo Regular'),
                        textAlign: TextAlign.center,
                      ))),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
            indent: 20,
            endIndent: 15,
          ),
          Row(children: [
            Expanded(
              child: Padding(
                padding:getPadding(top: 15),
                child: Expanded(child:Container()),
              ),
            ),
            Text('العميل', style: TextStyle(fontFamily: 'Cairo Regular'),)
          ],),

          Container(
            padding: const EdgeInsets.only(left: 3),
            child: Expanded(
                child:     Container(color: Colors.white,
                  margin: getMargin(top: 10),
                  alignment: Alignment.center,
                  height: 44,
                  child: Expanded(
                    child: Container(
                      color: Colors.white,
                      child: DecoratedBox(
                          decoration: BoxDecoration(

                              color:Colors.white, //background color of dropdown button
                              border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                              borderRadius: BorderRadius.circular(5), //border raiuds of dropdown button
                              boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1 ), //shadow for button
                                    blurRadius: 3) //blur radius of shadow
                              ]
                          ),
                          child:Center(
                            child: DropdownButton<Customers>(
                              hint:  const Text("حدد عميل"),
                              //   value:controller.selectProd.value,

                              onChanged:(v) {
                                var initName= v!.name.toString().indexOf(" ");
                                var firstName=v.name!.substring(0,initName);
                                var lastName=v.name!.substring(initName).trim();
                                print(firstName);
                                controller.addOrders.value.customer?.customerId=v!.customerid;
                                controller.customer.value.customerId=v?.customerid;
                                controller.customer.value.email=v?.email;
                                controller.customer.value.customerGroupId=v?.customergroupid;
                                controller.customer.value.telephone=v!.telephone;
                                controller.customer.value.firstname=firstName;
                                controller.customer.value.lastname=lastName;


                              },
                              items:customerController.trx.
                              map<DropdownMenuItem<Customers>>((Customers value) {
                                return   DropdownMenuItem<Customers>(
                                  enabled: true,
                                  value: value,
                                  child: Text(value.name!),
                                );
                              }).toList(),
                            ),
                          )
                      ),
                    ),
                  ),
                ),),
          ),
          Container(
            padding: const EdgeInsets.only(left: 3),
            child: Expanded(
              child:     Container(color: Colors.white,
                margin: getMargin(top: 10),
                alignment: Alignment.center,
                height: 44,
                child: Expanded(
                  child: Container(
                    color: Colors.white,
                    child: DecoratedBox(
                        decoration: BoxDecoration(

                            color:Colors.white, //background color of dropdown button
                            border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                            borderRadius: BorderRadius.circular(5), //border raiuds of dropdown button
                            boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1 ), //shadow for button
                                  blurRadius: 3) //blur radius of shadow
                            ]
                        ),
                        child:Center(
                          child: DropdownButton<Customers>(
                            hint:  const Text("حدد عميل"),
                            //   value:controller.selectProd.value,

                            onChanged:(v) {
                              var initName= v!.name.toString().indexOf(" ");
                              var firstName=v.name!.substring(0,initName);
                              var lastName=v.name!.substring(initName).trim();
                              print(firstName);
                              controller.addOrders.value.customer?.customerId=v!.customerid;
                              controller.customer.value.customerId=v?.customerid;
                              controller.customer.value.email=v?.email;
                              controller.customer.value.customerGroupId=v?.customergroupid;
                              controller.customer.value.telephone=v!.telephone;
                              controller.customer.value.firstname=firstName;
                              controller.customer.value.lastname=lastName;


                            },
                            items:customerController.trx.
                            map<DropdownMenuItem<Customers>>((Customers value) {
                              return   DropdownMenuItem<Customers>(
                                enabled: true,
                                value: value,
                                child: Text(value.name!),
                              );
                            }).toList(),
                          ),
                        )
                    ),
                  ),
                ),
              ),),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(children: [
              Expanded(
                child: Padding(
                  padding:getPadding(top: 15),
                  child: Expanded(child:Container()),
                ),
              ),
              Text('معلومات العميل', style: TextStyle(fontFamily: 'Cairo Regular'),)
            ],),
          ),
          Container(
            padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Expanded(
                    child: MyTextFieldWidget(hintText: "اللقب",
                      onChanged: (value) {
                        // controller.filterOrder.value!.date=value;
                      },),
                  ),
                  Expanded(
                      child: MyTextFieldWidget(
                        hintText: 'الاسم الاول',

                        onChanged: (value) {

                          },
                      ),),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Expanded(
                    child: MyTextFieldWidget(hintText: "الايميل",
                      onChanged: (value) {
                        // controller.filterOrder.value!.date=value;
                      },),
                  ),
                  Expanded(
                      child: MyTextFieldWidget(
                        hintText: 'رقم التلفون',

                        onChanged: (value) {},
                      ),),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    child: Text(
                      'الغاء',
                      style: TextStyle(fontSize: 25, color: Colors.grey[800],fontFamily: 'Cairo Regular'),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    minWidth: 100,
                    height: 60,
                    color: Colors.white60,
                    onPressed: () {
                      Get.back();
                    }),
                const SizedBox(
                  width: 50,
                ),
                MaterialButton(
                    child: const Text(
                      'حفظ',
                      style: const TextStyle(fontSize: 25, color: Colors.white,fontFamily: 'Cairo Regular'),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    minWidth: 100,
                    height: 60,
                    color: Colors.green,
                    onPressed: () {
                      Get.back();
                    })
              ],
            ),
          ),

        ],
      ),
    );

  }
}
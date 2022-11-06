
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/porducts_controller.dart';
import 'package:opencart/controllers/wizard_controller.dart';
import 'package:opencart/core/constrants/widgetconstrant.dart';

import '../../../../../Controllers/customer_controller.dart';
import '../../../../../controllers/group_customer_controller.dart';
import '../../../../../model/ProductData.dart';
import '../../../../../model/cutomers/group_customer.dart';




class GeneralFirstCustomerExpantionPanel extends GetView<CustomerController> {

  @override
  Widget build(BuildContext context) {
    final CustomerGroup =Get.put(GroupCustomerController());
    return Obx(() => Column(
      children: [
        ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              controller.customer[panelIndex].isExpanded!.value = !isExpanded;
            },
            children:  controller.customer.map<ExpansionPanel>((Product item) {
              return ExpansionPanel(
                  backgroundColor: Colors.white,
                  canTapOnHeader: true,
                  headerBuilder: ((context, isExpanded) {
                    return ListTile(
                        title: Text(
                          item.header!,
                          style: const TextStyle(fontSize: 20,),
                          textAlign: TextAlign.center,
                        ));
                  }),
                  body: Container(
                    /* padding: EdgeInsets.only(
                          top: 10, bottom: 10, right: 10, left: 10),*/
                    margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          child: Expanded(
                            child: Container(
                                padding: const EdgeInsets.only(left: 1,right: 1),
                                child: DecoratedBox(
                                    decoration: BoxDecoration(

                                        color:Colors.white, //background color of dropdown button
                                        border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                        borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                        boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                          BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                              blurRadius: 3) //blur radius of shadow
                                        ]
                                    ),
                                    child: Text("sasa")
                                ),
                                    // child: Center(
                                    //     child:FutureBuilder<List<Manufacturers>>(
                                    //       future:ProductController().initManufacturers(),
                                    //       builder: (context, snapshot) {
                                    //         if (snapshot.hasData) {
                                    //           var data = snapshot.data!.obs;
                                    //           return DropdownButton<Manufacturers>(
                                    //             hint:  const Text("حدد  العميل"),
                                    //             // value:controller.selectedManufacturers.value,
                                    //             icon: const Icon(Icons.keyboard_arrow_down),
                                    //             items:data.
                                    //             map<DropdownMenuItem<Manufacturers>>((Manufacturers value) {
                                    //               return   DropdownMenuItem<Manufacturers>(
                                    //                 enabled: true,
                                    //                 value: value,
                                    //                 child: Text(value.name!),
                                    //               );
                                    //             }).toList(),
                                    //             onChanged:(v) {
                                    //               WizardController().manufacturersId.value = v?.manufacturerId;
                                    //
                                    //             },
                                    //
                                    //           );
                                    //         }
                                    //         else {
                                    //           return const CircularProgressIndicator();
                                    //         }
                                    //       },
                                    //     )
                                    // ))

                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          child: Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 1,right: 1),
                              child: DecoratedBox(
                                  decoration: BoxDecoration(

                                      color:Colors.white, //background color of dropdown button
                                      border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                      borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                      boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                         BoxShadow(
                                            color:  const Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                            blurRadius: 3) //blur radius of shadow
                                      ]
                                  ),
                                  child: Text("6520"),
                                  // child:Center(
                                  //   child:FutureBuilder<List<Categories>>(
                                  //     future:ProductController().initCategory(),
                                  //     builder: (context, snapshot) {
                                  //       if (snapshot.hasData) {
                                  //         var data = snapshot.data!.obs;
                                  //         return DropdownButton<Categories>(
                                  //           hint:  const Text("مجموعة العميل"),
                                  //           value:WizardController().selectedCategories.value,
                                  //           icon: const Icon(Icons.keyboard_arrow_down),
                                  //           items:data.
                                  //           map<DropdownMenuItem<Categories>>((Categories value) {
                                  //             return   DropdownMenuItem<Categories>(
                                  //               enabled: true,
                                  //               value: value,
                                  //               child: Text(value.name!),
                                  //             );
                                  //           }).toList(),
                                  //
                                  //           onChanged:(v) {
                                  //
                                  //             WizardController().categorieId.value=v?.categoryId;
                                  //
                                  //           },
                                  //         );
                                  //       }
                                  //       else {
                                  //         return const CircularProgressIndicator();
                                  //       }
                                  //     },
                                  //   ),
                                  // )
                              ),
                            ),
                          ),
                        ),




                      ],
                    ),
                  ),
                  isExpanded: item.isExpanded!.value);
            }).toList()),
        ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              controller.custInfo[panelIndex].isExpanded!.value = !isExpanded;
            },
            children:  controller.custInfo.map<ExpansionPanel>((Product item) {
              return ExpansionPanel(

                  backgroundColor: Colors.white,
                  canTapOnHeader: true,
                  headerBuilder: ((context, isExpanded) {
                    return ListTile(
                        title: Text(
                          item.header!,
                          style: const TextStyle(fontSize: 20,),
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
                        Container(
                          padding: const EdgeInsets.only(left: 3,right: 3, top: 15,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              Expanded(
                                child: DynamicTextFieldWidget(
                                  controller: controller.lastName,
                                  hintText: "اللقب",
                                  onFieldSubmitted: (value){

                                },
                                keyboardType: TextInputType.text,
                                ),
                              ),
                              SizedBox(width: 4,),
                              Expanded(
                                child:  DynamicTextFieldWidget(
                                controller: controller.firstName,
                                hintText: "الاسم الاول",
                                onFieldSubmitted: (value){

                                },
                                keyboardType: TextInputType.text,
                              ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 3,right: 3,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              Expanded(
                                child:  DynamicTextFieldWidget(
                                  controller: controller.email,
                                  hintText: "الايميل",
                                  onFieldSubmitted: (value){

                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ), ),
                              SizedBox(width: 4,),
                              Expanded(
                                child:  DynamicTextFieldWidget(
                                  controller: controller.phone,
                                  hintText: "رقم التلفون",
                                  onFieldSubmitted: (value){

                                  },
                                  keyboardType: TextInputType.phone,
                                ),

                                ),

                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 3,right: 3,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: MyTextFieldWidget(obscureText: true,hintText: "تاكيد كلمة المرور", onChanged: (value) {  },keyboardType: TextInputType.emailAddress,),
                              ),
                              SizedBox(width: 4,),
                              Expanded(
                                child:  DynamicTextFieldWidget(
                                  controller: controller.password,
                                  hintText: "كلمة المرور",
                                  onFieldSubmitted: (value){

                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                                ),
                            ],
                          ),
                        ),
                        DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                //background color of dropdown button
                                border:
                                Border.all(color: Colors.black38, width: 0.5),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: <BoxShadow>[
                                  const  BoxShadow(
                                      color: const Color.fromRGBO(0, 0, 0, 0.1),
                                      //shadow for button
                                      blurRadius: 3)
                                  //blur radius of shadow
                                ]),
                            child: Container(
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Center(
                                child: DropdownButton<GroupCustomer>(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  underline: Container(color: Colors.transparent),
                                  hint: const Text("مجموعة العملاء"),
                                  value: controller.selectCustomerGroup.value,
                                  onChanged: (v) {
                                    controller.selectCustomerGroup.value = v!;
                                    controller.postCustomer.customerGroupId=v.customerGroupId;
                                    controller.customerGroupId.value=v.customerGroupId;

                                  },
                                  items: CustomerGroup.itemsList.value
                                      .map<DropdownMenuItem<GroupCustomer>>(
                                          (GroupCustomer value) {
                                        return DropdownMenuItem<GroupCustomer>(
                                          value: value,
                                          child: Text(value.name.toString()),
                                        );
                                      }).toList(),
                                ),
                              ),
                            )),
                        SwitchListTile(
                  title: const Text('   الحالة (فعال/غير فعال'),
                  value: controller.isActive.value,
                  onChanged: (bool value ) {
                    controller.isActive.value = value;
                    controller.postCustomer.status=value?1:0;

                  },
                  secondary:  Icon(Icons.check_circle_sharp, color: controller.isActive.value?Colors.green:null,),
                ),
                        SwitchListTile(
                          title: const Text('اضافة في النشرة الاخبارية'),
                          value: controller.isNewsletterActive.value,
                          onChanged: (bool value ) {
                            controller.isNewsletterActive.value = value;

                            controller.postCustomer.newsletter=value?1:0;

                          },
                          secondary:  Icon(Icons.check_circle_sharp, color: controller.isNewsletterActive.value?Colors.green:null,),
                        ),
                        SwitchListTile(
                          title: const Text('Safe'),
                          value: controller.isSafeActive.value,
                          onChanged: (bool value ) {
                            controller.isSafeActive.value = value;
                            controller.postCustomer.safe=value?1:0;

                          },
                          secondary:  Icon(Icons.check_circle_sharp, color: controller.isSafeActive.value?Colors.green:null,),
                        ),



                      ],
                    ),
                  ),
                  isExpanded: item.isExpanded!.value);
            }).toList()),
      ],
    ));
  }
}
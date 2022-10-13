import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:opencart/core/utils/math_utils.dart';


import '../../../../../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../../../../controllers/Init_add_order_controller.dart';
import '../../../../../../../../model/addproductmodel.dart';

class ButtomCheetAddProductContainer extends GetView<InitAddOrderController> {


  @override
  Widget build(BuildContext context) {
   AddProductDataModel addProductModel;
   final StepperType stepperType = StepperType.horizontal;
      return Obx(() {
  return SizedBox(

        height: MediaQuery.of(context).size.height*0.8,
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
                          'اضافة منتج',
                          style: TextStyle(color: Colors.grey, fontSize: 22),
                          textAlign: TextAlign.center,
                        ))),
              ],
            ),
            Expanded(
              child: Stepper(
                type: stepperType,
                physics:const ClampingScrollPhysics(),
                currentStep: controller.currentStep.value,
                onStepTapped: (step) => controller.tapped(step),
                onStepContinue:
                controller.isVaild.value ? controller.continued : null,
                onStepCancel: controller.cancel,
                steps: <Step>[
                  Step(
                    title:  const Text('المنتجات'),
                    content:SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            margin: getMargin(top: 10,),
                            alignment: Alignment.center,
                            height: 44,
                            child: Expanded(
                              child: Container(
                                color: Colors.white,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors
                                            .white,
                                        border: Border.all(
                                            color: Colors.black38,
                                            width:
                                            1),
                                        borderRadius: BorderRadius.circular(
                                            5),
                                        boxShadow: const <BoxShadow>[

                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.1), //shadow for button
                                              blurRadius:
                                              3)
                                        ]),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        icon: Icon(Icons
                                            .keyboard_arrow_down_outlined),
                                        hint: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "حدد المنتج",
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                        value: controller
                                            .selectedRecieverNameAddProduct
                                            .value,
                                        onChanged: (v) {
                                          controller
                                              .selectedRecieverNameAddProduct
                                              .value = v!;
                                        },
                                        items: controller
                                            .recieverNameAddProductList
                                            .map<
                                            DropdownMenuItem<
                                                String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                alignment:
                                                AlignmentDirectional
                                                    .center,
                                                enabled: true,
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.white,
                                  margin: getMargin(top: 10, bottom: 10),
                                  alignment: Alignment.center,
                                  height: 44,
                                  child: Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Colors
                                                  .white, //background color of dropdown button
                                              border: Border.all(
                                                  color: Colors.black38,
                                                  width:
                                                  1), //border of dropdown button
                                              borderRadius: BorderRadius.circular(
                                                  5), //border raiuds of dropdown button
                                              boxShadow: const <BoxShadow>[
                                                //apply shadow on Dropdown button
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        0,
                                                        0,
                                                        0,
                                                        0.1), //shadow for button
                                                    blurRadius:
                                                    3) //blur radius of shadow
                                              ]),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              icon:  const Icon(Icons
                                                  .keyboard_arrow_down_outlined),
                                              hint: const Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "الوحدة",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                              ),
                                              value: controller
                                                  .selectedCurrenctAddProduct
                                                  .value,
                                              onChanged: (v) {
                                                controller
                                                    .selectedCurrenctAddProduct
                                                    .value = v!;
                                              },
                                              items: controller
                                                  .currencyAddProductList
                                                  .map<
                                                  DropdownMenuItem<
                                                      String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<String>(
                                                      alignment:
                                                      AlignmentDirectional
                                                          .center,
                                                      enabled: true,
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Container(
                                  margin: getMargin(top: 10, bottom: 10),
                                  alignment: Alignment.center,
                                  height: 44,
                                  child: Expanded(
                                    child: MyTextFieldWidget(
                                      hintText: " الكمية",
                                      readOnly: true,
                                      onChanged: (value) => null,
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                          Row(children: [
                            Expanded(child: Container(),),
                            Padding(
                              padding: getPadding(top: 15,right: 3),
                              child: Text('خانة الوحدة',style: TextStyle(color: Colors.blueGrey,fontSize: 17),),
                            )
                          ],),
                          Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(children: [
                                Text('4 (+\$ 100 )',style: TextStyle(fontFamily: 'Cairo Regular', fontSize: 18,color: Colors.grey),),
                                  Checkbox(
                                    checkColor: Colors.green,
                                    activeColor: Colors.white54,
                                    hoverColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                    ),
                                    onChanged: (v) {
                                      v = false;
                                    },
                                    value: false,
                                  ),
                                ],),
                                Row(children: [
                                  Text('1 (+\$ 100 )',style: TextStyle(fontFamily: 'Cairo Regular', fontSize: 18,color: Colors.grey),),
                                  Checkbox(
                                    checkColor: Colors.green,
                                    activeColor: Colors.white54,
                                    hoverColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                    ),
                                    onChanged: (v) {
                                      v = false;
                                    },
                                    value: false,
                                  ),
                                ],),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(children: [
                                  Text('4 (+\$ 100 )',style: TextStyle(fontFamily: 'Cairo Regular', fontSize: 18,color: Colors.grey),),
                                  Checkbox(
                                    checkColor: Colors.green,
                                    activeColor: Colors.white54,
                                    hoverColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                    ),
                                    onChanged: (v) {
                                      v = false;
                                    },
                                    value: false,
                                  ),
                                ],),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(children: [
                                  Text('4 (+\$ 100 )',style: TextStyle(fontFamily: 'Cairo Regular', fontSize: 18,color: Colors.grey),),
                                  Checkbox(
                                    checkColor: Colors.green,
                                    activeColor: Colors.white54,
                                    hoverColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                    ),
                                    onChanged: (v) {
                                      v = false;
                                    },
                                    value: false,
                                  ),
                                ],),
                                Row(children: [
                                  Text('4 (+\$ 100 )',style: TextStyle(fontFamily: 'Cairo Regular', fontSize: 18,color: Colors.grey),),
                                  Checkbox(
                                    checkColor: Colors.green,
                                    activeColor: Colors.white54,
                                    hoverColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                    ),
                                    onChanged: (v) {
                                      v = false;
                                    },
                                    value: false,
                                  ),
                                ],),
                              ],
                            ),

                          ],),
                          Container(
                            margin: getMargin(top: 10, bottom: 10),
                            alignment: Alignment.center,
                            height: 44,
                            child: Expanded(
                              child: MyTextFieldWidget(
                                hintText: " Text",
                                readOnly: true,
                                onChanged: (value) => null,
                              ),
                            ),
                          ),
                          Container(
                            margin: getMargin(top: 10, bottom: 10),
                            alignment: Alignment.center,
                            height: 44,
                            child: Expanded(
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors
                                          .white, //background color of dropdown button
                                      border: Border.all(
                                          color: Colors.black38,
                                          width:
                                          1), //border of dropdown button
                                      borderRadius: BorderRadius.circular(
                                          5), //border raiuds of dropdown button
                                      boxShadow: const <BoxShadow>[
                                        //apply shadow on Dropdown button
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                0,
                                                0,
                                                0,
                                                0.1), //shadow for button
                                            blurRadius:
                                            3) //blur radius of shadow
                                      ]),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      icon:  const Icon(Icons
                                          .keyboard_arrow_down_outlined),
                                      hint: const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "اللون",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      value: controller
                                          .selectedCurrenctAddProduct
                                          .value,
                                      onChanged: (v) {
                                        controller
                                            .selectedCurrenctAddProduct
                                            .value = v!;
                                      },
                                      items: controller
                                          .currencyAddProductList
                                          .map<
                                          DropdownMenuItem<
                                              String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              alignment:
                                              AlignmentDirectional
                                                  .center,
                                              enabled: true,
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                    ),
                                  )),
                            ),
                          ),
                          Container(
                            margin: getMargin(top: 10, bottom: 10),
                            alignment: Alignment.center,
                            height: 70,
                            child: Expanded(
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors
                                          .white, //background color of dropdown button
                                      border: Border.all(
                                          color: Colors.black38,
                                          width:
                                          1), //border of dropdown button
                                      borderRadius: BorderRadius.circular(
                                          5), //border raiuds of dropdown button
                                      boxShadow: const <BoxShadow>[
                                        //apply shadow on Dropdown button
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                0,
                                                0,
                                                0,
                                                0.1), //shadow for button
                                            blurRadius:
                                            3) //blur radius of shadow
                                      ]),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      icon:  const Icon(Icons
                                          .keyboard_arrow_down_outlined),
                                      hint: const Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Textarea",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      value: controller
                                          .selectedCurrenctAddProduct
                                          .value,
                                      onChanged: (v) {
                                        controller
                                            .selectedCurrenctAddProduct
                                            .value = v!;
                                      },
                                      items: controller
                                          .currencyAddProductList
                                          .map<
                                          DropdownMenuItem<
                                              String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              alignment:
                                              AlignmentDirectional
                                                  .center,
                                              enabled: true,
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                    ),
                                  )),
                            ),
                          ),
                          Padding(
                            padding:getPadding(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    Container(
                                      padding: getPadding(bottom: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                              child: Text(
                                                'تحميل',
                                                style: TextStyle(fontSize: 20, color: Colors.white),
                                              ),
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                              minWidth: 60,
                                              height: 30,
                                              color: Colors.green,
                                              onPressed: () {
                                               print('download file');
                                              }),
                                          const SizedBox(
                                            width: 40,
                                          ),
                                          MaterialButton(
                                              child:  Text(
                                                'رفع',
                                                style: TextStyle(fontSize: 20, color: Colors.white),
                                              ),
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                              minWidth: 60,
                                              height: 30,
                                              color: Colors.green,
                                              onPressed: () {
                                                print('download file');

                                              })
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                    padding: getPadding(right: 3, bottom: 10),
                                    child: Text('اضافة ملف' , style: TextStyle(fontFamily: 'Cairo Regular', fontSize: 20 ,color: Colors.grey),)),

                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: getMargin(top: 10, bottom: 10),
                                  alignment: Alignment.center,
                                  height: 44,
                                  child: Expanded(
                                    child: MyTextFieldWidget(
                                      hintText: "الوقت",
                                      readOnly: true,
                                      onChanged: (value) => null,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Container(
                                  margin: getMargin(top: 10, bottom: 10),
                                  alignment: Alignment.center,
                                  height: 44,
                                  child: Expanded(
                                    child: MyTextFieldWidget(
                                      prefixIcon: Icon(Icons.date_range_rounded, color: Colors.blue,),
                                      hintText: " التاريخ",
                                      readOnly: true,
                                      onChanged: (value) => null,
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),





                        ],
                      ),
                    ),
                    isActive: controller.currentStep.value >= 0,
                    // state: controller.currentStep.value >= 0
                    //     ? StepState.complete
                    //     : StepState.disabled,
                  ),
                  Step(
                    title: const Text('القسائم', style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Cairo Regular",fontSize: 20),),
                    content: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            margin: getMargin(top: 10,),
                            alignment: Alignment.center,
                            height: 44,
                            child: Expanded(
                              child: Container(
                                color: Colors.white,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors
                                            .white,
                                        border: Border.all(
                                            color: Colors.black38,
                                            width:
                                            1),
                                        borderRadius: BorderRadius.circular(
                                            5),
                                        boxShadow: const <BoxShadow>[

                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.1), //shadow for button
                                              blurRadius:
                                              3)
                                        ]),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        icon: Icon(Icons
                                            .keyboard_arrow_down_outlined),
                                        hint: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "اسم المستلم",
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                        value: controller
                                            .selectedRecieverNameAddProduct
                                            .value,
                                        onChanged: (v) {
                                          controller
                                              .selectedRecieverNameAddProduct
                                              .value = v!;
                                        },
                                        items: controller
                                            .recieverNameAddProductList
                                            .map<
                                            DropdownMenuItem<
                                                String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                alignment:
                                                AlignmentDirectional
                                                    .center,
                                                enabled: true,
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 3,right: 3, top: 10),
                            child: Center(
                              child: Expanded(
                                child: MyTextFieldWidget(hintText: "Reciever's E-mail",fontSize: 16,
                                  onChanged: (value) {
                                    // controller.filterOrder.value!.date=value;
                                  },),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            margin: getMargin(top: 10, bottom: 10),
                            alignment: Alignment.center,
                            height: 44,
                            child: Expanded(
                              child: Container(
                                color: Colors.white,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors
                                            .white,
                                        border: Border.all(
                                            color: Colors.black38,
                                            width:
                                            1),
                                        borderRadius: BorderRadius.circular(
                                            5),
                                        boxShadow: const <BoxShadow>[

                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.1), //shadow for button
                                              blurRadius:
                                              3)
                                        ]),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        icon: Icon(Icons
                                            .keyboard_arrow_down_outlined),
                                        hint: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "اسم المرسل",
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                        value: controller
                                            .selectedRecieverNameAddProduct
                                            .value,
                                        onChanged: (v) {
                                          controller
                                              .selectedRecieverNameAddProduct
                                              .value = v!;
                                        },
                                        items: controller
                                            .recieverNameAddProductList
                                            .map<
                                            DropdownMenuItem<
                                                String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                alignment:
                                                AlignmentDirectional
                                                    .center,
                                                enabled: true,
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          Center(
                            child: Expanded(
                              child: MyTextFieldWidget(hintText: "ايميل المرسل",fontSize: 15,
                                onChanged: (value) {
                                  // controller.filterOrder.value!.date=value;
                                },),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            margin: getMargin(top: 10, bottom: 10),
                            alignment: Alignment.center,
                            height: 44,
                            child: Expanded(
                              child: Container(
                                color: Colors.white,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors
                                            .white,
                                        border: Border.all(
                                            color: Colors.black38,
                                            width:
                                            1),
                                        borderRadius: BorderRadius.circular(
                                            5),
                                        boxShadow: const <BoxShadow>[

                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.1), //shadow for button
                                              blurRadius:
                                              3)
                                        ]),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: DropdownButton<String>(
                                        alignment: Alignment.center,
                                        isExpanded: true,
                                        icon: Icon(Icons
                                            .keyboard_arrow_down_outlined),
                                        hint: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "موضوع الهدية",
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                        value: controller
                                            .selectedRecieverNameAddProduct
                                            .value,
                                        onChanged: (v) {
                                          controller
                                              .selectedRecieverNameAddProduct
                                              .value = v!;
                                        },
                                        items: controller
                                            .recieverNameAddProductList
                                            .map<
                                            DropdownMenuItem<
                                                String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                alignment:
                                                AlignmentDirectional
                                                    .topStart,
                                                enabled: true,
                                                value: value,
                                                child: Text(value,textAlign: TextAlign.center,),
                                              );
                                            }).toList(),
                                      ),
                                    )),
                              ),
                            ),
                          ), // giftsubject
                          Container(
                            padding: const EdgeInsets.only(left: 3,right: 3, ),
                            child: Center(
                              child: Expanded(
                                child: MyTextFieldWidget(hintText: "رسالة",fontSize: 16,
                                  onChanged: (value) {
                                    // controller.filterOrder.value!.date=value;
                                  },),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 150,right: 3, top: 10),
                            child: Center(
                              child: Expanded(
                                child: MyTextFieldWidget(hintText: "المبلغ",fontSize: 16,
                                  onChanged: (value) {
                                    // controller.filterOrder.value!.date=value;
                                  },),
                              ),
                            ),
                          ), //cost



                        ],
                      ),
                    ),

                    isActive: controller.currentStep.value >= 0,
                    //   state: controller.currentStep.value >= 1
                    //       ? StepState.complete
                    //       : StepState.disabled,
                  ),
                  // subscribe


                ],
              ),
            ),
            Container(
              padding: getPadding(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                      child: Text(
                        'الغاء',
                        style: TextStyle(fontSize: 25, color: Colors.grey[800]),
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
                      child:  Text(
                        'حفظ',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      minWidth: 100,
                      height: 60,
                      color: Colors.green,
                      onPressed: () {
                        Get.back();
                        addProductModel = AddProductDataModel(
                            index: (controller.addProductDataList.length),
                            // optionValue:controller.prodcut.value.toString() ,
                            model: controller.model.value.toString(),
                            unitPrice:controller.unitPrice.value.
                                toString(),
                            qty: controller.qty.value.toString(),
                            total: controller.total.value.toString()  );
                        controller.addProductModel(addProductModel);
                        controller. addProductDataList.add(AddProductDataModel(
                          index: controller.addProductDataList.length,
                            unitPrice:addProductModel.unitPrice,
                            qty: addProductModel.qty.toString(),
                            total: addProductModel.total.toString(),
                            prodcut: addProductModel.prodcut.toString(),
                        model: controller.model.toString()));
                        controller.addProductDataList=controller.addProductDataList;
                        Get.back();
                      })
                ],
              ),
            ),
            // tow buttons of save and cancel
          ],
        ),
      );
});

  }
}

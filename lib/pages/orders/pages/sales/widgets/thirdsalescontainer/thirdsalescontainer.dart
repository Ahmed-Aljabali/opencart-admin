import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/model/orders/payment_metho.dart';
import 'package:opencart/model/orders/shipping_methods.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/thirdsalescontainer/widgets/comment.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/thirdsalescontainer/widgets/companyfollow.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/thirdsalescontainer/widgets/paymentAddressForm.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/thirdsalescontainer/widgets/shippingaddress.dart';
import '../../../../../../controllers/Init_add_order_controller.dart';
import '../../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../../core/utils/math_utils.dart';
import '../../../../../../model/ProductData.dart';

class ThirdSalesContainer extends GetView<InitAddOrderController> {

  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    controller.initPaymentMethod();
    controller.initShippingMethods();
    return super.createElement();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.salesExpansionTitle3[panelIndex].isExpanded!.value =
                !isExpanded;
          },
          children: controller.salesExpansionTitle3
              .map<ExpansionPanel>((Product item) {
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
                body: Column(
                  children: [
                    Container(
      padding: EdgeInsets.only(
                          top: 10, bottom: 10, right: 10, left: 10),
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 10, left: 10),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        children: [
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
                                                      1),
                                              borderRadius: BorderRadius.circular(
                                                  5),
                                              boxShadow: const <BoxShadow>[
                                                //apply shadow on Dropdown button
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        0,
                                                        0,
                                                        0,
                                                        0.1),
                                                    blurRadius:
                                                        3) //blur radius of shadow
                                              ]),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              icon: Icon(Icons
                                                  .keyboard_arrow_down_outlined),
                                              alignment:
                                                  AlignmentDirectional.center,
                                              hint:  const Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "????????",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                              ),
                                              value: controller
                                                  .selectedmarketsAddProduct
                                                  .value,
                                              onChanged: (v) {
                                                controller
                                                    .selectedmarketsAddProduct
                                                    .value = v!;
                                              },
                                              items: controller
                                                  .marketsAddProductList
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
                                                      1),
                                              borderRadius: BorderRadius.circular(
                                                  5),
                                              boxShadow: const <BoxShadow>[

                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        0,
                                                        0,
                                                        0,
                                                        0.1),
                                                    blurRadius:
                                                        3)
                                              ]),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              icon: Icon(Icons
                                                  .keyboard_arrow_down_outlined),
                                              hint:  const Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "??????????",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                              ),
                                              value: controller
                                                  .selectedLanguageAddProduct
                                                  .value,
                                              onChanged: (v) {
                                                controller
                                                    .selectedLanguageAddProduct
                                                    .value = v!;
                                              },
                                              items: controller
                                                  .languageAddProductList
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
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: getMargin(top: 10, bottom: 10),
                                  alignment: Alignment.center,
                                  height: 44,
                                  child: Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          margin: getMargin(top: 1, bottom: 2),
                                          alignment: Alignment.center,
                                          child: Container(
                                            color: Colors.white,
                                            height: 40,
                                            child: Checkbox(
                                              checkColor: Colors.green,
                                              activeColor: Colors.white54,
                                              hoverColor: Colors.blue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                              onChanged: (v) {
                                                v = false;
                                              },
                                              value: true,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: MyTextFieldWidget(
                                            hintText: " ?????????? ??????????",
                                            readOnly: true,
                                            onChanged: (value) => null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
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
                                              icon: Icon(Icons
                                                  .keyboard_arrow_down_outlined),
                                              hint:   const Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "????????????",
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
                            ],
                          ),
                          Row(
                            children: [
                              Expanded (
                                child: Container(
                                  margin: getMargin(top: 10, bottom: 10),
                                  alignment: Alignment.center,
                                  height: 44,
                                  child: Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          margin: getMargin(top: 1, bottom: 2),
                                          alignment: Alignment.center,
                                          child: Container(
                                            color: Colors.white,
                                            height: 40,
                                            child: Checkbox(
                                              checkColor: Colors.green,
                                              activeColor: Colors.white54,
                                              hoverColor: Colors.blue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                              onChanged: (v) {
                                                v = false;
                                              },
                                              value: true,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: MyTextFieldWidget(
                                            hintText: "???????? ????????????????",
                                            readOnly: true,
                                            onChanged: (value) => null,
                                          ),
                                        ),
                                      ],
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
                                    child: Row(
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          margin: getMargin(top: 1, bottom: 2),
                                          alignment: Alignment.center,
                                          child: Container(
                                            color: Colors.white,
                                            height: 40,
                                            child: Checkbox(
                                              checkColor: Colors.green,
                                              activeColor: Colors.white54,
                                              hoverColor: Colors.blue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                              onChanged: (v) {
                                                v = false;
                                              },
                                              value: true,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: MyTextFieldWidget(
                                            hintText: "????????????",
                                            readOnly: true,
                                            onChanged: (value) => null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: getMargin(top: 10, bottom: 10),
                                  alignment: Alignment.center,
                                  height: 44,
                                  child: Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: MyTextFieldWidget(
                                            prefixIcon: Icon(Icons.add),
                                            hintText: "??????????",
                                            readOnly: true,
                                            onChanged: (value) => null,
                                          ),
                                        ),
                                      ],
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
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: MyTextFieldWidget(
                                            prefixIcon: Icon(Icons.add),
                                            hintText: "???????? ????????????????",
                                            readOnly: true,
                                            onChanged: (value) => null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              padding: getPadding(top: 8),
                              height: 50,
                              child: Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(

                                    color:Colors.white,

                                    borderRadius: BorderRadius.circular(10),

                                  ),

                                  child:  Center(
                                    child: TextField(



                                      readOnly: true,
                                      onTap: (){     showModalBottomSheet<void>(
                                        isScrollControlled: true,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30.0),
                                                topRight: Radius.circular(30))),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return    SizedBox(

                                            child: Padding(
                                              padding: getPadding(all: 10),
                                              child: ComopanyFollow(),
                                            ),
                                          );
                                        },
                                      );},

                                      //controller:  controller.controllers.value,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.add),
                                        fillColor:Colors.transparent,
                                        hintText:'???????? ??????????',
                                        hintStyle:  TextStyle(
                                            fontSize: 16,color: Colors.grey
                                        ),
                                        contentPadding:  EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),


                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    Container(

                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, right: 10, left: 10),
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 10, left: 10),
                      width: MediaQuery.of(context).size.width * 0.9,

                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                                padding: getPadding(top: 8),
                                height: 51,
                                child: Expanded(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(

                                        color:Colors.white,

                                        borderRadius: BorderRadius.circular(10),

                                    ),

                                    child:  Center(
                                      child: TextField(
                                        readOnly: true,
                                        onTap: (){     showModalBottomSheet<void>(
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30.0),
                                                  topRight: Radius.circular(30))),
                                          context: context,
                                          builder: (BuildContext context) {
                                            return    SizedBox(

                                              child: Padding(
                                                padding: getPadding(all: 10),
                                                child:PaymentAddressForm()
                                              ),
                                            );
                                          },
                                        );},

                                        //controller:  controller.controllers.value,
                                        textAlign: TextAlign.center,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.add),
                                          fillColor:Colors.transparent,
                                          hintText:'?????????? ??????????',
                                          hintStyle:  TextStyle(
                                              fontSize: 16,color: Colors.grey
                                          ),
                                          contentPadding:  EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10.0),


                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            ),
                          ),
                          Container(
                              padding: getPadding(top: 8),
                              height: 51,
                              child: Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(

                                    color:Colors.white,

                                    borderRadius: BorderRadius.circular(10),

                                  ),

                                  child:  Center(
                                    child: TextField(


                                      readOnly: true,
                                      onTap: (){showModalBottomSheet<TestData>(
                                        isScrollControlled: true,

                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30.0),
                                                topRight: Radius.circular(30))),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return    SizedBox(

                                            child: Padding(
                                              padding: getPadding(all: 10),
                                              child: ShippinAddressForm(title: "?????????? ",),
                                            ),
                                          );
                                        },
                                      ).then((value) {

                                        Get.snackbar(
                                          value!.name,
                                          value.age.toString(),
                                          icon:const Icon(Icons.person, color: Colors.white),
                                          snackPosition: SnackPosition.BOTTOM,
                                        );

                                      });},

                                      //controller:  controller.controllers.value,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.add),
                                        fillColor:Colors.transparent,
                                        hintText:'?????????? ??????????',
                                        hintStyle:  TextStyle(
                                            fontSize: 16,color: Colors.grey
                                        ),
                                        contentPadding:  EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),

                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),


                          SizedBox(
                            child: Expanded(
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
                                                color: Color.fromRGBO(0, 0, 0,
                                                    0.1), //shadow for button
                                                blurRadius:
                                                    3) //blur radius of shadow
                                          ]),
                                      child: Align(
                                        child: DropdownButton<ShippingMethods>(
                                          hint:  const Text("?????????? ??????????"),
                                          value:controller.selectShippingMethods.value,
                                          onChanged:(v) {
                                            controller.selectShippingMethods.value = v!;
                                            controller.orderShippingMethods.value!.code = "flat.flat";
                                            controller.orderShippingMethods.value!.title=v.name;
                                          },
                                          items:controller.listShippingMethods.
                                          map<DropdownMenuItem<ShippingMethods>>((ShippingMethods value) {
                                            return   DropdownMenuItem<ShippingMethods>(
                                              enabled: true,
                                              value: value,
                                              child: Text(value.name!),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Expanded(
                              child: Container(
                                color: Colors.white,
                                margin: getMargin( bottom: 10),
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
                                              5),
                                          boxShadow: const <BoxShadow>[
                                            //apply shadow on Dropdown button
                                            BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0,
                                                    0.1),
                                                blurRadius:
                                                    3)
                                          ]),
                                   child: Align(
                                        child: DropdownButton<PaymentMethod>(
                                              hint:  const Text("?????????? ??????????"),
                                          value:controller.selectPaymentMethod.value,
                                              onChanged:(v) {
                                                controller.selectPaymentMethod.value = v!;
                                                controller.paymentMethod.value!.code = v.code;
                                            controller.paymentMethod.value!.title = v.name;
                                                  },
                                              items:controller.listPaymentMethod.
                                              map<DropdownMenuItem<PaymentMethod>>((PaymentMethod value) {
                                              return   DropdownMenuItem<PaymentMethod>(
                                              enabled: true,
                                              value: value,
                                              child: Text(value.name!),
                                              );
                                              }).toList(),

                                        )

                                      ),

                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(

                              height: 42,
                              child: Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(

                                    color:Colors.white,

                                    borderRadius: BorderRadius.circular(10),

                                  ),

                                  child:  Center(
                                    child: TextField(




                                      readOnly: true,
                                      onTap: (){     showModalBottomSheet<void>(
                                        isScrollControlled: true,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30.0),
                                                topRight: Radius.circular(30))),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return    SizedBox(

                                            child: Padding(
                                              padding: getPadding(all: 10),
                                              child: Comment(),
                                            ),
                                          );
                                        },
                                      );},

                                      //controller:  controller.controllers.value,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.add),
                                        fillColor:Colors.transparent,
                                        hintText:'??????????',
                                        hintStyle:  TextStyle(
                                            fontSize: 16,color: Colors.grey
                                        ),
                                        contentPadding:  EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),


                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Padding(
                            
                            padding: getPadding(top: 15),
                            child: SizedBox(
                              child: Expanded(
                                child: Center(
                                    child: Column(children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.blue.shade400),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Table(
                                            border: TableBorder(
                                                horizontalInside: BorderSide(
                                                    color: Colors.blue.shade400),
                                                right: BorderSide(
                                                    color: Colors.blue.shade400)),
                                            children: [
                                              TableRow(
                                                  decoration: BoxDecoration(
                                                      color: Colors.blueGrey
                                                          .withOpacity(0.16),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                      10.0))),
                                                  children: [
                                                    SizedBox(
                                                        height: 40.0,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: const [
                                                            Text('????????',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Cairo Regular')),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text('2500',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo Regular')),
                                                          ],
                                                        )),
                                                  ]),
                                              TableRow(
                                                  decoration: BoxDecoration(
                                                      color: Colors.blueGrey
                                                          .withOpacity(0.16),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                      10.0))),
                                                  children: [
                                                    SizedBox(
                                                        height: 40.0,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: const [
                                                            Text('????????',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Cairo Regular')),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text('150',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo Regular')),
                                                          ],
                                                        )),
                                                  ]),
                                              TableRow(
                                                  decoration: BoxDecoration(
                                                      color: Colors.blueGrey
                                                          .withOpacity(0.16),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                      10.0))),
                                                  children: [
                                                    SizedBox(
                                                        height: 40.0,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: const [
                                                            Text('????????',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Cairo Regular')),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text('150',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo Regular')),
                                                          ],
                                                        )),
                                                  ]),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Table(
                                            border: TableBorder.symmetric(
                                                inside: BorderSide(
                                                    color: Colors.blue.shade400)),
                                            children: [
                                              TableRow(
                                                  decoration: BoxDecoration(
                                                      color: Colors.blueGrey
                                                          .withOpacity(0.16),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight:
                                                                  Radius.circular(
                                                                      10.0))),
                                                  children: [
                                                    Container(
                                                        height: 40.0,
                                                        child: Center(
                                                            child: Text(
                                                                '?????????????? ????????????',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Cairo Regular'))))
                                                  ]),
                                              TableRow(
                                                  decoration: BoxDecoration(
                                                      color: Colors.blueGrey
                                                          .withOpacity(0.16),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight:
                                                                  Radius.circular(
                                                                      10.0))),
                                                  children: [
                                                    Container(
                                                        height: 40.0,
                                                        child: Center(
                                                            child: Text('??????????????',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Cairo Regular'))))
                                                  ]),
                                              TableRow(
                                                  decoration: BoxDecoration(
                                                      color: Colors.blueGrey
                                                          .withOpacity(0.16),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight:
                                                                  Radius.circular(
                                                                      10.0))),
                                                  children: [
                                                    Container(
                                                        height: 40.0,
                                                        child: Center(
                                                            child: Text(
                                                                '?????????????? ??????????',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Cairo Regular'))))
                                                  ]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ])),
                                /*Row(
                        children:[Expanded(

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


                                  DataCell(Text('125')),
                                  DataCell(Text('125')),
                                  DataCell(Text('125')),
                                  DataCell(Text('125')),
                                  DataCell(Text('125')),

                                ],
                              )),
                              )
                                  .toList(),
                              columns: const [


                                DataColumn(label: Text('??????????????')),
                                DataColumn(label: Text('?????? ????????????')),
                                DataColumn(label: Text('??????????????')),
                                DataColumn(label: Text('????????????')),
                                DataColumn(label: Text('????????????'))
                              ],
                            ),
                        ),]
                    ),*/
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                isExpanded: item.isExpanded!.value);
          }).toList());
    });
  }
}

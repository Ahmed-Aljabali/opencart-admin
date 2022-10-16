import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/Init_add_order_controller.dart';
import 'package:opencart/core/utils/math_utils.dart';
import '../../../../../../../Controllers/customer_controller.dart';
import '../../../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../../../model/cutomers/customer.dart';

class ShippinAddressForm extends GetView<InitAddOrderController> {
  String title ;

  ShippinAddressForm({this.title = "عنوان الشحن"});



  @override
  Widget build(BuildContext context) {
    var customerController =Get.put(CustomerController());
    var systemINfoController =Get.put(SystemINfoController());
    return      SizedBox(
      height: MediaQuery.of(context).size.height*0.7,
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
                      child:  Text(
                        '$title',
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


          Container(
            padding: const EdgeInsets.only(left: 3,top: 20),
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
                          child:  FutureBuilder<List<Countries>>(
                            future: systemINfoController.fetchCountries(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {

                                var data =snapshot.data!.obs.value;
                                return DropdownButton<
                                    Countries>(
                                  hint:
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "اختيار العنوان",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  //   value:controller.shippingMethods.value,
                                  icon: const Icon(Icons
                                      .keyboard_arrow_down),
                                  items: data.map<DropdownMenuItem<Countries>>(
                                          (Countries value) {
                                        return DropdownMenuItem<Countries>(
                                          enabled: true,
                                          value: value,
                                          child: Text(value.name!),
                                        );
                                      }).toList(),
                                  onChanged: (v) {
                                    controller.shippingPayment.value.countryId = v!.countryId;
                                    controller.shippingPayment.value!.country=v!.name;

                                    // controller.manufacturersId.value = v?.manufacturerId;
                                  },
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          )
                        )
                    ),
                  ),
                ),
              ),),
          ),




          Container(
            padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Expanded(
                    child:DynamicTextFieldWidget(
                      hintText: "اللقب",
                      controller: controller.lastNameController,

                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (String value) {  },

                    ),
                  ),
                  Expanded(
                    child: DynamicTextFieldWidget(
                      controller:controller.firstNameController ,
                      keyboardType: TextInputType.text,
                      hintText: "الاسم الاول",
                      onFieldSubmitted: (val){

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
                      child:Container()),
                  // Expanded(
                  //
                  //   child: DynamicTextFieldWidget(
                  //     controller:controller.firstNameController ,
                  //     keyboardType: TextInputType.text,
                  //     hintText: "الاسم الاول",
                  //     onFieldSubmitted: (val){
                  //
                  //
                  //     },
                  //
                  //   ),
                  // ),
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

                    child: DynamicTextFieldWidget(
                      controller:controller.addressController,
                      keyboardType: TextInputType.text,
                      hintText: "العنوان 1",
                      onFieldSubmitted: (val){


                      },

                    ),
                  ),

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

                    child: DynamicTextFieldWidget(
                      controller:controller.address2Controller ,
                      keyboardType: TextInputType.text,
                      hintText: "العنوان 2",
                      onFieldSubmitted: (val){


                      },
                    ),
                  ),

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
                  child: DynamicTextFieldWidget(
                    controller:controller.cityController ,
                    keyboardType: TextInputType.text,
                    hintText: "المدينة",
                    onFieldSubmitted: (val){
                    },
                  ),
                ),
                  Expanded(
                    child: DynamicTextFieldWidget(
                      controller:controller.codeZoneController ,
                      keyboardType: TextInputType.number,
                      hintText: "الرمز البريدي",
                      onFieldSubmitted: (val){

                      },

                    ),
                  ),
                ],
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
                          // child: Align(
                          //   alignment: Alignment.center,
                          //   child: DropdownButton<String>(
                          //     isExpanded: true,
                          //     icon: Icon(Icons
                          //         .keyboard_arrow_down_outlined),
                          //     alignment:
                          //     AlignmentDirectional.center,
                          //     hint:  const Align(
                          //       alignment: Alignment.center,
                          //       child: Text(
                          //         "الولاية",
                          //         style: TextStyle(color: Colors.grey),
                          //       ),
                          //     ),
                          //     value: controller.selectedmarketsAddProduct.value,
                          //     onChanged: (v) {
                          //       controller.selectedmarketsAddProduct.value = v!;
                          //     },
                          //     items: controller.marketsAddProductList.map<
                          //         DropdownMenuItem<String>>(
                          //             (String value) {
                          //           return DropdownMenuItem<String>(
                          //             alignment:
                          //             AlignmentDirectional.center,
                          //             enabled: true,
                          //             value: value,
                          //             child: Text(value),
                          //           );
                          //         }).toList(),
                          //   ),
                          // )),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   width: 4,
              // ),
              // Expanded(
              //   child: Container(
              //     color: Colors.white,
              //     margin: getMargin(top: 10, bottom: 10),
              //     alignment: Alignment.center,
              //     height: 44,
              //     child: Expanded(
              //       child: Container(
              //         color: Colors.white,
              //         child: DecoratedBox(
              //             decoration: BoxDecoration(
              //                 color: Colors
              //                     .white, //background color of dropdown button
              //                 border: Border.all(
              //                     color: Colors.black38,
              //                     width:
              //                     1), //border of dropdown button
              //                 borderRadius: BorderRadius.circular(
              //                     5), //border raiuds of dropdown button
              //                 boxShadow: const <BoxShadow>[
              //                   //apply shadow on Dropdown button
              //                   BoxShadow(
              //                       color: Color.fromRGBO(
              //                           0,
              //                           0,
              //                           0,
              //                           0.1), //shadow for button
              //                       blurRadius:
              //                       3) //blur radius of shadow
              //                 ]),
              //             child: Align(
              //               alignment: Alignment.center,
              //               child: DropdownButton<String>(
              //                 isExpanded: true,
              //                 icon: Icon(Icons
              //                     .keyboard_arrow_down_outlined),
              //                 hint:  const Align(
              //                   alignment: Alignment.center,
              //                   child: Text(
              //                     "الولاية",
              //                     style: TextStyle(color: Colors.grey),
              //                   ),
              //                 ),
              //                 value: controller
              //                     .selectedLanguageAddProduct
              //                     .value,
              //                 onChanged: (v) {
              //                   controller
              //                       .selectedLanguageAddProduct
              //                       .value = v!;
              //                 },
              //                 items: controller
              //                     .languageAddProductList
              //                     .map<
              //                     DropdownMenuItem<
              //                         String>>(
              //                         (String value) {
              //                       return DropdownMenuItem<String>(
              //                         alignment:
              //                         AlignmentDirectional
              //                             .center,
              //                         enabled: true,
              //                         value: value,
              //                         child: Text(value),
              //                       );
              //                     }).toList(),
              //               ),
              //             )),
                    ),
                  ),
                ),
              ),
              )
            ],
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

                      Get.back(result:TestData("zaid",28));
                    })
              ],
            ),
          ),


        ],
      ),
    );

  }
}
class TestData{
  String name;
  int age;
  TestData(this.name,this.age);
}
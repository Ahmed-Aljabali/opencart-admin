import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/model/checkbox_data.dart';
import 'package:opencart/model/porducts/product.dart';

import '../../../../../../controllers/wizard_controller.dart';
import '../../../../../../core/constrants/widgetconstrant.dart';

class MainButtomCheetCheckBoxContainer extends GetView<MainWizardController> {
   MainButtomCheetCheckBoxContainer({
    required this.controller,
    required this.index,
  });

  final MainWizardController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    CheckBoxDataModel checkedBoxModel;
    return Obx(() {
  return SizedBox(

      height: MediaQuery.of(context).size.height * 0.7,
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
                        'قيمة الاختيار',
                        style: TextStyle(color: Colors.grey, fontSize: 22),
                        textAlign: TextAlign.center,
                      ))),
            ],
          ),
          //the title top
          const Divider(
            thickness: 1,
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: MyTextFieldWidget(
                  hintText: 'الكمية',
                    keyboardType: TextInputType.number,
                  onChanged: (value) {

                    controller.checkBoxQty = value ;
                  },
                )),
                const SizedBox(
                  width: 10,
                ),
                //
                // Container(
                //   padding: const EdgeInsets.only(right: 10),
                //   child: Expanded(
                //     child: DecoratedBox(
                //         decoration: BoxDecoration(
                //             color: Colors.white60,
                //             border:Border.all(color: Colors.black38, width: 0.5),
                //             borderRadius: BorderRadius.circular(10),
                //             boxShadow: const <BoxShadow>[
                //               BoxShadow(
                //                   color: Color.fromRGBO(0, 0, 0, 0.1),
                //                   blurRadius: 3)
                //             ]),
                //         child: SizedBox(
                //           width: MediaQuery.of(context).size.width * 0.5,
                //           child: Center(
                //             child: DropdownButton<String>(
                //               alignment: AlignmentDirectional.bottomCenter,
                //               underline: Container(color: Colors.transparent),
                //               disabledHint: const Text('required'),
                //               hint: const Text("Required"),
                //               value: controller.selectedCheckBoxChooseOption.value,
                //               onChanged: (v) {
                //                 controller.selectedCheckBoxChooseOption.value = v!;
                //               },
                //               items: controller.optioncheckchoose
                //                   .map<DropdownMenuItem<String>>(
                //                       (String value) {
                //                 return DropdownMenuItem<String>(
                //                   value: value,
                //                   child: Text(value),
                //                 );
                //               }).toList(),
                //             ),
                //           ),
                //         )),
                //   ),
                // ),
              ],
            ),
          ),
          //first row the amount and small medium large
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                /* Expanded(

                  child: Card(

                    margin: EdgeInsets.only(right:39),
                    child:
                  ),
                ),*/
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            //background color of dropdown button
                            border:
                                Border.all(color: Colors.black38, width: 0.5),
                            //border of dropdown button
                            borderRadius: BorderRadius.circular(10),
                            //border raiuds of dropdown button
                            boxShadow: const <BoxShadow>[
                              //apply shadow on Dropdown button
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  //shadow for button
                                  blurRadius: 3)
                              //blur radius of shadow
                            ]),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Center(
                            child: DropdownButton<String>(
                              alignment: AlignmentDirectional.bottomCenter,
                              underline: Container(color: Colors.transparent),
                              disabledHint: const Text('required'),
                              hint: const Text("Required"),
                              value: controller.selectedCheckBoxTaxOption.value,
                              onChanged: (v) {
                                controller.selectedCheckBoxTaxOption.value = v!;

                              },
                              items: controller.optionTaxcheckchoose
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          // the second container taxable
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: MyTextFieldWidget(
                  hintText: 'السعر',
                      keyboardType: TextInputType.number,

                      onChanged: (value) {
                    controller.checkBoxPrice= value;
                  },

                )),
                const SizedBox(
                  width: 10,
                ),
                /* Expanded(

                  child: Card(

                    margin: EdgeInsets.only(right:39),
                    child:
                  ),
                ),*/
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Expanded(
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            //background color of dropdown button
                            border:
                                Border.all(color: Colors.black38, width: 0.5),
                            //border of dropdown button
                            borderRadius: BorderRadius.circular(10),
                            //border raiuds of dropdown button
                            boxShadow: <BoxShadow>[
                              //apply shadow on Dropdown button
                              const BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  //shadow for button
                                  blurRadius: 3)
                              //blur radius of shadow
                            ]),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Center(
                            child: DropdownButton<String>(
                              alignment: AlignmentDirectional.bottomCenter,
                              underline: Container(color: Colors.transparent),
                              disabledHint: const Text('required'),
                              hint: const Text("Required"),
                              value: controller.selectedCheckBoxPriceChooseOption.value,
                              onChanged: (v) {

                                controller.selectedCheckBoxPriceChooseOption.value = v!;

                                // print(v);
                              },
                              items:
                                  controller.CheckBoxPriceChooseOptionlist.map<
                                      DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),

                Expanded(
                    child: MyTextFieldWidget(

                  hintText: 'النقاط',
                      keyboardType: TextInputType.number,

                      onChanged: (value) {
                    print(value);
                    controller.checkboxpoint= value;
                  },
                )),
                const SizedBox(
                  width: 10,
                ),
                /* Expanded(

                  child: Card(

                    margin: EdgeInsets.only(right:39),
                    child:
                  ),
                ),*/
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Expanded(
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            //background color of dropdown button
                            border:
                                Border.all(color: Colors.black38, width: 0.5),
                            //border of dropdown button
                            borderRadius: BorderRadius.circular(10),
                            //border raiuds of dropdown button
                            boxShadow: <BoxShadow>[
                              //apply shadow on Dropdown button
                              const BoxShadow(
                                  color: const Color.fromRGBO(0, 0, 0, 0.1),
                                  //shadow for button
                                  blurRadius: 3)
                              //blur radius of shadow
                            ]),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Center(
                            child: DropdownButton<String>(
                              alignment: AlignmentDirectional.bottomCenter,
                              underline: Container(color: Colors.transparent),
                              disabledHint: const Text('required'),
                              hint: const Text("Required"),
                              value:
                                  controller.checkBoxPointsChooseOption.value,
                              onChanged: (v) {
                                controller.checkBoxPointsChooseOption.value =
                                    v!;

                                // print(v);
                              },
                              items:
                                  controller.CheckBoxPriceChooseOptionlist.map<
                                      DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          //the third  price and method of pricing                              //the taxable container
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: MyTextFieldWidget(
                  hintText: ' الوزن',
                      keyboardType: TextInputType.number,

                      onChanged: (value) {
                    controller.checkboxweight = value;
                  },
                )),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Expanded(
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            //background color of dropdown button
                            border:
                                Border.all(color: Colors.black38, width: 0.5),
                            //border of dropdown button
                            borderRadius: BorderRadius.circular(10),
                            //border raiuds of dropdown button
                            boxShadow: const <BoxShadow>[
                              //apply shadow on Dropdown button
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  //shadow for button
                                  blurRadius: 3)
                              //blur radius of shadow
                            ]),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Center(
                            child: DropdownButton<String>(
                              alignment: AlignmentDirectional.bottomCenter,
                              underline: Container(color: Colors.transparent),
                              disabledHint: const Text('required'),
                              hint: const Text("Required"),
                              value: controller.checkBoxWeightChooseOption.value,
                              onChanged: (v) {
                                controller.checkBoxWeightChooseOption.value = v!;

                                // print(v);
                              },
                              items:
                                  controller.CheckBoxWeightChooseOptionlist.map<
                                      DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          //the forth row the weight and the method of weight
          Container(
            padding: const EdgeInsets.only(top: 20),
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
                    child: const Text(
                      'حفظ',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    minWidth: 100,
                    height: 60,
                    color: Colors.green,
                    onPressed: () {
                      checkedBoxModel = CheckBoxDataModel(
                        index: (controller.optWidgetList[index].chbInnerModel.length),
                          optionValue:controller.selectedCheckBoxChooseOption.value.toString() ,
                             point: controller.checkBoxPointsChooseOption.value.toString()+ controller.checkboxpoint,
                          tax:controller.selectedCheckBoxTaxOption.value.toString(),
                          price:controller.selectedCheckBoxPriceChooseOption
                              .value.toString()+ controller.checkBoxPrice.toString(),
                        qty: controller.checkBoxQty.toString(),

                        weight: controller.checkBoxWeightChooseOption.value.toString()+controller.checkboxweight.toString()   );
                      controller.addCheckBoxModel(checkedBoxModel,index);
                      Get.back();

                      controller.productOptionValue.add(ProductOptionValue(
                          price:checkedBoxModel.price,
                          pricePrefix:controller.selectedCheckBoxPriceChooseOption.value ,
                          pointsPrefix: controller.checkBoxPointsChooseOption.value,
                          weightPrefix: controller.checkBoxWeightChooseOption.value,
                          weight: checkedBoxModel.weight,
                          quantity: checkedBoxModel.qty,
                          points: checkedBoxModel.point));

                    controller.productOptionValue=controller.productOptionValue;


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

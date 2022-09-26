import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/model/checkbox_data.dart';

import '../../../../../../controllers/wizard_controller.dart';
import '../../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../model/discount.dart';

class ButtomCheetDiscountContainer extends GetView<WizardController> {
  ButtomCheetDiscountContainer({
    required this.controller,
  });

  final WizardController controller;

  @override
  Widget build(BuildContext context)  {
    DiscountDataModel discountDataModel;
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
                        'اضافة تخفيض',
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
                  onChanged: (value) {

                    controller.firstDiscountQty = value ;
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

                              hint: const Text("مجموعة العملاء"),
                              value:
                                  controller.selectedDiscountChooseOption.value,
                              onChanged: (v) {
                                controller.selectedDiscountChooseOption.value =
                                    v!;

                                // print(v);
                              },
                              items: controller.DiscountChooseOptionList
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
          //first row the amount and small medium large


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
                  onChanged: (value) {
                    controller.firstDiscountPrice= value;
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
                Expanded(
                    child: MyTextFieldWidget(
                      hintText: 'الاولوية',
                      onChanged: (value) {
                        controller.firstDiscountPriority= value;
                      },
                    )),
              ],
            ),
          ), // price and priority
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),

                Expanded(
                    child: MyTextFieldWidget(

                  hintText:"تاريخ البدء",
                  onChanged: (value) {
                    print(value);

                    controller.startDate =value;
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
                Expanded(
                    child: MyTextFieldWidget(


                      hintText:"تاريخ الانتهاء",
                      onChanged: (value) {

                        controller.endDate =value;
                      },
                    )),
              ],
            ),
          ),
          //the third  price and method of pricing                              //the taxable container

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
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    minWidth: 100,
                    height: 60,
                    color: Colors.green,
                    onPressed: () {
                      discountDataModel = DiscountDataModel(
                        index: (controller.discountDataList.length),
                          clintGroup:controller.selectedDiscountChooseOption.toString() ,
                             priority: controller.firstDiscountPriority.toString(),

                          price:controller.firstDiscountPrice.toString(),
                        qty: controller.firstDiscountQty.toString(),

                        startDate: controller.startDate.toString() ,
                      endDate:  controller.endDate . toString());
                      controller.addDiscountModel(discountDataModel);
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
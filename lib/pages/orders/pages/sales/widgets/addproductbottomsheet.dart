import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/customer_controller.dart';
import 'package:opencart/core/utils/math_utils.dart';
import 'package:opencart/model/checkbox_data.dart';
import 'package:opencart/model/porducts/product.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/firstsalescontainer/widgets/addclintbottomsheet.dart';
import 'package:opencart/presentation/products/add_prodcts.dart';

import '../../../../../../controllers/wizard_controller.dart';
import '../../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../controllers/Init_add_order_controller.dart';
import '../../../../../model/addproductmodel.dart';
import '../../../../../model/cutomers/customer.dart';
import '../../../../customers/widgets/general.dart';
import '../../../../wizard/widgets/seo/seopage.dart';

class ButtomCheetAddProductContainer extends GetView<InitAddOrderController> {
  ButtomCheetAddProductContainer({
    required this.controller,
  });

  final InitAddOrderController controller;

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
                    title: const Text('القسائم', style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Cairo Regular",fontSize: 20),),
                    content: SingleChildScrollView(
                      child: Column(

                        children: <Widget>[

                          Row(children: [
                            Expanded(
                              child: Padding(
                                padding:getPadding(top: 15),
                                child: Expanded(child:Container()),
                              ),
                            ),

                          ],),


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
                    ),
                    isActive: controller.currentStep.value >= 0,
                    state: controller.currentStep.value >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title:  const Text('المنتجات'),
                    content: const Text('المنتجات'),
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
              padding: getPadding(top: 20, bottom: 50),
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

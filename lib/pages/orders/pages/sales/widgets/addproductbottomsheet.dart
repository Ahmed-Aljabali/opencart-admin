import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/model/checkbox_data.dart';
import 'package:opencart/model/porducts/product.dart';
import 'package:opencart/presentation/products/add_prodcts.dart';

import '../../../../../../controllers/wizard_controller.dart';
import '../../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../controllers/Init_add_order_controller.dart';
import '../../../../../model/addproductmodel.dart';

class ButtomCheetAddProductContainer extends GetView<InitAddOrderController> {
  ButtomCheetAddProductContainer({
    required this.controller,
  });

  final InitAddOrderController controller;

  @override
  Widget build(BuildContext context) {
   AddProductDataModel addProductModel;

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
                          'اضافة منتج',
                          style: TextStyle(color: Colors.grey, fontSize: 22),
                          textAlign: TextAlign.center,
                        ))),
              ],
            ),

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
                        hintText: 'المنتج',
                        onChanged: (value) {

                          controller.prodcut = value ;
                        },
                      )),
                  const SizedBox(
                    width: 10,
                  ),


                ],
              ),
            ),

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
                        hintText: 'الكمية',
                        onChanged: (value) {
                          controller.qty = value;

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

                        hintText: 'الموديل',
                        onChanged: (value) {
                      controller.model = value;

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
                        hintText: ' سعر الوحدة',
                        onChanged: (value) {
                          controller.unitPrice =value;
                          // controller.checkboxweight = value;
                        },
                      )),
                  const SizedBox(
                    width: 10,
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
                        hintText: 'الاجمالي',
                        onChanged: (value) {
                          controller.total =value;
                          // controller.checkboxweight = value;
                        },
                      )),
                  const SizedBox(
                    width: 10,
                  ),

                ],
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

  }
}

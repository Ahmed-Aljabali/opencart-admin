import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:opencart/model/porducts/product.dart';
import '../../../../../../controllers/wizard_controller.dart';
import '../../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../Controllers/customer_controller.dart';
import '../../../../../controllers/group_customer_controller.dart';
import '../../../../../model/cutomers/customer.dart';
import '../../../../../model/cutomers/group_customer.dart';
import '../../../../../model/discount.dart';
import '../../../../../presentation/Widgets/dateWidgets.dart';

class FirstButtomCheetDiscountContainer extends GetView<WizardController> {
  const FirstButtomCheetDiscountContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    DiscountDataModel discountDataModel;
    final CustomerGroup =Get.put(GroupCustomerController());
    var customerController =Get.put(CustomerController());
    return Obx(() =>
      SizedBox(
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
                    child:Center(
                      child: DropdownButton<Customers>(
                        value: controller.customer.value,
                        hint:   const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "العميل",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        onChanged:(v) {
                          controller.customer.value=v!;

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
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              const  BoxShadow(
                                  color: const Color.fromRGBO(0, 0, 0, 0.1),
                                  //shadow for button
                                  blurRadius: 3)
                              //blur radius of shadow
                            ]),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Center(
                            child: DropdownButton<GroupCustomer>(
                              alignment: AlignmentDirectional.bottomCenter,
                              underline: Container(color: Colors.transparent),
                              hint: const Text("مجموعة العملاء"),
                              value: controller.firstSelectedDiscountGroupCustomer.value,
                              onChanged: (v) {
                                controller.firstSelectedDiscountGroupCustomer.value = v;
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
                  ),
                ),
              ],
            ),
          ),



          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                Expanded(
                    child: MyTextFieldWidget(
                      hintText: 'الكمية',
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        controller.firstDiscountQty = value ;
                      },
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: MyTextFieldWidget(
                  hintText: 'السعر',
                      keyboardType: TextInputType.number,
                  onChanged: (value) {
                   controller.firstDiscountPrice= value;
                  },
                )),
                const SizedBox(
                  width: 10,
                ),

                Expanded(
                    child: MyTextFieldWidget(
                      hintText: 'الاولوية',
                      keyboardType: TextInputType.number,
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
                    child: Column(
                      children: [
                        const Text("تاريخ الانتهاء"),
                        dateTime(controller.dateEndController),

                        // TextField(
                        //   controller:controller.dateEndController ,
                        //   onTap: () {
                        //     controller.chooseGenerlDate();
                        //     controller.dateEndController.text = "${controller.selectedDate.value.year}-${controller.selectedDate.value.month}-${controller.selectedDate.value.day}";
                        //
                        //   },
                        //   textAlign: TextAlign.center,
                        //   readOnly: true,
                        //   decoration: InputDecoration(
                        //     fillColor:Colors.white60, //background color of dropdown button
                        //     prefixIcon: const Icon(
                        //       Icons.date_range_rounded,
                        //       color: Colors.blueAccent,
                        //     ),
                        //     hintText: DateFormat("dd-MM-yyyy")
                        //         .format(controller.selectedDate.value)
                        //         .toString(),
                        //     hintStyle: const TextStyle(
                        //       fontSize: 12,
                        //     ),
                        //     contentPadding: const EdgeInsets.symmetric(
                        //         vertical: 10.0, horizontal: 40.0),
                        //     border: const OutlineInputBorder(
                        //       borderRadius: BorderRadius.all(Radius.circular(5)),
                        //     ),
                        //     enabledBorder: const OutlineInputBorder(
                        //       borderSide:
                        //       BorderSide(color: Colors.grey, width: 0.5),
                        //       borderRadius:
                        //       BorderRadius.all(Radius.circular(5.0)),
                        //     ),
                        //     focusedBorder: const OutlineInputBorder(
                        //       borderSide:
                        //       BorderSide(color: Colors.grey, width: 2.0),
                        //       borderRadius:
                        //       BorderRadius.all(Radius.circular(32.0)),
                        //     ),
                        //   ),
                        // ),

                      ],
                    )),
                const SizedBox(
                  width: 3,
                ),


                Expanded(
                    child: Column(
                      children: [
                        const Text("تاريخ البدء"),
                        dateTime(controller.dateStartController),

                        // TextField(
                        //   controller:controller.dateStartController,
                        //   onTap: () {
                        //     controller.chooseGenerlDate();
                        //     controller.dateStartController.text = "${controller.selectedDate.value.year}-${controller.selectedDate.value.month}-${controller.selectedDate.value.day}";
                        //
                        //   },
                        //   textAlign: TextAlign.center,
                        //   readOnly: true,
                        //   decoration: InputDecoration(
                        //     fillColor:Colors.white60, //background color of dropdown button
                        //
                        //     prefixIcon: const Icon(
                        //       Icons.date_range_rounded,
                        //       color: Colors.blueAccent,
                        //     ),
                        //     hintText: DateFormat("dd-MM-yyyy")
                        //         .format(controller.selectedDate.value)
                        //         .toString(),
                        //     hintStyle: const TextStyle(
                        //       fontSize: 12,
                        //     ),
                        //     contentPadding: const EdgeInsets.symmetric(
                        //         vertical: 10.0, horizontal: 40.0),
                        //     border: const OutlineInputBorder(
                        //       borderRadius: BorderRadius.all(Radius.circular(5)),
                        //     ),
                        //     enabledBorder: const OutlineInputBorder(
                        //       borderSide:
                        //       BorderSide(color: Colors.grey, width: 0.5),
                        //       borderRadius:
                        //       BorderRadius.all(Radius.circular(5.0)),
                        //     ),
                        //     focusedBorder: const OutlineInputBorder(
                        //       borderSide:
                        //       BorderSide(color: Colors.grey, width: 2.0),
                        //       borderRadius:
                        //       BorderRadius.all(Radius.circular(32.0)),
                        //     ),
                        //   ),
                        // ),

                      ],
                    )),
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
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    minWidth: 100,
                    height: 60,
                    color: Colors.green,
                    onPressed: () {
                      discountDataModel = DiscountDataModel(
                        index: (controller.firstdiscountDataList.length),
                          clintGroup:controller.firstSelectedDiscountGroupCustomer.value!.customerGroupId.toString() ,
                             priority: controller.firstDiscountPriority.toString(),
                          price:controller.firstDiscountPrice.toString(),
                        qty: controller.firstDiscountQty.toString(),

                        startDate: controller.startDate1.toString(),
                      endDate:controller.endDate1.toString());

                      controller.addFirstDiscountModel(discountDataModel);
                      controller.productDiscount.add(ProductDiscount(
                         name: controller.customer.value!.name,
                        customerGroupId:controller.firstSelectedDiscountGroupCustomer.value!.customerGroupId.toString(),
                        dateEnd: controller.endDate1.toString(),
                        dateStart: controller.startDate1.toString(),
                        quantity: controller.firstDiscountQty,
                        price: controller.firstDiscountPrice,
                        priority: controller.firstDiscountPriority,
                      ));
                      print(controller.productDiscount);
                      Get.back();
                    })
              ],
            ),
          ),
          // tow buttons of save and cancel
        ],
      ),
));
  }
}
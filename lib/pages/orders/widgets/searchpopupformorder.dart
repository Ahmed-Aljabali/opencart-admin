import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/Init_add_order_controller.dart';
import 'package:opencart/controllers/order_controller.dart';
import 'package:opencart/controllers/system_info_controller.dart';
import 'package:opencart/model/system_info/order_statuses.dart';

import '../../../controllers/wizard_controller.dart';
import '../../../core/constrants/widgetconstrant.dart';
import '../../../model/checkbox_data.dart';

class OrderSearchForm extends GetView<InitAddOrderController> {
  const OrderSearchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  var systemInfo=Get.put(SystemINfoController());
  return Column(

    children: <Widget>[
      Container(
        padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Expanded(
              child: MyTextFieldWidget(hintText: "رقم الطلب",
                onChanged: (value) {
                  controller.filterOrder.idOrder=int.parse(value);
                },
              ),
            ),
            Expanded(
                child: MyTextFieldWidget(
                  hintText: 'اسم العميل',
                  onChanged: (value) {

                    controller.filterOrder.name=value;
                  },
                )),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Expanded(
              child:
              MyTextFieldWidget(
                hintText: "السعر",
                onChanged: (value) {
                  controller.filterOrder.total=value;
                },),
            ),
            Expanded(
                child:Center(
                  child:FutureBuilder<List<OrderStatuses>>(
                    future:systemInfo.fetchOrderStatuses(),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      if (snapshot.hasData) {
                        var data = snapshot.data!.obs.value;
                        return DropdownButton<OrderStatuses>(
                          hint:  const Text("الحاله"),
                         // value:controller.selectedOrderStatuses.value,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items:data.
                          map<DropdownMenuItem<OrderStatuses>>((OrderStatuses value) {

                            return   DropdownMenuItem<OrderStatuses>(
                              enabled: true,
                              value: value,
                              child: Text(value.name!),
                            );
                          }).toList(),

                          onChanged:(v) {

                            controller.selectedOrderStatuses.value=v;
                          controller.filterOrder.status=v!.name.toString();
                          },
                        );
                      }
                      else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                )

            ),



          ],
        ),
      ),
      // Container(
      //   padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //
      //     children: [
      //       Expanded(
      //         child: MyTextFieldWidget(hintText: "الوحدة", onChanged: (value) {  },),
      //       ),
      //       Expanded(
      //           child: MyTextFieldWidget(
      //             hintText: 'الكمية',
      //
      //             onChanged: (value) {
      //
      //
      //
      //
      //             },
      //           )),
      //
      //
      //
      //     ],
      //   ),
      // ),
      // Container(
      //   padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //
      //     children: [
      //       Expanded(
      //         child: MyTextFieldWidget(hintText: "طريقة الدفع", onChanged: (value) {  },),
      //       ),
      //       Expanded(
      //           child: MyTextFieldWidget(
      //             hintText: 'طريقة الشحن',
      //
      //             onChanged: (value) {
      //
      //
      //
      //
      //             },
      //           )),
      //
      //
      //
      //     ],
      //   ),
      // ),
      //
      // Container(
      //   padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //
      //     children: [
      //       Expanded(
      //         child: MyTextFieldWidget(hintText: "الوزن", onChanged: (value) {  },),
      //       ),
      //       Expanded(
      //           child: MyTextFieldWidget(
      //             hintText: 'اللون',
      //
      //             onChanged: (value) {
      //
      //
      //
      //
      //             },
      //           )),
      //
      //
      //
      //     ],
      //   ),
      // ),
      Container(
        padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Expanded(
                child: MyTextFieldWidget(hintText: "تاريخ الاضافة",
                  onChanged: (value) {
                   // controller.filterOrder.value!.date=value;


                  },),
              ),
              Expanded(
                  child: MyTextFieldWidget(
                    hintText: 'تاريخ التعديل',

                    onChanged: (value) {




                    },
                  )),



            ],
          ),
        ),
      ),

      //first row the amount and small medium large

      //the forth row the weight and the method of weight

      // tow buttons of save and cancel
    ],
  );

  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/Init_add_order_controller.dart';
import 'package:opencart/controllers/system_info_controller.dart';
import 'package:opencart/model/system_info/order_statuses.dart';
import '../../../core/constrants/widgetconstrant.dart';


class CustomerSearchForm extends GetView<InitAddOrderController> {
  const CustomerSearchForm({Key? key}) : super(key: key);

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
                          return Expanded(
                            child: Container(
                              height: 43 ,
                              child: DecoratedBox(
                                  decoration: BoxDecoration(

                                      color:Colors.white, //background color of dropdown button
                                      border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                                      borderRadius: BorderRadius.circular(4), //border raiuds of dropdown button
                                      boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                        BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                            blurRadius: 3) //blur radius of shadow
                                      ]
                                  ),
                                  child:Center(
                                    child:   DropdownButton<OrderStatuses>(
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
                                    ),
                                  )
                              ),
                            ),
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
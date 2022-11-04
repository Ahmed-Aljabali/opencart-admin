import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:opencart/controllers/system_info_controller.dart';
import 'package:opencart/core/utils/math_utils.dart';
import '../../../../../../../core/constrants/widgetconstrant.dart';
import '../../../../../../../model/system_info/contries.dart';
import '../../../../../Controllers/customer_controller.dart';
import '../../../../../Controllers/order_controller.dart';
import '../../../../../model/ProductData.dart';


class TestData{
  String name;
  int age;
  TestData(this.name,this.age);
}



// class AddressForm extends GetView<CustomerController> {
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Obx(() => Column(
//       children: [
//         ExpansionPanelList(
//             expansionCallback: (panelIndex, isExpanded) {
//               controller.customer[panelIndex].isExpanded!.value = !isExpanded;
//             },
//             children:  controller.customer.map<ExpansionPanel>((Product item) {
//               return ExpansionPanel(
//                   backgroundColor:  Colors.white,
//                   canTapOnHeader: true,
//                   headerBuilder: ((context, isExpanded) {
//                     return ListTile(
//                         title: Text(
//                           item.header!,
//                           style: const TextStyle(fontSize: 20,),
//                           textAlign: TextAlign.center,
//                         ));
//                   }),
//                   body: Padding(
//                     padding: getPadding(all: 10),
//
//                     child: Container(
//                       color: Colors.white,
//                       child: Column(
//
//                         children: <Widget>[
//
//                           Container(
//
//                             padding: const EdgeInsets.only(left: 3,top: 20),
//                             child: Expanded(
//                               child:     Container(color: Colors.white,
//                                 margin: getMargin(top: 10),
//                                 alignment: Alignment.center,
//                                 height: 44,
//                                 child: Expanded(
//                                   child: Container(
//                                     color: Colors.white,
//                                     child: DecoratedBox(
//                                         decoration: BoxDecoration(
//
//                                             color:Colors.white, //background color of dropdown button
//                                             border: Border.all(color: Colors.black38, width:1), //border of dropdown button
//                                             borderRadius: BorderRadius.circular(5), //border raiuds of dropdown button
//                                             boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
//                                               BoxShadow(
//                                                   color: Color.fromRGBO(0, 0, 0, 0.1 ), //shadow for button
//                                                   blurRadius: 3) //blur radius of shadow
//                                             ]
//                                         ),
//                                         child:Center(
//                                             child:  FutureBuilder<List<Countries>>(
//                                               future: SystemINfoController().fetchCountries(),
//                                               builder: (context, snapshot) {
//                                                 if (snapshot.hasData) {
//
//                                                   var data =snapshot.data!.obs.value;
//                                                   return DropdownButton<
//                                                       Countries>(
//                                                     hint:
//                                                     const Align(
//                                                       alignment: Alignment.center,
//                                                       child: Text(
//                                                         "اختيار العنوان",
//                                                         style: TextStyle(color: Colors.grey),
//                                                       ),
//                                                     ),
//                                                     //   value:controller.shippingMethods.value,
//                                                     icon: const Icon(Icons
//                                                         .keyboard_arrow_down),
//                                                     items: data.map<DropdownMenuItem<Countries>>(
//                                                             (Countries value) {
//                                                           return DropdownMenuItem<Countries>(
//                                                             enabled: true,
//                                                             value: value,
//                                                             child: Text(value.name!),
//                                                           );
//                                                         }).toList(),
//                                                     onChanged: (v) {
//                                                       OrderController().shippingPayment.value.countryId = v!.countryId;
//                                                       OrderController().shippingPayment.value.country=v.name;
//
//                                                       // controller.manufacturersId.value = v?.manufacturerId;
//                                                     },
//                                                   );
//                                                 } else {
//                                                   return const CircularProgressIndicator();
//                                                 }
//                                               },
//                                             )
//                                         )
//                                     ),
//                                   ),
//                                 ),
//                               ),),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//
//                                 children: [
//                                   Expanded(
//                                     child:DynamicTextFieldWidget(
//                                       hintText: "اللقب",
//                                       controller:   OrderController().lastNameController,
//
//                                       keyboardType: TextInputType.text,
//                                       onFieldSubmitted: (String value) {  },
//
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: DynamicTextFieldWidget(
//                                       controller:  OrderController().firstNameController ,
//                                       keyboardType: TextInputType.text,
//                                       hintText: "الاسم الاول",
//                                       onFieldSubmitted: (val){},
//                                     ),),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//
//                                 children: [
//                                   Expanded(
//                                       child:Container()),
//                                   // Expanded(
//                                   //
//                                   //   child: DynamicTextFieldWidget(
//                                   //     controller:controller.firstNameController ,
//                                   //     keyboardType: TextInputType.text,
//                                   //     hintText: "الاسم الاول",
//                                   //     onFieldSubmitted: (val){
//                                   //
//                                   //
//                                   //     },
//                                   //
//                                   //   ),
//                                   // ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//
//                                 children: [
//                                   Expanded(
//
//                                     child: DynamicTextFieldWidget(
//                                       controller:  OrderController().addressController,
//                                       keyboardType: TextInputType.text,
//                                       hintText: "العنوان 1",
//                                       onFieldSubmitted: (val){
//
//
//                                       },
//
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//
//                                 children: [
//                                   Expanded(
//
//                                     child: DynamicTextFieldWidget(
//                                       controller:  OrderController().address2Controller ,
//                                       keyboardType: TextInputType.text,
//                                       hintText: "العنوان 2",
//                                       onFieldSubmitted: (val){
//
//
//                                       },
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(left: 3,right: 3, top: 15),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//
//                                 children: [
//                                   Expanded(
//                                     child: DynamicTextFieldWidget(
//                                       controller:  OrderController().cityController ,
//                                       keyboardType: TextInputType.text,
//                                       hintText: "المدينة",
//                                       onFieldSubmitted: (val){
//                                       },
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: DynamicTextFieldWidget(
//                                       controller:  OrderController().codeZoneController ,
//                                       keyboardType: TextInputType.number,
//                                       hintText: "الرمز البريدي",
//                                       onFieldSubmitted: (val){
//
//                                       },
//
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//
//
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                   isExpanded: item.isExpanded!.value);
//             }).toList()),
//
//       ],
//     ));
//   }
// }
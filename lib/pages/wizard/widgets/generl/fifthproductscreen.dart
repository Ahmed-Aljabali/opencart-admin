
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:opencart/core/constrants/widgetconstrant.dart';


import '../../../../controllers/system_info_controller.dart';
import '../../../../controllers/wizard_controller.dart';
import '../../../../model/ProductData.dart';
import '../../../../model/system_info/init_system.dart';
import 'fothproductcontainer.dart';


class MainFifhProductScreen extends GetView<MainWizardController> {

  var initSystem=Get.put(SystemINfoController());


  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    initSystem.fetchInitSystem();

    return super.createElement();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          controller.genrlproduct5[panelIndex].isExpanded!.value =
              !isExpanded;
        },
        children: controller.genrlproduct5.map<ExpansionPanel>((Product item) {
          return ExpansionPanel(
              backgroundColor: Colors.white,
              canTapOnHeader: true,
              headerBuilder: ((context, isExpanded) {
                return ListTile(
                    title: Text(
                  item.header!,
                  style: const TextStyle(fontSize: 20,),
                  textAlign: TextAlign.center,
                ));
              }),
              body: Container(
                /* padding: EdgeInsets.only(
                      top: 10, bottom: 10, right: 10, left: 10),*/
                margin:
                    const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                child: Column(
                  children: [
                    LSwitchListTile(
                      isChecked: controller.isSwitchedOn2.value,
                      listSwitchFun: (b) {
                        controller.isSwitchedOn2.value = b;
                        controller.prod.shipping=b;
                      },
                      listSwitchText: '1قابل للشحن',
                    ),
                    MyTextFieldWidget(hintText: "الطول", onChanged: (v)=>controller.prod.length=v,keyboardType: TextInputType.number,),
                    const SizedBox(height: 10,),
                    MyTextFieldWidget(hintText: "العرض", onChanged: (v)=>controller.prod.width=v,keyboardType: TextInputType.number,),
                    const SizedBox(height: 10,),
                    MyTextFieldWidget(hintText: 'الارتفاع', onChanged: (v)=>controller.prod.height=v,keyboardType: TextInputType.number,),
                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 1,right: 1),
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white60, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                  boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child:

                                initSystem.isDataLoading.value==false?
                                CircularProgressIndicator():
                                Center(
                                  child: DropdownButton<LengthClasses?>(
                                    alignment: AlignmentDirectional.bottomCenter,
                                    underline: Container(color: Colors.transparent),
                                    hint: const Text("فئة الطول"),
                                    value: initSystem.selectLength.value,
                                    onChanged: (v) {
                                      print(v);
                                      initSystem.selectLength.value=v;
                                      controller.prod.lengthClassId=v!.lengthClassId;
                                      initSystem.update();
                                    },
                                    items: initSystem.lengthClasses
                                        .map<DropdownMenuItem<LengthClasses?>>(
                                            (LengthClasses? value) {
                                          return DropdownMenuItem<LengthClasses>(
                                            value: value,
                                            child: Text(value!.title),
                                          );
                                        }).toList(),
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(hintText: 'الوزن', onChanged: (v){controller.prod.weight=v;},keyboardType: TextInputType.number,),

                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 1,right: 1),
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white60, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                  boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child:Center(
                                child:
                                initSystem.isDataLoading.value==false?
                                CircularProgressIndicator():
                                DropdownButton<WeightClasses>(
                                  hint:  const Text("فئة الوزن"),
                                  value: initSystem.selectWeight.value,
                                  onChanged:(v) {
                                    initSystem.selectWeight.value=v;
                                    controller.prod.weightClassId=v!.weightClassId;
                                    },
                                  items:initSystem.weightClass.
                                  map<DropdownMenuItem<WeightClasses>>((WeightClasses value) {
                                    return   DropdownMenuItem<WeightClasses>(
                                      enabled: true,
                                      value: value,
                                      child: Text(value.title.toString()),
                                    );
                                  }).toList(),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 1,right: 1),
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white60, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                  boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child:Center(
                                child: DropdownButton<String>(
                                  hint:  const Text("الحالة"),
                                  value: controller.selectedstatuesOptions.value,
                                  onChanged:(v) {
                                    controller.selectedstatuesOptions.value = v!;},
                                  items:controller.statuesOptionsList.
                                  map<DropdownMenuItem<String>>((String value) {
                                    return   DropdownMenuItem<String>(
                                      enabled: true,
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 1,right: 1),
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white60, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                  boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child:Center(
                                child: DropdownButton<String>(
                                  hint:  const Text("امر الترتيب"),
                                  value: controller.selectedorderOptions.value,
                                  onChanged:(v) {
                                    controller.selectedorderOptions.value = v!;
                                    controller.prod.sortOrder = v;

                                    },
                                  items:controller.orderOptionsList.
                                  map<DropdownMenuItem<String>>((String value) {
                                    return   DropdownMenuItem<String>(
                                      enabled: true,
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              isExpanded: item.isExpanded!.value);
        }).toList()));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/core/constrants/widgetconstrant.dart';
import '../../../../controllers/system_info_controller.dart';
import '../../../../controllers/wizard_controller.dart';
import '../../../../model/ProductData.dart';
import '../../../../model/system_info/init_system.dart';
import '../../../widgets/date_time.dart';



class MainForthProductContainer extends GetView<MainWizardController> {

  var initSystem=Get.put(SystemINfoController());


  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    initSystem.fetchInitSystem();

    return super.createElement();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() => ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          controller.genrlproduct4[panelIndex].isExpanded!.value =
              !isExpanded;
        },
        children: controller.genrlproduct4.map<ExpansionPanel>((Product item) {
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
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    MyTextFieldWidget(keyboardType: TextInputType.number, hintText:  "الكمية", onChanged: (v)=>controller.prod.quantity=v),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(keyboardType: TextInputType.number,hintText: "الحد الادنى للكمية", onChanged:  (v)=>controller.prod.minimum=v),
                    LSwitchListTile(
                      isChecked: controller.isSwitchedOn.value,
                      listSwitchFun: (b) {
                        controller.isSwitchedOn.value = b;
                        controller.prod.subtract = b;
                      },
                      listSwitchText: 'Subact Stoc',
                    ),

                    const Divider(thickness: 1,),

                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      padding: EdgeInsets.only(left: 1,right: 1),
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
                            DropdownButton<StockStatuses>(
                              hint:  const Text("حالة نفاذ المخزون "),
                              value: initSystem.selectStockStatuses.value,
                              onChanged:(v) {
                                initSystem.selectStockStatuses.value=v;
                              controller.prod.stockStatusId=v!.stockStatusId;
                              },
                              items:initSystem.stockStatuses.
                              map<DropdownMenuItem<StockStatuses>>((StockStatuses value) {
                                return   DropdownMenuItem<StockStatuses>(
                                  enabled: true,
                                  value: value,
                                  child: Text(value.name.toString()),
                                );
                              }).toList(),
                            ),
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    const Text(
                      "التاريخ المتاح",
                      style: TextStyle(fontSize: 15),
                    ),

                    dateTime(controller.dateController),
                  ],
                ),
              ),
              isExpanded: item.isExpanded!.value);
        }).toList()));
  }
}

class LSwitchListTile extends GetView<MainWizardController> {
  var listSwitchText;
  bool isChecked;

  Function listSwitchFun;

  LSwitchListTile(
      {required this.listSwitchText,
      required this.listSwitchFun(bool b),
      required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      hoverColor: Colors.blueAccent,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        listSwitchText,
        style: const TextStyle(fontSize: 18),
      ),
      value: isChecked,

      onChanged: (bool value) => listSwitchFun(value),
    );
  }
}

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/model/option_model.dart';
import 'package:opencart/model/porducts/product.dart';
import 'package:opencart/pages/wizard/widgets/options/datecontainer/datecontainer.dart';
import 'package:opencart/pages/wizard/widgets/options/deliverydatecontainer/deliverydatecontainer.dart';
import '../../../../controllers/wizard_controller.dart';
import '../../../../model/ProductData.dart';
import '../../../../model/porducts/option/option.dart';
import 'checkboxcontainer/checkboxcontainer.dart';
import 'timeanddateconainer/timedatecontainer.dart';

class MainOptionsProductContainer extends GetView<MainWizardController> {

  @override
  Widget build(BuildContext context) {
    var index;
    return Obx(() =>
        ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              controller.optionsproduct1[panelIndex].isExpanded!.value =
              !isExpanded;
            },
            children:
            controller.optionsproduct1.map<ExpansionPanel>((Product item) {
              return ExpansionPanel(
                  backgroundColor: Colors.white,
                  canTapOnHeader: true,
                  headerBuilder: ((context, isExpanded) {
                    return ListTile(
                        title: Text(
                          item.header!,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ));
                  }),
                  body: Container(
                    margin: const EdgeInsets.only(bottom: 10, left: 5),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                  child: ExpansionPanelList(
                                      expansionCallback: (panelIndex,
                                          isExpanded) {
                                        index = panelIndex;
                                        controller.optWidgetList[panelIndex]
                                            .isExpanded!.value = !isExpanded;
                                        controller.currentOptionCheckIndex
                                            .value = panelIndex;
                                        print(panelIndex);
                                      },
                                      dividerColor: Colors.blueAccent,
                                      children: controller.optWidgetList
                                          .map<ExpansionPanel>((OptModel item) {
                                        return ExpansionPanel(
                                            backgroundColor: Colors.white,
                                            canTapOnHeader: true,
                                            isExpanded: item.isExpanded!.value,
                                            headerBuilder: ((context, isExpanded) {
                                              return ListTile(
                                                  leading: InkWell(
                                                    child: const Icon(
                                                      Icons.remove,
                                                    ),
                                                    onTap: () {
                                                      if (controller.productOptionValue.isNotEmpty)
                                                        {
                                                           controller.productOptionValue.removeAt(index);
                                                        }
                                                      controller.productOption.removeAt(index);
                                                      controller.removeOptWidget(item.id);
                                                    },
                                                  ),
                                                  title: Text(
                                                    item.header!,
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ));
                                            }),
                                            body: (( item.optType == "checkbox"|| item.optType=="radio" ) ?
                                                MainCheckBoxContainer(controller: controller, index: item.id)
                                            :
                                            item.optType == "date" ?
                                            MainDateContainer(controller: controller, index: item.id) :
                                            item.optType == "datetime" ?
                                            MainTimeDateContainer(controller: controller, index: item.id) :
                                            item.optType == "Delivery Date" ?
                                            MainDeliveryDateContainer(controller: controller) :

                                            new Container())


                                        );
                                      }).toList())
                                /* ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.optWidgetList.length,
                              itemBuilder: (context, index) {

                                if(controller.optWidgetList[index].optType == "date") {
                                  controller.currentOptionDateIndex = index;
                                     return controller.optWidgetList[index].optModelList;
                                } else if(controller.optWidgetList[index].optType=="checkbox") {
                                         controller.currentOptionCheckIndex = index;
                                  return controller.optWidgetList[index].optModelList;
                                }
                                else if(controller.optWidgetList[index].optType=="datetime") {
                                  controller.currentOptionTimeDateIndex= index;
                                     return controller.optWidgetList[index].optModelList;
                                } else if(controller.optWidgetList[index].optType=="Delivery Date") {
                                  controller.currentDeliveryDateIndex= index;
                                  return controller.optWidgetList[index].optModelList;
                                }
                                else {
                                  return Container();
                                }
                              },
                            ),*/
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10, right: 7),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Colors.white60,

                                          border: Border.all(
                                              color: Colors.black38,
                                              width: 0.5),
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          boxShadow: const <BoxShadow>[

                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.1),
                                                blurRadius: 3)

                                          ]),
                                      child: SizedBox(
                                        width:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.5,
                                        child: Center(
                                            child: FutureBuilder<List<ProductOption>>(
                                              future: controller.initProductOptions(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  var data = snapshot.data!.obs.value;

                                                  return DropdownButton<ProductOption>(
                                                    hint: const Text("Add An  Option"),
                                                    value: controller.selectedOption.value,
                                                    icon: const Icon(Icons.keyboard_arrow_down),
                                                    items: data.map<DropdownMenuItem<ProductOption>>(
                                                            (ProductOption value) {
                                                          return DropdownMenuItem<ProductOption>(
                                                            enabled: true,
                                                            value: value,
                                                            child: Text(value.type),
                                                          );
                                                        }).toList(),
                                                    onChanged: (v) {
                                                           v!.productOptionValue!.forEach((element) {
                                                             print(element.optionValueId);
                                                           });
                                                      if (v.type == "date") {
                                                        controller.addOptWidget(
                                                            OptModel(controller.optWidgetList.length,
                                                                v.type,
                                                                MainDateContainer(
                                                                    controller:
                                                                    controller,  index: controller
                                                                    .optWidgetList
                                                                    .length),
                                                                "yes",
                                                                "date",
                                                                "date",
                                                                false.obs));
                                                      } else if (v.type == "checkbox"||v.type=="radio") {

                                                        controller.addOptWidget(
                                                            OptModel(controller.optWidgetList.length,
                                                                v.type,
                                                                MainCheckBoxContainer(controller: controller,
                                                                  index: controller.optWidgetList.length,),
                                                                "yes",
                                                                v.type,
                                                                v.type,
                                                                false.obs));
                                                      } else if (v.type == "datetime") {
                                                        controller.addOptWidget(
                                                            OptModel(controller.optWidgetList.length,
                                                                v.type,
                                                                MainTimeDateContainer(
                                                                    controller:
                                                                    controller, index:  controller
                                                                    .optWidgetList
                                                                    .length,),
                                                                "yes",
                                                                "datetime",
                                                                "datetime",
                                                                false.obs));
                                                      } else if (v.type ==
                                                          "Delivery Date") {
                                                        controller.addOptWidget(
                                                            OptModel(controller
                                                                    .optWidgetList
                                                                    .length,
                                                                controller
                                                                    .selectedOption
                                                                    .value
                                                                    ?.type,
                                                                MainDeliveryDateContainer(controller: controller),
                                                                "yes",
                                                                "datetime",
                                                                "datetime",
                                                                false.obs));
                                                      }
                                                      // controller.optionId=v.optionId;
                                                      // controller.optionId=v.type;
                                                      // controller.optionId=v.optionId;

                                                      controller.productOption.add(AddProductOption(
                                                          type: v.type,
                                                          optionId: v.optionId,
                                                          required: v.required,

                                                        ));
                                                    },
                                                  );
                                                } else {
                                                  return const CircularProgressIndicator();
                                                }
                                              },
                                            )),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  isExpanded: item.isExpanded!.value);
            }).toList()));
  }


}

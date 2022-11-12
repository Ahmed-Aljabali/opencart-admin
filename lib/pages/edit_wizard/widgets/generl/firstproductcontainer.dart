import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../controllers/edit_wizard_controller.dart';
import '../../../../core/constrants/widgetconstrant.dart';

import '../../../../model/ProductData.dart';


class FirstProductContainer extends GetView<EditWizardController> {

  TextEditControllerCust textController = TextEditControllerCust();
  TextEditingController q = TextEditingController();


  @override
  Widget build(BuildContext context) {
    q.text= 'hello';
    return Obx(() => ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          controller.genrlproduct1[panelIndex].isExpanded!.value =
              !isExpanded;
        },
        children: controller.genrlproduct1.map<ExpansionPanel>((Product item) {
          return ExpansionPanel(
              backgroundColor: Colors.white,
              canTapOnHeader: true,
              headerBuilder: ((context, isExpanded) {
                return ListTile(
                    title: Text(
                  item.header!,
                  style: const TextStyle(fontSize: 20, ),
                  textAlign: TextAlign.center,
                ));
              }),
              body: Container(
                margin:
                    const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    DynamicTextFieldWidget(controller:controller.name, keyboardType: TextInputType.text,onFieldSubmitted:(value)
                    {

                      } ,hintText: 'product name',),
                    MyTextFieldWidget(hintText:"اسم المنتج" ,onChanged: (value)
                    {controller.productDescription.name=value ; }),

                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(hintText:"وصف المنتج" ,onChanged: (value)=>controller.productDescription.description=value,),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(hintText:"MetaTagTitle" ,onChanged:(value)=>controller.productDescription.metaTitle=value,),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(hintText:"Meta Tag Description" ,onChanged:(value)=>controller.productDescription.metaDescription=value,),
                    const SizedBox(height: 10,),
                    MyTextFieldWidget(hintText:"Meta Tag KeyWord" ,onChanged:(value)=>controller.productDescription.metaKeyword=value,),
                    const SizedBox(height: 10,),
                    MyTextFieldWidget(hintText:"Product Tags" ,onChanged:(value)=>controller.productDescription.tag=value,),

                  ],
                ),
              ),
              isExpanded: item.isExpanded!.value);
        }).toList()));
  }
}



import 'dart:ui';

import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/wizard_controller.dart';
import '../../../../core/constrants/text_constrants.dart';
import '../../../../core/constrants/widgetconstrant.dart';
import '../../../../model/ProductData.dart';





class FirstProductLinkeExpantionPanel extends StatelessWidget {
  const FirstProductLinkeExpantionPanel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Obx(() => ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            controller.linkeproduct1[panelIndex].isExpanded!.value =
            !isExpanded;
          },
          children: controller.linkeproduct1.map<ExpansionPanel>((Generl item) {
            return ExpansionPanel(
                backgroundColor: Colors.grey[200],
                canTapOnHeader: true,
                headerBuilder: ((context, isExpanded) {
                  return ListTile(
                      title: Text(
                        item.header!,
                        style: TextStyle(fontSize: 20,),
                        textAlign: TextAlign.center,
                      ));
                }),
                body: Container(
                  /* padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 10),*/
                  margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                     SizedBox(height: 10,),
                      TextDropdownFormField(
                        options: controller.compOptions,
                        decoration: companyInputDecoration,
                        dropdownHeight: controller.taxCategOptions.length * 50,
                      ),// الشركة المصنعة
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 59,
                        child: TextDropdownFormField(

                          options: controller.compCategOptions,
                          decoration: companyCategInputDecoration,
                          dropdownHeight: controller.compCategOptions.length * 50,
                        ),// الفئات
                      ),
                      SizedBox(height: 10,),
                      Container(height:47,child: MyTextFieldWidget(hintText: 'الفلتر', onChanged: (value){print(value);})),// الفلتر
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 59,
                        child: TextDropdownFormField(

                          options: controller.marketsOptions,
                          decoration: companyCategInputDecoration.copyWith(hintText:'المتاجر',labelText:'المتاجر'),
                          dropdownHeight: controller.marketsOptions.length * 50,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(height:47,child: MyTextFieldWidget(hintText: 'التحميلات', onChanged: (value){print(value);})),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 59,
                        child: TextDropdownFormField(

                          options: controller.relatedProdOptions,
                          decoration: companyCategInputDecoration.copyWith(hintText:'منتجات ذات صلة',labelText:'منتجات ذات صلة'),
                          dropdownHeight: controller.relatedProdOptions.length * 50,
                        ),
                      ),

                    ],
                  ),
                ),
                isExpanded: item.isExpanded!.value);
          }).toList())),
    );
  }
}
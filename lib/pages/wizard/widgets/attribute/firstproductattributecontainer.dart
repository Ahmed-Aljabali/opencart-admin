import 'dart:ui';


import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/wizard_controller.dart';
import '../../../mainproductpage/widgets/custom_list_title.dart';


class FirstProductAttributeContainer extends StatelessWidget {
  const FirstProductAttributeContainer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WizardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [

           Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 200.0,
                  child:  ListView.builder(

                    itemCount: controller.attrWidgetList.length,
                    itemBuilder: (context, index) {
                      String s = '$index ffsdf';
                      return  CustomTextFiled(s) ;


                    },
                  ),
                ),
              ),
            ],
          ),
          MaterialButton(
            color: Colors.grey,
            textColor: Colors.blueAccent,
            onPressed: () {

              controller.setAttrWidgetList("dd");

            },
          ),
        ],
      ),
    );
  }
}

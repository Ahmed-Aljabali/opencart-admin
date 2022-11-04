
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/wizard_controller.dart';

Widget dateTime(TextEditingController date ){
var controller=Get.put(MainWizardController());
  return  TextField(
    controller:date,

    onTap: () {
      controller.chooseGenerlDate(date);
     },
    textAlign: TextAlign.center,
    readOnly: true,
    decoration: InputDecoration(
      fillColor:Colors.white60, //background color of dropdown button
      prefixIcon: const Icon(
        Icons.date_range_rounded,
        color: Colors.blueAccent,
      ),
      hintText: DateFormat("dd-MM-yyyy")
          .format(controller.selectedDate.value)
          .toString(),
      hintStyle: const TextStyle(
        fontSize: 12,
      ),
      contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0, horizontal: 40.0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide:
        BorderSide(color: Colors.grey, width: 0.5),
        borderRadius:
        BorderRadius.all(Radius.circular(5.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide:
        BorderSide(color: Colors.grey, width: 2.0),
        borderRadius:
        BorderRadius.all(Radius.circular(32.0)),
      ),
    ),
  );

}
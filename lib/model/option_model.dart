import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'checkbox_data.dart';

class OptModel {
  var optType;
  var id;
  var optModelList;
  var isselectedCheckBoxOption;
  var isSelectedTimeDateOption;
  var isSelectedDateOption = Rxn<String>();
  var selectedOptionDate = DateTime.now().obs;
  var selectedOptionTimeDate = new DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;

  var isSelected;

  String? body;
  String? header;
  RxBool? isExpanded;
  RxList<CheckBoxDataModel> chbInnerModel = RxList<CheckBoxDataModel>([]);

  OptModel(this.id, this.optType, this.optModelList,
      this.isselectedCheckBoxOption,
      this.body, this.header, this.isExpanded);
}

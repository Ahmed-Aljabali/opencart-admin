
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product {
  Product({
    this.body,
    this.header,
    this.isExpanded,
  });

  String? body;
  String? header;
  RxBool? isExpanded;
}
class TextEditControllerCust{
  TextEditingController textController = TextEditingController();
}
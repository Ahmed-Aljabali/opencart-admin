import 'package:flutter/material.dart';

const taxCategInputDecoration= InputDecoration(

hintText: "فئة الضريبة",
border: OutlineInputBorder(),
focusedBorder: OutlineInputBorder(
borderSide:
BorderSide(color: Colors.grey, width: 2.0),
borderRadius:
BorderRadius.all(Radius.circular(32.0)),
),
contentPadding:
EdgeInsets.only(left: 15, right: 29),
suffixIcon: Icon(Icons.arrow_drop_down),
labelText: "فئة الضريبة",
alignLabelWithHint: true);


const companyInputDecoration= InputDecoration(

    hintText: "الشركة المصنعة",
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.grey, width: 2.0),
      borderRadius:
      BorderRadius.all(Radius.circular(32.0)),
    ),
    contentPadding:
    EdgeInsets.only(left: 15, right: 29),
    suffixIcon: Icon(Icons.arrow_drop_down),
    labelText: "الشركة المصنعة",
    alignLabelWithHint: true);

const companyCategInputDecoration= InputDecoration(

    hintText: "الفئات",
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.grey, width: 2.0),
      borderRadius:
      BorderRadius.all(Radius.circular(32.0)),
    ),
    contentPadding:
    EdgeInsets.only(left: 15, right: 29),
    suffixIcon: Icon(Icons.arrow_drop_down),
    labelText: "الفئات",
    alignLabelWithHint: true);
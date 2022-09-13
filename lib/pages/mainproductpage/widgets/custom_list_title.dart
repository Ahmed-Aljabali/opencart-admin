import 'package:flutter/material.dart';

import '../../../core/constrants/widgetconstrant.dart';

class CustomTextFiled extends StatelessWidget {
  var name;


  CustomTextFiled(this.name);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        MyTextFieldWidget(
          hintText: name,
          onChanged: (value) {},
        ),
       /* MyTextFieldWidget(
          hintText: 'field2',
          onChanged: (value) {},
        ),*/
      ],
    );
  }
}

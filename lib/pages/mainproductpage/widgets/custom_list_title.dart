import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/wizard_controller.dart';
import '../../../core/constrants/widgetconstrant.dart';



class RowTextFilds extends GetView<WizardController> {
  final  index= 0 ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(

      children: [
        Expanded(
          child: MyTextFieldWidget(
            hintText: 'إضافة',
            onChanged: (value) {},
          ),
        ),
        // Expanded(
        //
        //   child:  TextDropdownFormField(
        //
        //
        //     options: controller.featureOptionsList,
        //     decoration: InputDecoration(
        //
        //         hintText: "الميزة",
        //         border: OutlineInputBorder(),
        //         focusedBorder: OutlineInputBorder(
        //
        //           borderSide:
        //           BorderSide(color: Colors.grey, width: 2.0),
        //           borderRadius:
        //           BorderRadius.all(Radius.circular(32.0)),
        //         ),
        //         contentPadding:
        //         EdgeInsets.only(left: 15, right: 29),
        //         suffixIcon: Icon(Icons.arrow_drop_down),
        //         labelText: "الميزة",
        //
        //         alignLabelWithHint: true),
        //     dropdownHeight: controller.featureOptionsList.length * 50,
        //   ),
        // ),
        RawMaterialButton(


          elevation: 1.0,

          shape: CircleBorder(),
          fillColor: Colors.blueAccent,
          onPressed: (){  },
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 20.0,
          ),
          constraints: BoxConstraints.tightFor(
            width: 30.0,
            height: 30.0,
          ),
        ),
        /* Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[

                                          FloatingActionButton(
                                              heroTag: "tag4",
                                              backgroundColor: Colors.lightBlue,
                                              child: Text("Add"),

                                              onPressed: () {}),
                                        ],
                                      ),*/
        /* MaterialButton(onPressed: (){}  , child:Icon(Icons.close,color: Colors.white,) ,color: Colors.green,)*/

      ],);
  }
}

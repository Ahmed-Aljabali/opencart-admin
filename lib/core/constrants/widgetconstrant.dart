import 'dart:ui';

import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatelessWidget {
  final String hintText ;
  final Function onChanged ;
  final readOnly ;
  final textAlign;
  final prefixIcon ;
  final double  height  ;
  final keyboardType ;
final color ;
  final double  fontSize  ;
  final bool obscureText;
   MyTextFieldWidget({Key? key,this.obscureText = false,this.color = Colors.grey,this.fontSize =15,this.keyboardType, this.height  = 43,required this.hintText,required this.onChanged( value) ,this.readOnly = false,this.textAlign= TextAlign.center , this.prefixIcon = null}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height:height,
      child: DecoratedBox(
          decoration: BoxDecoration(

              color:Colors.white,

              borderRadius: BorderRadius.circular(10),
              boxShadow: const <BoxShadow>[

              ]
          ),
        child:Center(
            child: TextField(


              obscureText: obscureText,
              readOnly: readOnly,
              //controller:  controller.controllers.value,
              onChanged: (dynamic value){onChanged(value);},
              textAlign: textAlign ,
              keyboardType:  keyboardType,
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                fillColor:Colors.transparent,
                hintText:hintText,

                hintStyle:  TextStyle(
                  fontSize: fontSize,
                  color: color,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),


              ),
            ),
          ),
        )
    );



  }
}


class DynamicTextFieldWidget extends StatelessWidget {
  final String hintText ;
  final Function onFieldSubmitted ;
  final  controller;
  final keyboardType;
  final height ;
  DynamicTextFieldWidget({required this.hintText,this.height = 43,required this.onFieldSubmitted( String value),required this.controller, required this.keyboardType });
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
     // height: height,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        keyboardType: keyboardType,
        onFieldSubmitted: (value){onFieldSubmitted(value);},

        textAlign: TextAlign.center,

      ),
    );



  }
}
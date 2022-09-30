import 'package:flutter/material.dart';
import 'package:opencart/controllers/wizard_controller.dart';

class MyTextFieldWidget extends StatelessWidget {
  final String hintText ;
  final Function onChanged ;

   /*Widget prefixIcon  =  Icon(Icons.date_range_rounded ,color:  Colors.blueAccent,);*/
  MyTextFieldWidget({required this.hintText,required this.onChanged( String value), });
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 43,
      child: TextField(

decoration: InputDecoration(
  hintText: hintText,
),
        onChanged: (String value){onChanged(value);},
        textAlign: TextAlign.center,

      ),
    );



  }
}

class MyTryTextFieldWidget extends StatelessWidget {
  final String hintText ;
  final Function onFieldSubmitted ;
  final controller;
  final keyboardType;
  /*Widget prefixIcon  =  Icon(Icons.date_range_rounded ,color:  Colors.blueAccent,);*/
  MyTryTextFieldWidget({required this.hintText,required this.onFieldSubmitted( String value),required this.controller, required this.keyboardType });
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 43,
      child: TextFormField(

        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
        ),
keyboardType: keyboardType,

        onSaved: (value){onFieldSubmitted(value);},

        textAlign: TextAlign.center,

      ),
    );



  }
}
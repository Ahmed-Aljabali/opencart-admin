import 'package:flutter/material.dart';
import 'package:opencart/controllers/wizard_controller.dart';

class MyTextFieldWidget extends StatelessWidget {
  final String hintText ;
  final Function onChanged ;

   /*Widget prefixIcon  =  Icon(Icons.date_range_rounded ,color:  Colors.blueAccent,);*/
  MyTextFieldWidget({required this.hintText,required this.onChanged( value), });
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 43,
      child: TextField(


        onChanged: (dynamic value){onChanged(value);},
        textAlign: TextAlign.center,

      ),
    );



  }
}


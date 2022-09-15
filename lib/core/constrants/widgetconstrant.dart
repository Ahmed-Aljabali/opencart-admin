import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatelessWidget {
  final String hintText ;
  final Function onChanged ;
  MyTextFieldWidget({required this.hintText,required this.onChanged( value)});
  @override
  Widget build(BuildContext context) {
    return TextField(

      onChanged: (value){onChanged(value);},
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText:hintText,

        hintStyle: TextStyle(
          fontSize: 19,
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: 10.0, horizontal: 40.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Colors.grey, width: 0.5),
          borderRadius:
          BorderRadius.all(Radius.circular(5.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Colors.grey, width: 2.0),
          borderRadius:
          BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}


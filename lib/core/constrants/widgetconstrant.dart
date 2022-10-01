import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatelessWidget {
  final String hintText ;
  final Function onChanged ;
  const MyTextFieldWidget({Key? key, required this.hintText,required this.onChanged( value) }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 43,
      child: DecoratedBox(
          decoration: BoxDecoration(

              color:Colors.white60,

              borderRadius: BorderRadius.circular(10),
              boxShadow: const <BoxShadow>[

              ]
          ),

          child:Center(
            child: TextField(
              //controller:  controller.controllers.value,
              onChanged: (dynamic value){onChanged(value);},
              textAlign: TextAlign.center,

              decoration: InputDecoration(

                fillColor:Colors.transparent,
                hintText:hintText,

                hintStyle: const TextStyle(

                ),



              ),
            ),
          )
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

        onFieldSubmitted: (value){onFieldSubmitted(value);},

        textAlign: TextAlign.center,

      ),
    );



  }
}
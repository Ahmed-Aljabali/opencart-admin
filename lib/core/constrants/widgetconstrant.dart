import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatelessWidget {
  final String hintText ;
  final Function onChanged ;
  const MyTextFieldWidget({Key? key, required this.hintText,required this.onChanged( value) }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  DecoratedBox(
        decoration: BoxDecoration(

            color:Colors.white60,
            border: Border.all(color: Colors.black38, width:0.5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const <BoxShadow>[

            ]
        ),

        child:Container(
          margin: const EdgeInsets.only(left: 5),


          child: Center(
            child: TextField(
              //controller:  controller.controllers.value,
              onChanged: (dynamic value){onChanged(value);},
              textAlign: TextAlign.center,

              decoration: InputDecoration(

                fillColor:Colors.transparent,
                hintText:hintText,

                hintStyle: const TextStyle(
                  fontSize: 13,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 40.0),


              ),
            ),
          ),
        )
    );



  }
}


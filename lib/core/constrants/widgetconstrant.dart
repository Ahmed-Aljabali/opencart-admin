import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatelessWidget {
  final String hintText ;
  final Function onChanged ;
   /*Widget prefixIcon  =  Icon(Icons.date_range_rounded ,color:  Colors.blueAccent,);*/
  MyTextFieldWidget({required this.hintText,required this.onChanged( value), });
  @override
  Widget build(BuildContext context) {
    return  DecoratedBox(
        decoration: BoxDecoration(

            color:Colors.white60, //background color of dropdown button
            border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
            borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
            boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
              //blur radius of shadow
            ]
        ),

        child:Container(
          margin: EdgeInsets.only(left: 5),


          child: Center(
            child: TextField(




              onChanged: (dynamic value){onChanged(value);},
              textAlign: TextAlign.center,
              decoration: InputDecoration(

                fillColor:Colors.transparent,
                hintText:hintText,

                hintStyle: TextStyle(
                  fontSize: 19,
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 40.0),


              ),
            ),
          ),
        )
    );



  }
}


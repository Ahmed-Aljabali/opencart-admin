import 'dart:ui';

import 'package:flutter/material.dart';

class BestDataTable extends StatelessWidget {
  final String hintText ;
  final Function onChanged ;
  final readOnly ;
  final textAlign;
  final prefixIcon ;
  const BestDataTable({Key? key, required this.hintText,required this.onChanged( value) ,this.readOnly = false,this.textAlign= TextAlign.center , this.prefixIcon = null}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 43,
      child: DecoratedBox(
          decoration: BoxDecoration(

              color:Colors.white,

              borderRadius: BorderRadius.circular(10),
              boxShadow: const <BoxShadow>[

              ]
          ),

          child:Center(
              child: Column(children: <Widget>[
                Container(

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade400),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Table(
                          border: TableBorder(
                              horizontalInside: BorderSide(color: Colors.blue.shade400),
                              right: BorderSide(color: Colors.blue.shade400)
                          ),
                          children: [
                            TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0))
                                ),
                                children: [
                                  Container(
                                      height: 30.0,
                                      child: Center(child: Text('I', ))),
                                ]),
                            TableRow(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                ),
                                children: [
                                  Container(
                                      height: 30.0,
                                      child: Center(child: Text('He'))),
                                ]),
                            TableRow( children: [
                              Container(
                                  height: 30.0,
                                  child: Center(child: Text('She'))),
                            ]),
                            TableRow( children: [
                              Container(
                                  height: 30.0,
                                  child: Center(child: Text('It'))),
                            ]),
                            TableRow( children: [
                              Container(
                                  height: 30.0,
                                  child: Center(child: Text('You',))),
                            ]),
                            TableRow( children: [
                              Container(
                                  height: 30.0,
                                  child: Center(child: Text('We'))),
                            ]),
                            TableRow( children: [
                              Container(
                                  height: 30.0,
                                  child: Center(child: Text('They'))),
                            ]),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Table(
                          border: TableBorder.symmetric(inside: BorderSide(color: Colors.blue.shade400)),
                          children: [
                            TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10.0))
                                ),
                                children: [
                                  Container(
                                      height: 30.0,
                                      child: Center(child: Text('Am',)))
                                ]),
                            TableRow( children: [
                              Container(
                                  height: 90.0,
                                  child: Center(child: Text('Is')))
                            ]),
                            TableRow( children: [
                              Container(
                                  height: 90.0,
                                  child: Center(child: Text('Are')))
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]))
      ),
    );



  }
}
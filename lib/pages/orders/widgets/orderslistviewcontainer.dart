import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencart/core/utils/math_utils.dart';


class MyOrderListViewContainer extends StatelessWidget {



  final myProducts = List<String>.generate(25, (i) => 'Product ${i+1}');

  @override
  Widget build(BuildContext context) {
    return


      ListView.builder(

          itemCount: myProducts.length,


          itemBuilder: (context, index) {
            return Container(


              height: getHorizontalSize(120),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white54,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),


                key: ValueKey(myProducts[index]),
                margin: getMargin(bottom: 5, top: 5 ,left: 10,right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: getMargin(top: 5,left: 2),
                      alignment: Alignment.topLeft,


                      child:/*PopupMenuButton(
                            onSelected: (value) {

                            },


                            itemBuilder: (ctx) => [
                              _buildPopupMenuItem( Icons.search, ),
                              _buildPopupMenuItem( Icons.upload),
                              _buildPopupMenuItem(Icons.copy,),

                            ],
                          )*/ InkWell(onTap: (){

                      },child: PopupMenuButton (
                        onSelected: (value) {
                          print('ucsf');

                        },


                        itemBuilder: (ctx) => [
                          _buildPopupMenuItem(Icons.visibility_outlined, ),
                          _buildPopupMenuItem(   Icons.delete,),
                          _buildPopupMenuItem(Icons.edit,),
                          _buildPopupMenuItem(Icons.print,),
                          _buildPopupMenuItem(Icons.share,),

                        ],
                      ),),),

                    Padding(
                      padding: getPadding(top: 15 ,bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(



                            margin: getMargin(
                              left: 5,
                              top: 2,
                              right: 5,
                            ),

                            child: Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      left: 5,
                                      top: 4,
                                      bottom: 4,
                                    ),
                                    child: Text(
                                      "ريال",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getFontSize(
                                          11,
                                        ),
                                        fontFamily: 'Cairo Regular',
                                        fontWeight: FontWeight.bold,
                                        height: 1.00,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 4,
                                      top: 4,
                                      right: 9,
                                      bottom: 4,
                                    ),
                                    child: Text(
                                      '1500',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black ,
                                        fontSize:getFontSize(15),

                                        fontFamily: 'Cairo Regular',
                                        fontWeight: FontWeight.bold,
                                        height: 1.00,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ), // اسم المنتج وسعرة
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: getMargin(

                                top: 5,
                                right: 8,
                                bottom: 15
                              ),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                   4,
                                  ),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  Padding(
                                    padding: getPadding(
                                      left: 10,
                                      top: 4,
                                      right: 10,
                                      bottom: 4,
                                    ),
                                    child: Text(
                                     'غير مدفوع',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                        9,


                                        fontFamily: 'Cairo Regular',
                                        fontWeight: FontWeight.w600,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ), // اسم المنتج وسعرة
                            ),
                          ),
                        ],),
                    ),//s

                    Expanded(
                      child: Container(
                        padding:getPadding(left: 10,top: 15,bottom: 25,right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              alignment: Alignment.topRight,
                              padding:getPadding(bottom: 16),


                              margin: getMargin(
                                left: 14,
                                top: 2,
                                right: 10,
                              ),
                              decoration: BoxDecoration(


                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    7.70,
                                  ),
                                ),
                              ),
                              child:Text(
                                'اسم العميل ان وجد',
                                overflow: TextOverflow.clip,

                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize:getFontSize(18),

                                  fontFamily: 'Cairo Regular',
                                  fontWeight: FontWeight.bold,
                                  height: 2.00,
                                ),
                              ),// اسم المنتج وسعرة
                            ),

                            Expanded(
                                child :  Row(


                                  children: [
                                    Expanded(child: Container()),
                                    Container(child: Text('10-10-2010',maxLines: 4,   overflow: TextOverflow.clip, style: TextStyle(fontSize: 15.0 ,color: Colors.black,fontFamily: 'Cairo Regular',fontWeight: FontWeight.bold) , )),
                                    Container(child: Text('  -   #0001   ',maxLines: 4,   overflow: TextOverflow.clip, style: TextStyle(fontSize: 15.0 ,color: Colors.black,fontFamily: 'Cairo Regular',fontWeight: FontWeight.bold) , )),
                                  ],
                                )
                            ),
                            /* Expanded(


                                child: Text('تلفون سامسونج اس 10 ذهبي فرايزون شريحتين',
                                  maxLines: 4,




                                        style: TextStyle(

                                          color: Color.fromRGBO(0, 84, 143, 1),
                                          fontSize: getFontSize(
                                            14,
                                          ),
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400,
                                          height: 1.00,
                                        ),
                                      ),




                                ),*/


                          ],),
                      ),
                    ),



                  ],
                ),
              ),
            );
          });
  }
}

PopupMenuItem _buildPopupMenuItem(
    IconData iconData) {
  return PopupMenuItem(

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          iconData,
          color: Colors.black,
        ),

      ],
    ),
  );
}
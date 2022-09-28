import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencart/core/utils/math_utils.dart';


class MyListViewContainer extends StatelessWidget {


  // Generate a massive list of dummy products
  final myProducts = List<String>.generate(25, (i) => 'Product ${i+1}');

  @override
  Widget build(BuildContext context) {
    return

        // implement the list view
        ListView.builder(
          // the number of items in the list
            itemCount: myProducts.length,

            // display each item of the product list
            itemBuilder: (context, index) {
              return Container(


                height: getHorizontalSize(120),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white54,
                    ),
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),

                  // In many cases, the key isn't mandatory
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
                              _buildPopupMenuItem( Icons.search, ),
                              _buildPopupMenuItem( Icons.upload),
                              _buildPopupMenuItem(Icons.copy,),

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
                            decoration: BoxDecoration(

                              color: Colors.green,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  7.70,
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
                                    left: 5,
                                    top: 4,
                                    bottom: 4,
                                  ),
                                  child: Text(
                                    "ريال",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: getFontSize(
                                        11,
                                      ),
                                      fontFamily: 'Cairo',
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
                                      color: Colors.white,
                                      fontSize:getFontSize(15),

                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w600,
                                      height: 1.00,
                                    ),
                                  ),
                                ),
                              ],
                            ), // اسم المنتج وسعرة
                          ),
                          Container(


                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'متوفر : ',
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
                                  TextSpan(
                                    text: '100',
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
                                  TextSpan(
                                    text: ' حبة',
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 84, 143, 1),
                                      fontSize: getFontSize(
                                        12,
                                      ),
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w400,
                                      height: 1.00,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],),
                      ),

                      Expanded(
                        child: Container(
                          padding:getPadding(left: 10,top: 15,bottom: 15,right: 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
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
                                  'تلفون سامسونج10 ',
                                  overflow: TextOverflow.clip,

                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 84, 143, 1),
                                    fontSize:getFontSize(15),

                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w600,
                                    height: 1.00,
                                  ),
                                ),// اسم المنتج وسعرة
                              ),

                            Expanded(
                                  child :  Text('''
 تلفون سامسونج اس 10 ذهبي تلفون سامسونج اس 10 ذهبي''',maxLines: 4,   overflow: TextOverflow.clip, style: TextStyle(fontSize: 12.0 ,color: Colors.black) , )
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

                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Expanded(
                          child: SizedBox(

                            height:150,
                            width: 89,

                            child: Image.asset(

                              'images/s10.jpg',
                            ),
                          ),
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
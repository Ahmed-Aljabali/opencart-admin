import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/porducts_controller.dart';
import '../../../core/utils/math_utils.dart';
import '../../../model/porducts/product.dart';
/*class GridtrashItemWidget extends StatelessWidget {
 final List<Products> product;
  const GridtrashItemWidget({Key? key,required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
     GridView.builder(
      itemCount:product.length,

      itemBuilder: (context,index) {
        return Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Container(
            padding:const EdgeInsets.only(bottom: 1, top: 10),
            height: 250,
            width: getHorizontalSize(
              170.00,
            ),
            child: Stack(
              fit:  StackFit.expand,
              alignment: Alignment.center,
              children: [
                Align(

                  alignment: Alignment.center,
                  child: Container(
                    margin: getMargin(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          5.00,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: getHorizontalSize(
                            0.1,
                          ),
                          offset:const Offset(
                            0,
                            1,
                          ), //shadow of the container
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 150,
                            bottom: 15,
                          ),
                          child: Container(
                            height: getVerticalSize(
                              20.00,
                            ),
                            width: getHorizontalSize(
                              20.00,
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.snackbar(
                                  "Icon Action",
                                  "Delet button was clicked",
                                  icon:const Icon(Icons.person, color: Colors.white),
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              },
                              child: IconButton(
                                  onPressed: (){
                                    final  products = Get.put(ProductController());
                                    products.deleteProduct(product[index].id);
                                  },
                                icon:const Icon(Icons.delete) ,

                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 10,
                            top: 150,
                            bottom: 10,
                          ),
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                Get.snackbar(
                                  "Icon Action",
                                  "Edit button was clicked",
                                  icon: Icon(Icons.person, color: Colors.white),
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              },
                              child: Icon(
                                Icons.edit_outlined,
                                color: Colors.blue,
                              ),
                            ),
                            height: getSize(
                              25.00,
                            ),
                            width: getSize(
                              20.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 12,
                            top: 150,
                            right: 67,
                            bottom: 10,
                          ),
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                Get.snackbar(
                                  " Icon Action",
                                  "A button was Clicked",
                                  icon: Icon(Icons.visibility_outlined,
                                      color: Colors.blue),
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              },
                              child: Icon(
                                Icons.visibility_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            height: getVerticalSize(
                              20.00,
                            ),
                            width: getHorizontalSize(
                              20.00,
                            ),
                          ),
                        ),
                      ],
                    ), //three Icons of delete and edit and show
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: getVerticalSize(
                      137.00,
                    ),
                    width: getHorizontalSize(
                      150.00,
                    ),
                    margin: getMargin(
                      left: 12,
                      right: 4,
                      bottom: 20,
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: getVerticalSize(
                              137.00,
                            ),
                            width: getHorizontalSize(
                              150.00,
                            ),
                            margin: getMargin(
                              right: 10,
                            ),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    margin: getMargin(
                                      left: 8,
                                      top: 10,
                                      right: 10,
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
                                          // child: Text(
                                          //   "ريال",
                                          //   overflow: TextOverflow.ellipsis,
                                          //   textAlign: TextAlign.start,
                                          //   style: TextStyle(
                                          //     color: Colors.white,
                                          //     fontSize: getFontSize(
                                          //       7,
                                          //     ),
                                          //     fontFamily: 'Cairo',
                                          //     fontWeight: FontWeight.bold,
                                          //     height: 1.00,
                                          //   ),
                                          // ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 4,
                                            top: 4,
                                            right: 9,
                                            bottom: 1,
                                          ),
                                          child: Text(
                                            product[index].price.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: getFontSize(
                                                9,
                                              ),
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w600,
                                              height: 1.00,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                margin: getMargin(top:35),
                                    child:Center(
                                      child: Image.asset(
                                        'images/s10.jpg',
                                      ),
                                    ),
                                    height: getSize(
                                      125.00,
                                    ),
                                    width: getSize(
                                      180.00,
                                    ),
                                  ),
                                ),// the image container
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: getHorizontalSize(
                      86.00,
                    ),
                    margin: getMargin(
                      left: 10,
                      top: 30,
                      right: 8,
                      bottom: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only(top: 19),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: product[index].productDescription![0].name,
                                    style: TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: getFontSize(
                                        12,
                                      ),
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w700,
                                      height: 1.00,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Container(
                          margin: getMargin(
                            left: 19,
                            top: 30,
                            bottom: 5,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'متوفر : ',
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                    height: 1.00,
                                  ),
                                ),
                                TextSpan(
                                  text: product[index].quantity.toString(),
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                    height: 1.00,
                                  ),
                                ),
                                TextSpan(
                                  text: ' حبة',
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: getFontSize(
                                      9,
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
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 35, right: 100),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: () {},
                        child: const Icon(Icons.more_vert, color: Colors.blue)),
                  ),
                ),
              ],
            ),
          ),
        );
      },  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: 2,
       crossAxisSpacing: 5.0,
       mainAxisSpacing: 5.0,
     ),);
  }
}*/ // the  old class gridview container


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/porducts_controller.dart';
import '../../../core/utils/math_utils.dart';
import '../../../model/porducts/product.dart';
class NewGridtrashItemWidget extends StatelessWidget {
  final List<Products> product;
  const NewGridtrashItemWidget({Key? key,required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(


        physics: const ScrollPhysics(),

        itemCount:product.length,

        itemBuilder: (context,index) {
          return Container(

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  5.00,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: getHorizontalSize(
                    0.5,
                  ),
                  offset:const Offset(

                    1,
                    1,
                  ), //shadow of the container
                ),
              ],
            ),
            child: Container(

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    7.70,
                  ),
                ),
              ),
              child: Column(


                children: [
                  Container(
                    constraints: BoxConstraints(maxHeight: 100,),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          7.70,
                        ),
                      ),
                    ),
                    child: Container(

                      alignment: Alignment.topCenter,
                      padding: getPadding(top: 5),

                      child:Image.asset(

                        'images/s10.jpg',
                      ),

                    ),
                  ),
                  Row(children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: getMargin(
                          left: 14,
                          top: 2,
                          right: 10,
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
                                    7,
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
                                product[index].price.toString(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                  9,

                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w600,
                                  height: 1.00,
                                ),
                              ),
                            ),
                          ],
                        ), // اسم المنتج وسعرة
                      ),
                    ),
                    Expanded(child: Container(),),
                    Container(
                      padding: getPadding(right: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.only(top: 1),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: product[index].productDescription![0].name,
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w700,
                                    height: 1.00,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),

                  ],),
                  Container(margin:getMargin(top: 5),padding: getPadding(all: 3),child: Center(child: Text('this is the describtion of an item',style: TextStyle(color: Colors.grey,fontSize: getFontSize(12)),)),),
                  Row(
                    children: [
                      Row(

                        children: [
                          Padding(
                            padding: getPadding(
                              left: 10,
                              top: 6,
                              right: 5,
                              bottom: 15,
                            ),
                            child: Container(
                              height: getVerticalSize(
                                20.00,
                              ),
                              width: getHorizontalSize(
                                20.00,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.snackbar(
                                    "Icon Action",
                                    "Delet button was clicked",
                                    icon:const Icon(Icons.person, color: Colors.white),
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                },
                                child: IconButton(
                                  onPressed: (){
                                    final  products = Get.put(ProductController());
                                    products.deleteProduct(product[index].id);
                                  },
                                  icon:const Icon(Icons.delete) ,

                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 10,
                              top: 10,
                              right: 5,
                              bottom: 5,
                            ),
                            child: SizedBox(
                              child: InkWell(
                                onTap: () {
                                  Get.snackbar(
                                    "Icon Action",
                                    "Edit button was clicked",
                                    icon: Icon(Icons.person, color: Colors.white),
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                },
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.blue,
                                ),
                              ),
                              height: getSize(
                                20.00,
                              ),
                              width: getSize(
                                20.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 5,
                              top: 10,
                              right: 5,
                              bottom: 5,
                            ),
                            child: SizedBox(
                              child: InkWell(
                                onTap: () {
                                  Get.snackbar(
                                    " Icon Action",
                                    "A button was Clicked",
                                    icon: Icon(Icons.visibility_outlined,
                                        color: Colors.blue),
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                },
                                child: Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              height: getVerticalSize(
                                20.00,
                              ),
                              width: getHorizontalSize(
                                20.00,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: getMargin(
                          right: 10,

                          top: 10,
                          bottom: 5,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'متوفر : ',
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w400,
                                  height: 1.00,
                                ),
                              ),
                              TextSpan(
                                text: product[index].quantity.toString(),
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w400,
                                  height: 1.00,
                                ),
                              ),
                              TextSpan(
                                text: ' حبة',
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: getFontSize(
                                    9,
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


                    ],
                  ),



                ],
              ),),

          );
        },
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(

          crossAxisCount: 2,
          crossAxisSpacing: 3.0,
          mainAxisSpacing: 3.0,
        ),),
    );

  }
}











import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/math_utils.dart';

class GridtrashItemWidget extends StatelessWidget {
  GridtrashItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.only(bottom: 1, top: 10),
        height: 250,
        width: getHorizontalSize(
          170.00,
        ),
        child: Stack(
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
                      offset: Offset(
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
                        child: InkWell(
                          onTap: () {
                            Get.snackbar(
                              "Icon Action",
                              "Delet button was clicked",
                              icon: Icon(Icons.person, color: Colors.white),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
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
                    /*  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: getVerticalSize(
                          109.00,
                        ),
                        width: getHorizontalSize(
                          170.00,
                        ),
                        margin: getMargin(
                          left: 2,
                          top: 8,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              7.00,
                            ),
                          ),
                        ),
                      ),
                    ),*/
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        bottom: 1,
                                      ),
                                      child: Text(
                                        "1500",
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
                                padding: EdgeInsets.only(left: 10, bottom: 7),
                                child: Center(
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
                            ),
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
                                text: ' +تلفون سامسونج 10',
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
                              text: '20',
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
              margin: getMargin(top: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {},
                    child: Icon(Icons.more_vert, color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

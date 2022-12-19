import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:opencart/controllers/edit_wizard_controller.dart';
import '../../../bindings/edti_wizard_controller.dart';
import '../../../controllers/porducts_controller.dart';
import '../../../core/utils/math_utils.dart';
import '../../../model/porducts/product.dart';


import 'package:flutter/cupertino.dart';

import '../../edit_wizard/wizard_page.dart';
import '../../widgets/dialogs.dart';

class NewGridtrashItemWidget extends GetView<EditWizardController> {
  final List<Products> product;
  const NewGridtrashItemWidget({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = Get.put(EditWizardController());

    return Expanded(

      child: GridView.builder(
        shrinkWrap: true,
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
                                  onPressed: () async{
                                    final  products = Get.put(ProductController());
                                    Get.defaultDialog(

                                        title: "هل انت متأكد من الحذف",
                                        textCancel: "الالغاء",

                                        cancelTextColor: Colors.redAccent,
                                        confirm:FlatButton(
                                            onPressed: ()async{
                                  await  products.deleteProduct(product[index].id).then((value) => {
                                        if (products.isDataLoading.isTrue){
                                          Get.back(),
                                          successMessage("تم الحذف بنجاح")
                                        }
                                  });
                                            }, child: Text("تأكيد",style: TextStyle(color: Colors.green),)) ,
                                        backgroundColor: Colors.white,
                                        titleStyle: TextStyle(color: Colors.redAccent),

                                        radius: 30
                                    );
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
                                  Get.to(EditWizardPage(),binding:WizardBinding() );

                                  p.initProductEditing(product[index]);

                                },
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.blue,

                                ),
                              ),
                              height: getSize(
                                12.00,
                              ),
                              width: getSize(
                                12.0,
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











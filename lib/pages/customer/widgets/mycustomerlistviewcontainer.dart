

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/Controllers/customer_controller.dart';
import 'package:opencart/pages/widgets/dialogs.dart';

import '../../../Controllers/order_controller.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../core/utils/math_utils.dart';
import '../../../model/cutomers/customer.dart';
import '../../../model/orders/order.dart';

class MyCustomerListViewContainer extends StatelessWidget {
  const MyCustomerListViewContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customerController =Get.put(CustomerController());
    return ListView.builder(
      controller: customerController.scrollController,
        itemCount: customerController.lstCustomer.length,
        itemBuilder: (context, index) {
          if (index == customerController.lstCustomer.length - 1 &&
              customerController.isMoreDataAvailable.value == true) {
            return Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            height: getHorizontalSize(120),
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.white54,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              key: ValueKey(customerController.lstCustomer[index]),
              margin: getMargin(bottom: 5, top: 5 ,left: 10,right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: getMargin(top: 5,left: 2),
                    alignment: Alignment.topLeft,


                    child: InkWell(
                      onTap: (){

                      },
                      child: PopupMenuButton (

                        onSelected: (value) {
                          if (value==2){
                            var dashBoardController=Get.put(DashBoardController());
                            Get.defaultDialog(
                                title: "هل انت متأكد من الحذف",
                                textCancel: "الالغاء",
                                cancelTextColor: Colors.redAccent,
                                confirm:FlatButton(
                                    onPressed: ()async{
                                      customerController.deleteCustomer(customerController.lstCustomer[index].customerid!).then((value) =>
                                      {
                                        if(customerController.isDataLoading.isTrue){
                                          Get.back(),
                                          successMessage("تم الحذف بنجاح"),

                                          }
                                        });

                                    }, child: Text("تأكيد",style: TextStyle(color: Colors.green),)) ,
                                backgroundColor: Colors.white60,
                                titleStyle: TextStyle(color: Colors.redAccent),

                                radius: 30
                            );
                          }

                        },

                        itemBuilder: (ctx) => [
                          _buildPopupMenuItem(Icons.visibility_outlined,1 ),
                          _buildPopupMenuItem(Icons.delete,2),
                          _buildPopupMenuItem(Icons.edit,3),
                          _buildPopupMenuItem(Icons.print,4),
                          _buildPopupMenuItem(Icons.share,5),

                        ],
                      ),),),

                  Padding(
                    padding: getPadding(top: 15 ,bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(
                          child: Container(
                            margin: getMargin(
                              left: 5,
                              top: 2,
                              right: 5,
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
                                  //   customer[index].customergroupid.toString()!,
                                  //   overflow: TextOverflow.ellipsis,
                                  //   textAlign: TextAlign.start,
                                  //   style: TextStyle(
                                  //     color: Colors.black,
                                  //     fontSize: getFontSize(
                                  //       11,
                                  //     ),
                                  //     fontFamily: 'Cairo Regular',
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
                                    bottom: 4,
                                  ),
                                  child: Text(
                                    customerController.lstCustomer[index].telephone!,
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
                                  child:  Text(
                                    customerController.lstCustomer[index].email!,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
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
                              customerController.lstCustomer[index].name!,
                              overflow: TextOverflow.clip,

                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize:getFontSize(12),

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
                                  Text(customerController.lstCustomer[index].date_added!,maxLines: 4,   overflow: TextOverflow.clip, style: const TextStyle(fontSize: 10.0 ,color: Colors.black,fontFamily: 'Cairo Regular',fontWeight: FontWeight.bold) , ),
                                  Text('  -   #${customerController.lstCustomer[index].customerid!.toString()}   ',maxLines: 4,   overflow: TextOverflow.clip, style: TextStyle(fontSize: 10.0 ,color: Colors.black,fontFamily: 'Cairo Regular',fontWeight: FontWeight.bold) , ),
                                ],
                              )
                          ),

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

PopupMenuItem _buildPopupMenuItem(IconData iconData,int value) {
  return PopupMenuItem(
    value: value,
    onTap: (){

    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          iconData,
          color: Colors.black,
        )

      ],
    ),
  );
}
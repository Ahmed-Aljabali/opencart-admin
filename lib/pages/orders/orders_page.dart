import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:opencart/controllers/porducts_controller.dart';
import 'package:opencart/controllers/wizard_controller.dart';
import 'package:opencart/model/porducts/product.dart';
import 'package:opencart/pages/orders/widgets/orderslistviewcontainer.dart';
import 'package:opencart/pages/orders/widgets/searchpopupformorder.dart';

import '../../Controllers/order_controller.dart';
import '../../core/utils/math_utils.dart';
import '../../model/orders/add_order.dart';
import '../loginpage/loginpage.dart';
import '../mainproductpage/widgets/gridviewcontainer.dart';
import '../mainproductpage/widgets/listviewbuilder.dart';
import '../wizard/wizard_page.dart';

class OrderPage extends GetView<OrderController> {

var productController =Get.put(ProductController());

  OrderPage({Key? key}) : super(key: key);
  @override
  // TODO: implement controller

  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    controller.fetchOrder();

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.blueGrey.withOpacity(0.16),

        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [

              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Center(
                      child: Text(
                        "اضافة طلب",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black,fontFamily: 'Cairo Regular',
                          fontWeight: FontWeight.w400,

                          height: 1.00,),
                      )),
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ],
          ),
          /* leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),*/
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 11, left: 11, top: 11, bottom: 11),
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 11, left: 11),
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            Get.snackbar(
                              "Icon Action",
                              "Search button was clicked",
                              icon: const Icon(Icons.check, color: Colors.blue),
                              snackPosition: SnackPosition.TOP,
                            );
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        prefixIcon: InkWell(
                          onTap: () {
                            Get.snackbar(
                              "Icon Action",
                              "Settings button was clicked",
                              icon: const Icon(Icons.check, color: Colors.blue),
                              snackPosition: SnackPosition.TOP,
                            );
                          },
                          child: InkWell(
                            onTap: () {
                              controller.searchFormVisible.value = true;
                            },
                            child: const Icon(
                              Icons.filter_list_alt,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        hintText: 'ابحث من هنا ',
                        hintStyle: const TextStyle(
                          fontSize: 19,
                          fontFamily: 'Cairo Regular',
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 40.0),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          /* onTap: () {
                             controller.orderListTypeGrid.value = true;
                              print(controller.orderListTypeGrid.value);
                            },*/ // to activate the gridviewlist
                            child: controller.orderListTypeGrid.value ? Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: getHorizontalSize(
                                        0.1,
                                      ),
                                      offset: const Offset(
                                        0,
                                        4,
                                      ), //shadow of the container
                                    ),
                                  ],
                                ),
                                margin: getMargin(all: 2),
                                child: const Icon(Icons.grid_view)) : const Icon(
                                Icons.grid_view)),
                      ),
                      const SizedBox(

                          width: 5

                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: InkWell(
                            onTap: () {
                              controller.orderListTypeGrid.value = false;
                            },
                            child: controller.orderListTypeGrid.value
                                ? const Icon(Icons.format_list_bulleted)
                                : Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: getHorizontalSize(
                                        0.1,
                                      ),
                                      offset: const Offset(
                                        0,
                                        4,
                                      ), //shadow of the container
                                    ),
                                  ],
                                ),
                                margin: getMargin(all: 2),
                                child: const Icon(Icons.format_list_bulleted))),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: TextButton(
                          onPressed: () {
                            Get.snackbar(
                              "TextBotton Action",
                              "Text button was clicked",
                              icon: const Icon(Icons.check, color: Colors.blue),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                          child: const Text(
                            'تحديد الكل',
                            style: TextStyle(color: Colors.blue,fontFamily: 'Cairo Regular',),
                          ),
                        ),
                      )
                    ],
                  ),
                  // if (productController.dataProduct.isEmpty||productController.dataProduct.isEmpty)
                  //   const CircularProgressIndicator() else
                  //   controller.orderListTypeGrid.value ? NewGridtrashItemWidget(
                  //       product: productController.dataProduct)
                  //       :
                  if (controller.isDataLoading.value==false)
                    const CircularProgressIndicator() else
                     Expanded(
                      child: MyOrderListViewContainer(order: controller.data),
                    ),


                ],
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: (!controller.searchFormVisible.value)
                    ? null
                    : Container(
                  margin: getMargin(top: 60,bottom: 50),
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(30.0),

                      color: Colors.white
                  ),

                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    padding: getPadding(all: 19),
                    child: Column(

                      children: <Widget>[
                        Row(
                          children: [
                            Container(

                                padding: const EdgeInsets.only(left: 20, top: 10),
                                child: InkWell(
                                    onTap: () {
                                      controller.searchFormVisible.value = false;
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.grey,
                                      size: 25,
                                    ))),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: const Text(
                                      'فلتر البحث',
                                      style: TextStyle(color: Colors.grey, fontSize: 22,fontFamily: 'Cairo Regular'),
                                      textAlign: TextAlign.center,
                                    ))),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                          indent: 20,
                          endIndent: 15,
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child:

                          OrderSearchForm(),

                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                  child: Text(
                                    'الغاء',
                                    style: TextStyle(fontSize: 25, color: Colors.grey[800],fontFamily: 'Cairo Regular'),
                                  ),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                  minWidth: 100,
                                  height: 60,
                                  color: Colors.white60,
                                  onPressed: () {
                                    controller.searchFormVisible.value = false;
                                  }),
                              const SizedBox(
                                width: 50,
                              ),
                              MaterialButton(
                                  child: const Text(
                                    'بحث',
                                    style: const TextStyle(fontSize: 25, color: Colors.white,fontFamily: 'Cairo Regular'),
                                  ),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                  minWidth: 100,
                                  height: 60,
                                  color: Colors.green,
                                  onPressed: () {

                                    controller.searchFormVisible.value = false;
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton:(controller.searchFormVisible.value)
            ? null
            :  SizedBox(

          height: 50.0,
          width: 50.0,
          child: FloatingActionButton(


            backgroundColor: Colors.green,
            onPressed: () {
          //     var paymentaddress=PaymentAddress(firstname: "Ahmed",lastname: "Aljabali",zone: "0");
          //     var method=ShippingMethod(code: "flat.flat",title: "test");
          //     var customer =Customer(email: "ahmed@gmail.com",lastname: "Aljabali",firstname: "Ahmed",customerId: 1,telephone: "776816212",customerGroupId: 1);
          //     List<ProductsOrder>? products=[];
          //     products.add(ProductsOrder(productId: 49,quantity: 2,option: Option(i227: 17)));
          //   var shippingmethod=ShippingMethod(title: "tesr",code: "flat.flat");
          // //  var shippingaddress=PaymentAddress();
          //     var order = AddOrders(
          //         affiliateId: "",
          //         comment: "",
          //         storeId: 0,
          //         coupon: "111",
          //         tracking: "",
          //         voucher: "demo-0000",
          //         shippingAddress:paymentaddress ,
          //         shippingMethod: shippingmethod ,
          //         paymentAddress: paymentaddress,
          //         customer:customer,
          //         paymentMethod: method,
          //         products:products  );
          //     controller.addOrder(order);
              Get.snackbar(
                "Icon Action",
                "Search button was clicked",
                icon:  const Icon(Icons.check, color: Colors.green,),
                snackPosition: SnackPosition.TOP,
              );
            },
            tooltip: 'add a new product',
            highlightElevation: 1,

            child:   Container(

              decoration: BoxDecoration(

                color: Colors.transparent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: Colors.black.withOpacity(0.7),
                    spreadRadius: 7,
                    blurRadius: 27,

                  ),
                ],
              ),
              child: const Icon(
                Icons.add,size: 35,
              ),
            ),


          ),
        ),
      );
    });
  }
}
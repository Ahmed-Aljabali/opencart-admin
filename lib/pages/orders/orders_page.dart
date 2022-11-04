import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:opencart/controllers/porducts_controller.dart';
import 'package:opencart/pages/orders/pages/sales/sales.dart';
import 'package:opencart/pages/orders/widgets/orderslistviewcontainer.dart';
import 'package:opencart/pages/orders/widgets/searchpopupformorder.dart';

import '../../Controllers/order_controller.dart';
import '../../controllers/Init_add_order_controller.dart';
import '../../core/utils/math_utils.dart';
import '../../model/orders/add_order.dart';

class OrderPage extends GetView<InitAddOrderController> {
  const OrderPage({Key? key}) : super(key: key);
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
                      readOnly:  true,
                      onTap: (){     controller.searchFormVisible.value = true; },
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(
                          Icons.filter_list_alt,
                          color: Colors.grey,
                        ),
                        hintText: 'ابحث من هنا ',
                        hintStyle: TextStyle(
                          fontSize: 19,
                          fontFamily: 'Cairo Regular',
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 40.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
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
                    const CircularProgressIndicator()
                  else

                    if (controller.listFilter.obs.value==null)
                     Expanded(child: MyOrderListViewContainer(order: controller.data))
                     else
                     Expanded(child: MyOrderListViewContainer(order: controller.listFilter!),
                    ),


                ],
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: (!controller.searchFormVisible.value)
                    ? null
                    : Container(
                  margin: getMargin(top: MediaQuery.of(context).size.height*0.25,bottom: MediaQuery.of(context).size.height*0.1),



                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, //New
                          blurRadius: 2.0,
                        )
                      ] ,
                      borderRadius: BorderRadius.circular(30.0),

                      color: Colors.white
                  ),

                  alignment: Alignment.center,
                  child: SingleChildScrollView (
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
                        const AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: OrderSearchForm(),

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
                              // DropdownButtonFormField()
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
                                   controller.filterOrderList();

                                   controller.filterOrder.idOrder==1;
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
              Get.to(Sales());
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
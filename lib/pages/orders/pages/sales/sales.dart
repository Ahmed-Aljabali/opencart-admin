import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/Init_add_order_controller.dart';
import 'package:opencart/core/utils/math_utils.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/fifthsalescontainer/fifthsalescontainer.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/firstsalescontainer/firstsalescontainer.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/forthsalescontainer/forthsalescontainer.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/secontsalescontainter/secontsalescontainter.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/thirdsalescontainer/thirdsalescontainer.dart';

import '../../../../model/orders/add_order.dart';



class Sales extends GetView<InitAddOrderController> {

  Sales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(


          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title:const Text(
              'المبيعات',
              style: TextStyle(color: Colors.black, fontSize: 17,fontFamily: 'Cairo Regular'),
            ),
            centerTitle: true,
          ),
          body: Container(
            color: Colors.blueGrey.withOpacity(0.16),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: getPadding(top: 50,),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            FirstSalesContainer(),
                            SecondSalesContainer(),
                            ThirdSalesContainer(),
                            ForthSalesContainer(),
                            FifthSalesContainer()
                            /*SecondProductContainer(
                              controller: controller,
                            ),
                            ThirdProductContainer(controller: controller),
                            ForthProductContainer(controller: controller),
                            FifhProductScreen(controller: controller),
 */                       ],
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(


            backgroundColor: Colors.green,
            onPressed: () {

               controller.paymentAddress.value!.address1=controller.paymentAddressController.text;
               controller.paymentAddress.value!.address2=controller.paymentAddressController.text;
               controller.paymentAddress.value!.lastname=controller.paymentLastNameController.text;
               controller.paymentAddress.value!.firstname=controller.paymentFirstNameController.text;
               controller.paymentAddress.value!.city=controller.paymentCityController.text;
               controller.paymentAddress.value!.zone=controller.paymentCodeZoneController.text;

               controller.shippingAddress.value!.address1=controller.shippingAddressController.text;
               controller.shippingAddress.value!.address2=controller.shippingAddress2Controller.text;
               controller.shippingAddress.value!.lastname=controller.shippingLastNameController.text;
               controller.shippingAddress.value!.firstname=controller.shippingFirstNameController.text;
               controller.shippingAddress.value!.city=controller.shippingCityController.text;
               controller.shippingAddress.value!.zone=controller.shippingCodeZoneController.text;


               List<ProductsOrder>? products=[];
                products.clear();
               products.add(ProductsOrder(productId:controller.productsOrder.productId,quantity:controller.productsOrder.quantity,option: Option(i227: 17)));

               controller.addOrders.value.shippingAddress=controller.shippingAddress.value;
               controller.addOrders.value.paymentAddress=controller.paymentAddress.value;
               controller.addOrders.value.shippingAddress=controller.shippingAddress.value;
               controller.addOrders.value.shippingMethod=controller.orderShippingMethods.value;
               controller.addOrders.value.paymentMethod=controller.paymentMethod.value;
               controller.addOrders.value.customer=controller.customer.value;
               controller.addOrders.value.products=products;
               controller.addOrder(controller.addOrders.value);

            },
            tooltip: 'add a new product',
            highlightElevation: 1,

            child:   Container(

                decoration: const BoxDecoration(

                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),

                ),
                child: const Text('حفظ')
            ),


          ),
        ),

    );
  }

}
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
              // var paymentaddress=PaymentAddress(firstname: "ALi",lastname: "Mohammaed",zone: "0");
              // var method=ShippingMethod(code: "flat.flat",title: "test");
              // var customer =Customer(email: "ahmed@gmail.com",lastname: "Mohammaed",firstname: "ALi",customerId: 1,telephone: "776816212",customerGroupId: 1);
               List<ProductsOrder>? products=[];
              products.add(ProductsOrder(productId: 49,quantity: 2,option: Option(i227: 17)));
              // var shippingmethod=ShippingMethod(title: "tesr",code: "flat.flat");
              // //  var shippingaddress=PaymentAddress();
               controller.shippingPayment.value.address1=controller.addressController.text;
               controller.shippingPayment.value.address2=controller.address2Controller.text;
               controller.shippingPayment.value.lastname=controller.lastNameController.text;
               controller.shippingPayment.value.firstname=controller.firstNameController.text;
               controller.shippingPayment.value.city=controller.cityController.text;
               controller.shippingPayment.value.zone=controller.codeZoneController.text;
               controller.shippingPayment.value.address1=controller.addressController.text;

              var order = AddOrders(
                  affiliateId: "",
                  comment: "",
                  storeId: 0,
                  coupon: "111",
                  tracking: "",
                  voucher: "demo-0000",
                  shippingAddress:controller.shippingPayment.value ,
                  shippingMethod: controller.shippingMethods.value ,
                  paymentAddress: controller.shippingPayment.value,
                  customer:controller.customer.value,
                  paymentMethod: controller.paymentMethod.value,
                  products:products);

                controller.addOrder(order);
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/order_controller.dart';
import 'package:opencart/core/utils/math_utils.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/fifthsalescontainer.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/firstsalescontainer.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/forthsalescontainer.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/secontsalescontainter.dart';
import 'package:opencart/pages/orders/pages/sales/widgets/thirdsalescontainer.dart';

import '../../../../controllers/porducts_controller.dart';
import '../../../../controllers/wizard_controller.dart';

import '../../../wizard/widgets/generl/fifthproductscreen.dart';

import '../../../wizard/widgets/generl/fothproductcontainer.dart';
import '../../../wizard/widgets/generl/secondproductcontainter.dart';
import '../../../wizard/widgets/generl/thirdproductcontainer.dart';


class Sales extends GetView<BaseController> {



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
                            FirstSalesContainer(
                              controller: controller,
                            ),
                            SecondSalesContainer(controller: controller),
                            ThirdSalesContainer(controller: controller),
                            ForthSalesContainer(controller: controller),
                            FifthSalesContainer(controller: controller)
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


              // print(controller.selectedAttribu.value!.attributeId);
              //   controller.addNewProduct();
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
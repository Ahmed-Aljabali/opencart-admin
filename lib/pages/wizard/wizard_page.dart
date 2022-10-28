import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/core/utils/math_utils.dart';
import 'package:opencart/model/porducts/product.dart';
import 'package:opencart/pages/wizard/widgets/attribute/firstproductattributecontainer.dart';
import 'package:opencart/pages/wizard/widgets/custom_stepper.dart';
import 'package:opencart/pages/wizard/widgets/discount/discountcontainer.dart';
import 'package:opencart/pages/wizard/widgets/generl/fifthproductscreen.dart';
import 'package:opencart/pages/wizard/widgets/generl/fothproductcontainer.dart';
import 'package:opencart/pages/wizard/widgets/generl/secondproductcontainter.dart';
import 'package:opencart/pages/wizard/widgets/generl/thirdproductcontainer.dart';
import 'package:opencart/pages/wizard/widgets/linke/firstproductlinkecontainer.dart';
import 'package:opencart/pages/wizard/widgets/options/optionsproductcontainer.dart';
import 'package:opencart/pages/wizard/widgets/seo/seopage.dart';
import 'package:opencart/pages/wizard/widgets/subscribe/subscribeproductcontainer.dart';

import '../../controllers/porducts_controller.dart';
import 'widgets/generl/firstproductcontainer.dart';
import '../../controllers/wizard_controller.dart';

class WizardPage extends GetView<WizardController> {



  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const Text(
              'إضافة منتج',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(

                  decoration: const BoxDecoration(

                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),

                  ),

                  margin: getMargin(top: 10,right: 8,left: 8,bottom: 8),
                  padding:getPadding(all: 10),
                  child: Text(get_title(controller.currentStep.value),style: TextStyle(fontSize: 20,fontFamily: 'Cairo Regular',color: Colors.white,fontWeight: FontWeight.bold),),
                ),),

              Expanded(
                flex: 8,
                child: Timeline(

                  children: <Widget>[
                    // FirstProductContainer(),

                    controller.SingleStep(0,
                        StepData(
                            Column(
                              children: [
                                FirstProductContainer(),
                                SecondProductContainer(),
                                ThirdProductContainer(),
                                ForthProductContainer(),
                                FifhProductScreen(),
                              ],
                            )
                        )),
                    controller.SingleStep(1,
                        StepData(
                            FirstProductLinkeExpantionPanel()
                        )),

                    controller.SingleStep(2,
                        StepData(
                            FirstProductAttributeContainer()
                        )),
                    controller.SingleStep(3,
                        StepData(
                            OptionsProductContainer()
                        )),
                    controller.SingleStep(4,
                        StepData(
                          FirstProductSubscribeContainer(),
                        )),

                    controller.SingleStep(5,
                        StepData(
                          DiscountContainer(),
                        )),
                    controller.SingleStep(6,
                        StepData(
                          Seo(),
                        )),


                  ],
                  indicators: <Widget>[
                    controller.stepheader( controller.currentStep.value,0,Icons.work),
                    controller.stepheader( controller.currentStep.value,1,Icons.info_outline_rounded),
                    controller.stepheader( controller.currentStep.value,2,Icons.perm_device_info),
                    controller.stepheader( controller.currentStep.value,3,Icons.add),
                    controller.stepheader( controller.currentStep.value,4,Icons.subscriptions),
                    controller.stepheader( controller.currentStep.value,5,Icons.discount),
                    controller.stepheader( controller.currentStep.value,6,Icons.star),
                  ],
                ),
              ),

              Padding(
                padding: getPadding(bottom: 50),
                child: Expanded(

                    flex: 1,
                    child:  InkWell(
                      onTap: (){
                        if(controller.currentStep.value!=6) {
                          controller.tapped(controller.currentStep.value + 1);
                        }
                      },
                      child:  Container(


                        decoration: const BoxDecoration(

                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),

                        ),

                        margin: getMargin(top: 10,right: 8,left: 8,bottom: 8),
                        padding:getPadding(all: 10),
                        child: Text('NextStep',style: TextStyle(fontSize: 20,fontFamily: 'Cairo Regular',color: Colors.white,fontWeight: FontWeight.bold),),
                      ),)),
              )
            ],
          ),



          floatingActionButton: FloatingActionButton(


            backgroundColor: Colors.green,
            onPressed: ()  {
              //  controller.productDescriptionlist.add(controller.productDescription);
              // controller.prod.productDescription=controller.productDescriptionlist;
              //  controller.addProduct(controller.prod);
              //
              // var index=0 ;
              // for (var element in controller.attrWidgetList) {
              //   print(element.attrSelected);
              //
              //   controller.textEditingController[index].text;
              //
              //   controller.productAttributeDescription.value?.text=controller.textEditingController[index].text;
              //   index++;
              //
              // }
              // // controller.prod.productAttribute=controller.productAttribute;
              // //  print(controller.productAttributeDescription.value!.languageId);
              //
              // print(controller.productAttributeDescription.value?.languageId);
            //    print(controller.productDescription.name);
            //    print(controller.prod.model);
            //    print(controller.prod.sku);
            //    print(controller.prod.price);
            //    print(controller.prod.quantity);
            // //   print(controller.linkeproduct1.quantity);
            //    print(controller.manufacturersId.value);
            //    print(controller.categorieId.value);
            //    print(controller.selectedrelatedProdOptions.value);
            //    print(controller.storesId.value);
            //    print(controller.storesId.value);
            //
            //
            //     var index=0 ;
            //   for (var element in controller.attrWidgetList) {
            //     print(element.attrSelected);
            //
            //
            //     controller.textEditingController[index].text;
            //     print(controller.textEditingController[index].text);
            //     controller.productAttributeDescription.value?.text=controller.textEditingController[index].text;
            //     index++;
            //
            //   }
              controller.firstdiscountDataList.forEach((element) {
                print(element.price);
                print(element.qty);
                print(element.clintGroup);

              });
              print(controller.rewardsController.text);
              print(controller.pointsController.text);
              controller.seconddiscountDataList.forEach((element) {


                print(element.clintGroup);
              });
              print(controller.prod.shipping);

      //         print(controller.addFirstDiscountModel.)
      //         print(controller.prod.upc);
      //         print(controller.prod.model);
      //         controller.productOption.forEach((element) {
      //              print(element.optionId);
      //              print(element.type);
      //              print(element.required);
      //              element.productOptionValue?.forEach((e)
      // {
      // print(e.price);
      // }
      //                   );
      //
      //
      //         });
            },
            tooltip: 'add a new product',
            highlightElevation: 1,

            child: Container(

                decoration: BoxDecoration(

                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),

                ),
                child: const Text('Save')
            ),


          ),
        ),
      );
    });
  }

}

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
import '../../presentation/Widgets/dialogs.dart';
import 'widgets/generl/firstproductcontainer.dart';
import '../../controllers/wizard_controller.dart';

class MainWizardPage extends GetView<MainWizardController> {

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
                child: MainTimeline(

                  children: <Widget>[
                    // FirstProductContainer(),

                    controller.SingleStep(0,
                        StepData(
                            Column(
                              children: [
                                MainFirstProductContainer(),
                                MainSecondProductContainer(),
                                MainThirdProductContainer(),
                                MainForthProductContainer(),
                                MainFifhProductScreen(),
                              ],
                            )
                        )),
                    controller.SingleStep(1,
                        StepData(
                            MainFirstProductLinkeExpantionPanel()
                        )),

                    controller.SingleStep(2,
                        StepData(
                            MainFirstProductAttributeContainer()
                        )),
                    controller.SingleStep(3,
                        StepData(
                            MainOptionsProductContainer()
                        )),
                    // controller.SingleStep(4,
                    //     StepData(
                    //       FirstProductSubscribeContainer(),
                    //     )),

                    controller.SingleStep(4,
                        StepData(
                          MainDiscountContainer(),
                        )),
                    // controller.SingleStep(6,
                    //     StepData(
                    //       Seo(),
                    //     )),


                  ],
                  indicators: <Widget>[
                    controller.stepheader( controller.currentStep.value,0,Icons.work),
                    controller.stepheader( controller.currentStep.value,1,Icons.info_outline_rounded),
                    controller.stepheader( controller.currentStep.value,2,Icons.perm_device_info),
                    controller.stepheader( controller.currentStep.value,3,Icons.add),
               //     controller.stepheader( controller.currentStep.value,4,Icons.subscriptions),
                    controller.stepheader( controller.currentStep.value,4,Icons.discount),
             //       controller.stepheader( controller.currentStep.value,6,Icons.star),
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
              print(controller.dateController.text);
              //
              // List<int> productCategory=[];
              // List<int> productFilter=[];
              // List<int> productRelated=[];
              // List<ProductAttribute> productAttribute=[];
              // var index=0;
              // if (controller.categorieId.value!=null)
              // {
              //   productCategory.add(controller.categorieId.value!);
              //   controller.prod.productCategory=productCategory;
              // }
              // print(controller.selectedrelatedProdOptions.value);
              // if (controller.selectedrelatedProdOptions.value!=null)
              // {
              //   productRelated.add(controller.selectedrelatedProdOptions.value!);
              //   controller.prod.productRelated=productRelated;
              // }
              //
              // if (controller.attrWidgetList.isNotEmpty)
              // {
              //   for (var element in controller.attrWidgetList) {
              //     List<ProductAttributeDescription> productAttributeDescription=[];
              //     productAttributeDescription.add(ProductAttributeDescription(languageId:element.attrSelected.languageId, text: controller.textEditingController[index].text ));
              //
              //     productAttribute.add(ProductAttribute(attributeId:element.attrSelected.attributeId,productAttributeDescription: productAttributeDescription ));
              //
              //     index++;
              //   }
              //   controller.prod.productAttribute=productAttribute;
              // }
              // controller.productDescriptionlist.add(controller.productDescription);
              // controller.prod.productDescription=controller.productDescriptionlist;
              //
              // controller.productOption.forEach((element) {
              //   element.productOptionValue=controller.productOptionValue;
              // });
              // controller.prod.productOption=controller.productOption;
              // controller.prod.productSpecial=controller.productSpecial;
              // controller.prod.productDiscount=controller.productDiscount;
              //
              // controller.prod.reward=controller.rewardsController.text;
              // controller.prod.points=controller.pointsController.text;
              // productFilter.add(5050);
              //
              // controller.prod.productFilter=productFilter;
              // controller.addProduct(controller.prod);
              //
              // if (controller.error.isNotEmpty)
              // {
              //   errorDialog(controller.error.first);
              // }else
              // {
              //   successDialog(controller.msg);
              //   controller.productDescriptionlist.clear();
              //   controller.prod.productDiscount!.clear();
              // }

            },
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
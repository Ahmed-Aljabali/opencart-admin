import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/core/utils/math_utils.dart';
import 'package:opencart/pages/edit_wizard/widgets/attribute/firstproductattributecontainer.dart';
import 'package:opencart/pages/edit_wizard/widgets/discount/discountcontainer.dart';
import 'package:opencart/pages/edit_wizard/widgets/options/optionsproductcontainer.dart';
import 'package:opencart/pages/wizard/widgets/custom_stepper.dart';
import '../../controllers/edit_wizard_controller.dart';
import '../edit_wizard/widgets/generl/fifthproductscreen.dart';
import '../edit_wizard/widgets/generl/fothproductcontainer.dart';
import '../edit_wizard/widgets/generl/secondproductcontainter.dart';
import '../edit_wizard/widgets/generl/thirdproductcontainer.dart';
import '../edit_wizard/widgets/linke/firstproductlinkecontainer.dart';
import 'widgets/generl/firstproductcontainer.dart';


class EditWizardPage extends GetView<EditWizardController> {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const Text(
              'تعديل منتج',
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
                    // controller.SingleStep(4,
                    //     StepData(
                    //       FirstProductSubscribeContainer(),
                    //     )),

                    controller.SingleStep(4,
                        StepData(
                          DiscountContainer(),
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
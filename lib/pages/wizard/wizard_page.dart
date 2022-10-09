import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/model/porducts/product.dart';
import 'package:opencart/pages/wizard/widgets/attribute/firstproductattributecontainer.dart';
import 'package:opencart/pages/wizard/widgets/discount/discountcontainer.dart';
import 'package:opencart/pages/wizard/widgets/generl/fifthproductscreen.dart';
import 'package:opencart/pages/wizard/widgets/generl/fothproductcontainer.dart';
import 'package:opencart/pages/wizard/widgets/generl/secondproductcontainter.dart';
import 'package:opencart/pages/wizard/widgets/generl/thirdproductcontainer.dart';
import 'package:opencart/pages/wizard/widgets/linke/firstproductlinkecontainer.dart';
import 'package:opencart/pages/wizard/widgets/options/optionsproductcontainer.dart';
import 'package:opencart/pages/wizard/widgets/subscribe/subscribeproductcontainer.dart';

import '../../controllers/porducts_controller.dart';
import 'widgets/generl/firstproductcontainer.dart';
import '../../controllers/wizard_controller.dart';

class WizardPage extends GetView<WizardController> {
  StepperType stepperType = StepperType.vertical;
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title:const Text(
              'إضافة منتج',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            centerTitle: true,
          ),
          body: Row(
            children: [
              Expanded(
                child: Stepper(
                  type: stepperType,
                  physics:const ClampingScrollPhysics(),
                  currentStep: controller.currentStep.value,
                  onStepTapped: (step) => controller.tapped(step),
                  onStepContinue:
                      controller.isVaild.value ? controller.continued : null,
                  onStepCancel: controller.cancel,
                  steps: <Step>[
                    Step(
                      title: const Text('Generl'),
                      content: Column(
                        children: [
                          FirstProductContainer(
                            controller: controller,
                          ),
                          SecondProductContainer(
                            controller: controller,
                          ),
                          ThirdProductContainer(controller: controller),
                          ForthProductContainer(controller: controller),
                          FifhProductScreen(controller: controller),
                        ],
                      ),
                      isActive: controller.currentStep.value >= 0,
                      state: controller.currentStep.value >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title:  const Text('Linke'),
                      content:FirstProductLinkeExpantionPanel(controller: controller,),
                      isActive: controller.currentStep.value >= 0,
                    //   state: controller.currentStep.value >= 1
                    //       ? StepState.complete
                    //       : StepState.disabled,
                     ),
                    Step(

                      title:  const Text('Attribute'),
                      content:FirstProductAttributeContainer(controller: controller,),
                      isActive: controller.currentStep.value >= 0,
                      // state: controller.currentStep.value >= 2
                      //     ? StepState.complete
                      //     : StepState.disabled,
                    ), //attripute
                    Step(
                      title:  const Text("Options"),
                      content: Column(
                        children: <Widget>[
                          /*if(controller.selectedOption.value=='Date')
                            CheckBoxContainer(controller: controller),*/
                          OptionsProductContainer(controller: controller)
                        ],
                      ),
                      isActive: controller.currentStep.value >= 0,
                      // state: controller.currentStep.value >= 3
                      //     ? StepState.complete
                      //     : StepState.disabled,
                    ), // options
                    Step(
                      title:  const Text('الاشتراك'),
                      content: FirstProductSubscribeContainer(controller: controller,),
                      isActive: controller.currentStep.value >= 0,
                      // state: controller.currentStep.value >= 4
                      //     ? StepState.complete
                      //     : StepState.disabled,
                    ),// subscribe
                    Step(
                      title: const Text('تخفيض'),
                      content: DiscountContainer(controller: controller,),
                      isActive: controller.currentStep.value >= 0,
                      state: controller.currentStep.value >= 5
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title:  const Text('SEO'),
                      content: DiscountContainer(controller: controller,) ,
                      isActive: controller.currentStep.value >= 0,
                      // state: controller.currentStep.value >= 6
                      //     ? StepState.complete
                      //     : StepState.disabled,
                    ),
                    Step(
                      title:const Text('step8'),
                      content: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(labelText: 'step8'),
                          ),
                        ],
                      ),
                      isActive: controller.currentStep.value >= 0,
                      // state: controller.currentStep.value >= 7
                      //     ? StepState.complete
                      //     : StepState.disabled,
                    ),

                  ],
                ),
              ),


            ],
          ),
floatingActionButton: FloatingActionButton(


  backgroundColor: Colors.green,
  onPressed: () {
   //  controller.productDescriptionlist.add(controller.productDescription);
   // controller.prod.productDescription=controller.productDescriptionlist;
   //  controller.addProduct(controller.prod);

     var index=0 ;
     for (var element in controller.attrWidgetList) {
       print(element.attrSelected);

       controller.textEditingController[index].text;
      // controller.selectedProductAttribute.obs.value.value?.attributeId=="5";
     //  print(controller.selectedProductAttribute.obs.value.value?.attributeId);

       controller.productAttributeDescription.value?.text=controller.textEditingController[index].text;

       //controller.selectedProductAttribute.value!.productAttributeDescription!.add(controller.productAttributeDescription.value!);
       //controller.productAttribute.add(controller.selectedProductAttribute.value!);
       index++;

     }
    // controller.prod.productAttribute=controller.productAttribute;
   //  print(controller.productAttributeDescription.value!.languageId);

     print(controller.productAttributeDescription.value?.languageId);
  },
  tooltip: 'add a new product',
  highlightElevation: 1,

  child:   Container(

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
      ),
    );
  }

}

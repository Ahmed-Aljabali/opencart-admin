
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:opencart/Controllers/customer_controller.dart';


import '../../controllers/wizard_controller.dart';
import '../wizard/widgets/generl/firstproductcontainer.dart';
import 'widgets/general.dart';

class CustomerPage extends GetView<CustomerController> {
  const CustomerPage({Key? key}) : super(key: key);
  @override
  StatelessElement createElement() {

    controller.fetchCustomer("10","3");

    return super.createElement();
  }
 final StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Obx(
            () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title:const Text(
              'إضافة عميل',
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
                      title: const Text('عام', style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Cairo Regular",fontSize: 20),),
                      content: Column(
                        children: [
                          GeneralFirstCustomerExpantionPanel(controller: controller,)
                        ],
                      ),
                      isActive: controller.currentStep.value >= 0,
                      state: controller.currentStep.value >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                    title:  const Text('Linke'),
                      content: const Text('Linke'),
                      isActive: controller.currentStep.value >= 0,
                      //   state: controller.currentStep.value >= 1
                      //       ? StepState.complete
                      //       : StepState.disabled,
                    ),
                    Step(

                      title:  const Text('Attribute'),
                      content:const Text('Attribute'),
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
                          const Text('Attribute'),
                        ],
                      ),
                      isActive: controller.currentStep.value >= 0,
                      // state: controller.currentStep.value >= 3
                      //     ? StepState.complete
                      //     : StepState.disabled,
                    ), // options
                    Step(
                      title:  const Text('الاشتراك'),
                      content: const Text('Attribute'),
                      isActive: controller.currentStep.value >= 0,
                      // state: controller.currentStep.value >= 4
                      //     ? StepState.complete
                      //     : StepState.disabled,
                    ),// subscribe
                    Step(
                      title: const Text('تخفيض'),
                      content: const Text('Attribute'),
                      isActive: controller.currentStep.value >= 0,
                      // state: controller.currentStep.value >= 5
                      //     ? StepState.complete
                      //     : StepState.disabled,
                    ),
                    Step(
                      title:  const Text('step7'),
                      content: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(labelText: 'step7'),
                          ),
                        ],
                      ),
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

        ),
      ),
    );
  /*    Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
                  () => !controller.isDataLoading.value? const Center(
          child: CircularProgressIndicator(),
                 ): Text("controller.trx.data.toString()"),
            ),
          ],
        ),
      ),
    );*/

  }
}

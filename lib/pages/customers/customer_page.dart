import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/Controllers/customer_controller.dart';
import 'package:opencart/controllers/wizard_controller.dart';
import 'package:opencart/core/utils/math_utils.dart';
import 'package:opencart/pages/customers/widgets/adresses/adress.dart';
import '../wizard/widgets/custom_stepper.dart';
import 'widgets/generl/general.dart';

class CustomerPage extends GetView<CustomerController> {
  const CustomerPage({Key? key}) : super(key: key);


  @override
  StatelessElement createElement() {
    controller.fetchCustomer("10","3");
    return super.createElement();
  }


  @override
  Widget build(BuildContext context) {
    final WizardController wizardController = Get.find();
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
          body:Column(
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
                  padding: getPadding(bottom: 10,left: 10,right: 10),
                  child: Text(get_title2(wizardController.currentStep.value),style: TextStyle(fontSize: 20,fontFamily: 'Cairo Regular',color: Colors.white,fontWeight: FontWeight.bold),),
                ),),

              Expanded(
                flex: 8,
                child: Timeline(
                  children: <Widget>[
                    wizardController.SingleStep(0,
                        StepData(
                            Column(
                              children: [
                                GeneralFirstCustomerExpantionPanel()
                              ],
                            )
                        )),
                    wizardController.SingleStep(1,
                        StepData(
                            AddressForm()
                        )),
                  ],
                  indicators: <Widget>[
                    wizardController.stepheader( wizardController.currentStep.value,0,Icons.account_circle_rounded),
                    wizardController.stepheader( wizardController.currentStep.value,1,Icons.info_outline_rounded),

                  ],
                ),
              ),

              Padding(
                padding: getPadding(bottom: 30),
                child: Expanded(

                    flex: 1,
                    child:  InkWell(
                      onTap: () {
                        wizardController.currentStep.value != 1 ?
                        wizardController.tapped(
                            wizardController.currentStep.value + 1) : null;
                      },
                      child:   wizardController.currentStep.value <1 ? Container(


                        decoration: const BoxDecoration(

                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),

                        ),

                        margin: getMargin(top: 10,right: 8,left: 8,bottom: 8),
                        padding:getPadding(all: 10),
                        child: Text('NextStep',style: TextStyle(fontSize: 20,fontFamily: 'Cairo Regular',color: Colors.white,fontWeight: FontWeight.bold),),
                      ):Container(),
                    ),
                ),
              )
            ],
          ),

/*
          Row(
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
                          *//*if(controller.selectedOption.value=='Date')
                            CheckBoxContainer(controller: controller),*//*
                          const Text('Attribute'),
                        ],
                      ),
                      isActive: controller.currentStep.value >= 0,
                      // state: controller.currentStep.value >= 3
                      //     ? StepState.complete
                      //     : StepState.disabled,
                    ), // options

                  ],
                ),
              ),


            ],
          ),*/

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

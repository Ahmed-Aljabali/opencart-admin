import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/pages/wizard/widgets/attribute/firstproductattributecontainer.dart';
import 'package:opencart/pages/wizard/widgets/generl/fifthproductscreen.dart';
import 'package:opencart/pages/wizard/widgets/generl/fothproductcontainer.dart';
import 'package:opencart/pages/wizard/widgets/generl/secondproductcontainter.dart';
import 'package:opencart/pages/wizard/widgets/generl/thirdproductcontainer.dart';
import 'package:opencart/pages/wizard/widgets/linke/firstproductlinkecontainer.dart';
import 'package:opencart/pages/wizard/widgets/options/optionsproductcontainer.dart';

import 'widgets/generl/firstproductcontainer.dart';
import '../../controllers/wizard_controller.dart';

class WizardPage extends GetView<WizardController> {
  StepperType stepperType = StepperType.vertical;

  List<bool> _expands = [true, true, true, true];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              'إضافة منتج',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: Stepper(
                    type: stepperType,
                    physics: AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    currentStep: controller.currentStep.value,
                    onStepTapped: (step) => controller.tapped(step),
                    onStepContinue:
                        controller.isVaild.value ? controller.continued : null,
                    onStepCancel: controller.cancel,
                    steps: <Step>[
                      Step(
                        title: new Text('Generl'),
                        content: Column(
                          children: [
                            Firstproductcontainer(
                              controller: controller,
                            ),
                            Secondproductcontainer(
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
                        title: new Text('Linke'),
                        content:FirstProductLinkeExpantionPanel(controller: controller,),
                        isActive: controller.currentStep.value >= 0,
                        state: controller.currentStep.value >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(

                        title: new Text('Attribute'),
                        content:FirstProductAttributeContainer(controller: controller,),
                        isActive: controller.currentStep.value >= 0,
                        state: controller.currentStep.value >= 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text("Options"),
                        content: Column(
                          children: <Widget>[
                           OptionsProductContainer(controller: controller)
                          ],
                        ),
                        isActive: controller.currentStep.value >= 0,
                        state: controller.currentStep.value >= 3
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('step5'),
                        content: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(labelText: 'step5'),
                            ),
                          ],
                        ),
                        isActive: controller.currentStep.value >= 0,
                        state: controller.currentStep.value >= 4
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('step6'),
                        content: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(labelText: 'step6'),
                            ),
                          ],
                        ),
                        isActive: controller.currentStep.value >= 0,
                        state: controller.currentStep.value >= 5
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('step7'),
                        content: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(labelText: 'step7'),
                            ),
                          ],
                        ),
                        isActive: controller.currentStep.value >= 0,
                        state: controller.currentStep.value >= 6
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('step8'),
                        content: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(labelText: 'step8'),
                            ),
                          ],
                        ),
                        isActive: controller.currentStep.value >= 0,
                        state: controller.currentStep.value >= 7
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

/* switchStepsType() {
    setState(() =>
    stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }
*/

}

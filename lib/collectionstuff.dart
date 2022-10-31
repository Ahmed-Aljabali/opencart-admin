
// 1 - the old stuffer
// SizedBox(
//   child: Stepper(
//     type: stepperType,
//     physics:const ClampingScrollPhysics(),
//     currentStep: controller.currentStep.value,
//     onStepTapped: (step) => controller.tapped(step),
//     onStepContinue:
//         controller.isVaild.value ? controller.continued : null,
//     onStepCancel: controller.cancel,
//
//     steps: <Step>[
//       Step(
//         title: const Text('Generl'),
//         content: Column(
//           children: [
//             FirstProductContainer(
//               controller: controller,
//             ),
//             SecondProductContainer(
//               controller: controller,
//             ),
//             ThirdProductContainer(controller: controller),
//             ForthProductContainer(controller: controller),
//             FifhProductScreen(controller: controller),
//           ],
//         ),
//         isActive: controller.currentStep.value >= 0,
//
//         // state: controller.currentStep.value >= 0
//         //     ? StepState.complete
//         //     : StepState.disabled,
//       ),
//       Step(
//         title:  const Text('Linke'),
//         content:FirstProductLinkeExpantionPanel(controller: controller,),
//         isActive: controller.currentStep.value >= 0,
//         // state: controller.currentStep.value >= 1
//         //     ? StepState.complete
//         //     : StepState.disabled,
//        ),
//       Step(
//
//         title:  const Text('Attribute'),
//         content:FirstProductAttributeContainer(controller: controller,),
//         isActive: controller.currentStep.value >= 0,
//         // state: controller.currentStep.value >= 2
//         //     ? StepState.complete
//         //     : StepState.disabled,
//       ), //attripute
//       Step(
//         title:  const Text("Options"),
//         content: Column(
//           children: <Widget>[
//             /*if(controller.selectedOption.value=='Date')
//               CheckBoxContainer(controller: controller),*/
//             OptionsProductContainer(controller: controller)
//           ],
//         ),
//         isActive: controller.currentStep.value >= 0,
//         // state: controller.currentStep.value >= 3
//         //     ? StepState.complete
//         //     : StepState.disabled,
//       ), // options
//       Step(
//         title:  const Text('الاشتراك'),
//         content: FirstProductSubscribeContainer(controller: controller,),
//         isActive: controller.currentStep.value >= 0,
//         // state: controller.currentStep.value >= 4
//         //     ? StepState.complete
//         //     : StepState.disabled,
//       ),// subscribe
//       Step(
//         title: const Text('تخفيض'),
//         content: DiscountContainer(controller: controller,),
//         isActive: controller.currentStep.value >= 0,
//         state: controller.currentStep.value >= 5
//             ? StepState.complete
//             : StepState.disabled,
//       ),
//       Step(
//         title:  const Text('SEO'),
//         content: Seo(),
//         isActive: controller.currentStep.value >= 0,
//         // state: controller.currentStep.value >= 6
//         //     ? StepState.complete
//         //     : StepState.disabled,
//       ),
//     ],
//   ),
// ), ؟ // thsdf


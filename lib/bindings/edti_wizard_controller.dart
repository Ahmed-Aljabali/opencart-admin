


import 'package:get/get.dart';
import 'package:opencart/controllers/wizard_controller.dart';

import '../controllers/edit_wizard_controller.dart';

class WizardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EditWizardController());
  }
}
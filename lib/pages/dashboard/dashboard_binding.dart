
import 'package:get/get.dart';

import '../../controllers/OrdersController.dart';
import '../../controllers/dashboard_controller.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/productpagecontroller.dart';
import '../../controllers/wizard_controller.dart';

class DashBoardBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut(() => OrdersController());
    Get.lazyPut<ProductPageController>(() => ProductPageController());
    Get.lazyPut(() => WizardController(), fenix: true);
  }
}


import 'package:get/get.dart';

import '../../Controllers/customer_controller.dart';
import '../../Controllers/order_controller.dart';
import '../../controllers/OrdersController.dart';
import '../../controllers/dashboard_controller.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/productpagecontroller.dart';
import '../../controllers/users_controller.dart';
import '../../controllers/wizard_controller.dart';

class DashBoardBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut(() => OrderController());
    Get.lazyPut(() => CustomerController());
    Get.lazyPut(() => UsersController());
    Get.lazyPut<ProductPageController>(() => ProductPageController());
  //  Get.lazyPut<UsersController>(() => UsersController());
    Get.lazyPut(() => WizardController(), fenix: true);
  }
}

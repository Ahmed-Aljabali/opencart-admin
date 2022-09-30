import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import '../../Controllers/customer_controller.dart';
import '../../Controllers/order_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/porducts_controller.dart';
import '../../controllers/users_controller.dart';
import '../../controllers/wizard_controller.dart';

class DashBoardBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut(() => OrderController());
    Get.put( BaseController());
    Get.lazyPut(() => CustomerController());
    Get.lazyPut(() => UsersController());
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut(() => WizardController(), fenix: true);
  }
}

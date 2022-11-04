import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/system_info_controller.dart';
import '../../Controllers/customer_controller.dart';
import '../../Controllers/order_controller.dart';
import '../../controllers/Init_add_order_controller.dart';
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
    Get.lazyPut(() => CustomerController(),fenix: true);
    Get.lazyPut(() => SystemINfoController(),fenix: true);
    Get.lazyPut(() => UsersController(),fenix: true);
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut(() => MainWizardController(), fenix: true);
    Get.lazyPut(() => InitAddOrderController(), fenix: true);
  }
}

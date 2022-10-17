
import 'package:get/get.dart';
import 'wizard_controller.dart';
class DashBoardController extends GetxController {
  var tabIndex = 0;
  void changeTabIndex(int index) {

    tabIndex = index;
    update();

  }
}

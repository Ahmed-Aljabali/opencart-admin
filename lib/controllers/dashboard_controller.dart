
import 'package:get/get.dart';

import 'order_controller.dart';

class DashBoardController extends GetxController {
  var tabIndex = 0;
  void changeTabIndex(int index) {

    tabIndex = index;
    update();
  }
}

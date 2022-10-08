
import 'package:get/get.dart';

import 'order_controller.dart';

class DashBoardController extends GetxController {
  var tabIndex = 0;
  void changeTabIndex(int index) {
//
//     if (listFilter!.isNotEmpty){
// print("11111111");
//     }
    tabIndex = index;
    update();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../navigation/custom_animated_bottom_bar.dart';
import '../pages/customer/customer.dart';
import '../pages/mainproductpage/productpage.dart';
import '../pages/orders/orders_page.dart';


class MyDashBoard extends StatefulWidget {
  const MyDashBoard({Key? key}) : super(key: key);

  @override
  _MyDashBoardState createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  final _inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
            //  UserPage(),
              ProductPage(),
             CustomerPage(),
              OrderPage(),

            ],
          ),
        ),
        bottomNavigationBar: CustomAnimatedBottomBar(
          containerHeight: 70,
          backgroundColor: Colors.white,
          selectedIndex: controller.tabIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: controller.changeTabIndex,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon:const Icon(Icons.category_outlined),
              title:const Text('المنتجات'),
              activeColor: Colors.grey,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon:const Icon(Icons.people),
              title:const Text('ادارة العملاء'),
              activeColor: Colors.grey,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon:const Icon(Icons.receipt_long),
              title:const Text(
                'الطلبات ',
              ),
              activeColor: Colors.grey,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            // BottomNavyBarItem(
            //   icon:const Icon(Icons.home),
            //   title:const Text('الرئيسية'),
            //   activeColor: Colors.grey,
            //   inactiveColor: _inactiveColor,
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      );
    });
  }
}

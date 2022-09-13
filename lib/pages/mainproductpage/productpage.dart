import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/pages/mainproductpage/widgets/gridviewcontainer.dart';

import '../../controllers/productpagecontroller.dart';
import '../../core/utils/math_utils.dart';

import '../wizard/wizard_page.dart';

class ProductPage extends GetView<ProductPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Center(
                  child: Text(
                controller.title,
                style: TextStyle(color: Colors.black),
              )),
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
          ],
        ),
        /* leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),*/
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(right: 11, left: 11, top: 11, bottom: 11),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 11, left: 11),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {
                      Get.snackbar(
                        "Icon Action",
                        "Search button was clicked",
                        icon: Icon(Icons.check, color: Colors.blue),
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  prefixIcon: InkWell(
                    onTap: () {
                      Get.snackbar(
                        "Icon Action",
                        "Settings button was clicked",
                        icon: Icon(Icons.check, color: Colors.blue),
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    child: Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'ابحث من هنا ',
                  hintStyle: TextStyle(
                    fontSize: 19,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                      onTap: () {
                        Get.snackbar(
                          "Icon Action",
                          "List button was clicked",
                          icon: Icon(Icons.check, color: Colors.blue),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: getHorizontalSize(
                                  0.1,
                                ),
                                offset: Offset(
                                  0,
                                  4,
                                ), //shadow of the container
                              ),
                            ],
                          ),
                          margin: EdgeInsets.all(2),
                          child: Icon(Icons.grid_view))),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: InkWell(
                      onTap: () {
                        Get.snackbar(
                          "Icon Action",
                          "List button was clicked",
                          icon: Icon(Icons.check, color: Colors.blue),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                      child: const Icon(Icons.format_list_bulleted)),
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: TextButton(
                    onPressed: () {
                      Get.snackbar(
                        "TextBotton Action",
                        "Text button was clicked",
                        icon: Icon(Icons.check, color: Colors.blue),
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    child: const Text(
                      'تحديد الكل',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 4),
                child: GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 2,
                  padding: const EdgeInsets.only(top: 10, bottom: 4),

                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(20, (index) {
                    return GridtrashItemWidget();

                    //my return;
                  }),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => WizardPage());
        },
        tooltip: 'add a new product',
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

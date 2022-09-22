import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/pages/mainproductpage/widgets/gridviewcontainer.dart';

import '../../controllers/porducts_controller.dart';
import '../../core/utils/math_utils.dart';

import '../wizard/wizard_page.dart';

class ProductPage extends GetView<ProductController> {
  final  product = Get.put(ProductController());
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
              padding:const EdgeInsets.only(left: 30),
              child: Center(
                  child: Text(
                controller.msg,
                style:const  TextStyle(color: Colors.black),
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
        padding: const EdgeInsets.only(right: 11, left: 11, top: 11, bottom: 11),
        child: Column(
          children: [
            Padding(
              padding:const  EdgeInsets.only(right: 11, left: 11),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {
                      Get.snackbar(
                        "Icon Action",
                        "Search button was clicked",
                        icon:const Icon(Icons.check, color: Colors.blue),
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    child:const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  prefixIcon: InkWell(
                    onTap: () {
                      Get.snackbar(
                        "Icon Action",
                        "Settings button was clicked",
                        icon:const Icon(Icons.check, color: Colors.blue),
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    child:const Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'ابحث من هنا ',
                  hintStyle:const TextStyle(
                    fontSize: 19,
                  ),
                  contentPadding:
                  const  EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  focusedBorder:const OutlineInputBorder(
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
                                offset:const Offset(
                                  0,
                                  4,
                                ), //shadow of the container
                              ),
                            ],
                          ),
                          margin:const EdgeInsets.all(2),
                          child:const Icon(Icons.grid_view))),
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
                          icon:const Icon(Icons.check, color: Colors.blue),
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
                        icon:const Icon(Icons.check, color: Colors.blue),
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
            controller.data.isEmpty?
        const  CircularProgressIndicator():
            Expanded(
                child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 4),
                    child:  GridtrashItemWidget(product: controller.data))

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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/wizard_controller.dart';
import 'package:opencart/pages/mainproductpage/widgets/gridviewcontainer.dart';
import 'package:opencart/pages/mainproductpage/widgets/listviewbuilder.dart';
import '../../core/utils/math_utils.dart';
import '../wizard/wizard_page.dart';


class ProductPage extends GetView<MainWizardController> {

  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    controller.fetchProduct();
    return super.createElement();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.blueGrey.withOpacity(0.16),

        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Center(
                    child: Text(
                      controller.msg,
                      style: const TextStyle(color: Colors.black),
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
          padding: EdgeInsets.only(right: 11, left: 11, top: 11, bottom: 11),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 11, left: 11),
                child: TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        Get.snackbar(
                          "Icon Action",
                          "Search button was clicked",
                          icon: const Icon(Icons.check, color: Colors.blue),
                          snackPosition: SnackPosition.TOP,
                        );
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    prefixIcon: InkWell(
                      onTap: () {
                        Get.snackbar(
                          "Icon Action",
                          "Settings button was clicked",
                          icon: const Icon(Icons.check, color: Colors.blue),
                          snackPosition: SnackPosition.TOP,
                        );
                      },
                      child: const Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: 'ابحث من هنا ',
                    hintStyle: const TextStyle(
                      fontSize: 19,
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 40.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
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
                          controller.listTypeGrid.value = true;
                        },
                        child: controller.listTypeGrid.value? Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: getHorizontalSize(
                                    0.1,
                                  ),
                                  offset: const Offset(
                                    0,
                                    4,
                                  ), //shadow of the container
                                ),
                              ],
                            ),
                            margin: getMargin(all: 2),
                            child: const Icon(Icons.grid_view)):const Icon(Icons.grid_view) ),
                  ),
                  const SizedBox(

                      width: 5

                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: InkWell(
                        onTap: () {
                          controller.listTypeGrid.value = false;
                        },
                        child:controller.listTypeGrid.value?const Icon(Icons.format_list_bulleted) :Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: getHorizontalSize(
                                    0.1,
                                  ),
                                  offset: const Offset(
                                    0,
                                    4,
                                  ), //shadow of the container
                                ),
                              ],
                            ),
                            margin: getMargin(all: 2),
                            child: const Icon(Icons.format_list_bulleted))),
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
                          icon: const Icon(Icons.check, color: Colors.blue),
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
              if (controller.isDataLoading.value==false)
                const CircularProgressIndicator() else

                controller.listTypeGrid.value ? NewGridtrashItemWidget(
                    product: controller.dataProduct) : Expanded(

                  child: MyListViewContainer(),
                ),


            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => MainWizardPage());
          },
          tooltip: 'add a new product',
          child: const Icon(
            Icons.add,
          ),
        ),
      );
    });
  }
}
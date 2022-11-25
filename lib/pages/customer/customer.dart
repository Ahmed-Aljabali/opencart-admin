
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/Controllers/customer_controller.dart';
import 'package:opencart/pages/customer/widgets/customer_search_form.dart';
import 'package:opencart/pages/customer/widgets/mycustomerlistviewcontainer.dart';
import '../../controllers/Init_add_order_controller.dart';
import '../../core/utils/math_utils.dart';
import 'addcustomer/add_customer_page.dart';



class CustomerPage extends GetView<CustomerController> {
  const CustomerPage({Key? key}) : super(key: key);
  @override

  // @override
  // StatelessElement createElement() {
  //   controller.fetchCustomer("10","1");
  //
  //   return super.createElement();
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.blueGrey.withOpacity(0.16),

        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [

              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Center(
                      child: Text(
                        "اضافة عميل",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black,fontFamily: 'Cairo Regular',
                          fontWeight: FontWeight.w400,

                          height: 1.00,),
                      )),
                ),
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
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 11, left: 11),
                    child: TextField(
                       onChanged: (value)=>controller.runFilter(value),
                    //  onTap: (){     controller.searchFormVisible.value = true; },
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(
                          Icons.filter_list_alt,
                          color: Colors.grey,
                        ),
                        hintText: 'ابحث من هنا ',
                        hintStyle: TextStyle(
                          fontSize: 19,
                          fontFamily: 'Cairo Regular',
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 40.0),
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
                          
                            child:Container(
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
                                child: const Icon(Icons.grid_view)) ),
                      ),
                      const SizedBox(

                          width: 5

                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: InkWell(
                            onTap: () {
                          //    controller.orderListTypeGrid.value = false;
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

                          },
                          child: const Text(
                            'تحديد الكل',
                            style: TextStyle(color: Colors.blue,fontFamily: 'Cairo Regular',),
                          ),
                        ),
                      )
                    ],
                  ),//تحديد الكل طريقة عرض القوائم
                  // if (productController.dataProduct.isEmpty||productController.dataProduct.isEmpty)
                  //   const CircularProgressIndicator() else
                  //   controller.orderListTypeGrid.value ? NewGridtrashItemWidget(
                  //       product: productController.dataProduct)
                  //       :
                  if (controller.isDataLoading.value==false)
                    const CircularProgressIndicator()
                  else
                    Expanded(child: MyCustomerListViewContainer())

                ],
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: (!controller.searchFormVisible.value)
                    ? null
                    : Container(
                  margin: getMargin(top: MediaQuery.of(context).size.height*0.25,bottom: MediaQuery.of(context).size.height*0.1),
                  decoration: BoxDecoration(
boxShadow: [
  BoxShadow(
    color: Colors.grey, //New
    blurRadius: 2.0,
  )
] ,
                      borderRadius: BorderRadius.circular(30.0),

                      color: Colors.white
                  ),

                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    padding: getPadding(all: 19),
                    child: Column(

                      children: <Widget>[
                        Row(
                          children: [
                            Container(

                                padding: const EdgeInsets.only(left: 20, top: 10),
                                child: InkWell(
                                    onTap: () {
                                      controller.searchFormVisible.value = false;
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.grey,
                                      size: 25,
                                    ))),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: const Text(
                                      'فلتر البحث',
                                      style: TextStyle(color: Colors.grey, fontSize: 22,fontFamily: 'Cairo Regular'),
                                      textAlign: TextAlign.center,
                                    ))),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                          indent: 20,
                          endIndent: 15,
                        ),
                        const AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: CustomerSearchForm(),

                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                  child: Text(
                                    'الغاء',
                                    style: TextStyle(fontSize: 25, color: Colors.grey[800],fontFamily: 'Cairo Regular'),
                                  ),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                  minWidth: 100,
                                  height: 60,
                                  color: Colors.white60,
                                  onPressed: () {
                                    controller.searchFormVisible.value = false;
                                  }),
                              const SizedBox(
                                width: 50,
                              ),
                              MaterialButton(
                                  child: const Text(
                                    'بحث',
                                    style: const TextStyle(fontSize: 25, color: Colors.white,fontFamily: 'Cairo Regular'),
                                  ),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                  minWidth: 100,
                                  height: 60,
                                  color: Colors.green,
                                  onPressed: () {
                                 //   controller.filterOrderList();

                                  // controller.filterOrder.idOrder==1;
                                    controller.searchFormVisible.value = false;
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton:(controller.searchFormVisible.value)
            ? null
            :  SizedBox(

          height: 50.0,
          width: 50.0,
          child: FloatingActionButton(


            backgroundColor: Colors.green,
            onPressed: () {

              Get.to(AddCustomerPage());
            },
            tooltip: 'add a new customer',
            highlightElevation: 1,

            child:   Container(

              decoration: BoxDecoration(

                color: Colors.transparent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: Colors.black.withOpacity(0.7),
                    spreadRadius: 7,
                    blurRadius: 27,

                  ),
                ],
              ),
              child: const Icon(
                Icons.add,size: 35,
              ),
            ),


          ),
        ),
      );
    });
  }
}
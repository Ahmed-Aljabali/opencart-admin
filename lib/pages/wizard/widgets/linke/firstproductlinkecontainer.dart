import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/porducts_controller.dart';
import 'package:opencart/model/porducts/stores.dart';
import '../../../../controllers/wizard_controller.dart';
import '../../../../core/constrants/widgetconstrant.dart';
import '../../../../model/ProductData.dart';
import '../../../../model/porducts/category.dart';
import '../../../../model/porducts/manufacturers.dart';
import '../../../../model/porducts/product.dart';





class FirstProductLinkeExpantionPanel extends GetView<WizardController> {


  @override
  Widget build(BuildContext context) {
    var prodController =Get.put(ProductController());

    return Obx(() => ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          controller.linkeproduct1[panelIndex].isExpanded!.value = !isExpanded;
        },
        children: controller.linkeproduct1.map<ExpansionPanel>((Product item) {
          return ExpansionPanel(
              backgroundColor: Colors.grey[200],
              canTapOnHeader: true,
              headerBuilder: ((context, isExpanded) {
                return ListTile(
                    title: Text(
                      item.header!,
                      style: const TextStyle(fontSize: 20,),
                      textAlign: TextAlign.center,
                    ));
              }),
              body: Container(
                /* padding: EdgeInsets.only(
                      top: 10, bottom: 10, right: 10, left: 10),*/
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                   const SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 1,right: 1),
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white60, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                  boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child: Center(
                                child:FutureBuilder<List<Manufacturers>>(
                                  future:controller.initManufacturers(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      var data = snapshot.data!.obs.value;
                                      return DropdownButton<Manufacturers>(
                                        hint:  const Text("الشركات المصنعه"),
                                        //value:controller.selectedManufacturers.value,
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        items:data.
                                        map<DropdownMenuItem<Manufacturers>>((Manufacturers value) {
                                          return   DropdownMenuItem<Manufacturers>(
                                            enabled: true,
                                            value: value,
                                            child: Text(value.name!),
                                          );
                                        }).toList(),
                                        onChanged:(v) {
                                                controller.manufacturersId.value = v?.manufacturerId;

                                                },

                                    );
                                    }
                                    else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                )
                              )
                          )

                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),
                    const SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 1,right: 1),
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white60, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                  boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child:Center(
                                child:FutureBuilder<List<Categories>>(
                                  future:controller.initCategory(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      var data = snapshot.data!.obs.value;
                                      return DropdownButton<Categories>(
                                        hint:  const Text("الفئات"),
                                       value:controller.selectedCategories.value,
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        items:data.
                                        map<DropdownMenuItem<Categories>>((Categories value) {
                                          return   DropdownMenuItem<Categories>(
                                            enabled: true,
                                            value: value,
                                            child: Text(value.name!),
                                          );
                                        }).toList(),

                                        onChanged:(v) {

                                          controller.categorieId.value=v?.categoryId;

                                        },
                                      );
                                    }
                                    else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              )
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    SizedBox(height:47,child: MyTextFieldWidget(hintText: 'الفلتر', onChanged: (value){print(value);},)),// الفلتر
                    const SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 1,right: 1),
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white60, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                  boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child:Center(
                                child:FutureBuilder<List<Stores>>(
                                  future:controller.initStores(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      var data = snapshot.data!.obs.value;
                                      return DropdownButton<Stores>(
                                        hint:  const Text("المتاجر"),
                                        value:controller.selectedStores.value,
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        items:data.
                                        map<DropdownMenuItem<Stores>>((Stores value) {
                                          return   DropdownMenuItem<Stores>(
                                            enabled: true,
                                            value: value,
                                            child: Text(value.name!),
                                          );
                                        }).toList(),

                                        onChanged:(v) {
                                          controller.storesId.value=v?.storeId;
                                        },
                                      );
                                    }
                                    else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              )
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),
                    SizedBox(height:47,child: MyTextFieldWidget(hintText: 'التحميلات', onChanged: (value){print(value);},)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 1,right: 1),
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white60, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                  boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child:Center(
                                child: DropdownButton<Products>(
                                  hint:  const Text("منتجات ذات صلة"),
                               //   value:controller.selectProd.value,

                                  onChanged:(v) {
                                    controller.selectedrelatedProdOptions.value = v!.id.toString();
                                    },
                                  items:prodController.dataProduct.
                                  map<DropdownMenuItem<Products>>((Products value) {
                                    return   DropdownMenuItem<Products>(
                                      enabled: true,
                                      value: value,
                                      child: Text(value.model),
                                    );
                                  }).toList(),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),

                  /*  Container(
                      constraints: BoxConstraints(maxWidth: 250),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Text('Choose One Item With Done Button',style:  TextStyle(fontSize: 14,color: Colors.black)),


                        ],
                      ),
                    ),*/// addition

                  ],
                ),
              ),
              isExpanded: item.isExpanded!.value);
        }).toList()));
  }
}
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/model/porducts/stores.dart';
import '../../../../controllers/edit_wizard_controller.dart';
import '../../../../core/constrants/widgetconstrant.dart';
import '../../../../model/ProductData.dart';
import '../../../../model/porducts/category.dart';
import '../../../../model/porducts/manufacturers.dart';
import '../../../../model/porducts/product.dart';





class FirstProductLinkeExpantionPanel extends GetView<EditWizardController> {

  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    controller.initManufacturers();
    controller.initCategory();
    controller.initStores();

    return super.createElement();
  }
  @override
  Widget build(BuildContext context) {

    return Obx(() => ExpansionPanelList(

        expansionCallback: (panelIndex, isExpanded) {
          controller.linkeproduct1[panelIndex].isExpanded!.value = !isExpanded;
        },
        children: controller.linkeproduct1.map<ExpansionPanel>((Product item) {
          return ExpansionPanel(
              backgroundColor: Colors.white,
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
                              child: controller.isDataLoading.value==false?
                              CircularProgressIndicator():
                              Center(
                                child: DropdownButton<Manufacturers?>(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  underline: Container(color: Colors.transparent),
                                  hint:  const Text("الشركات "),
                                  value:controller.selectedManufacturers.value,
                                  onChanged: (v) {
                                    controller.selectedManufacturers.value=v;
                                //   controller.manufacturersId.value = v?.manufacturerId;
                                   controller.prod.manufacturerId=v!.manufacturerId;
                                  },
                                  items: controller.manuf
                                      .map<DropdownMenuItem<Manufacturers?>>(
                                          (Manufacturers? value) {
                                        return DropdownMenuItem<Manufacturers?>(
                                          value: value,
                                          child: Text(value!.name.toString()),
                                        );
                                      }).toList(),
                                ),
                              ),
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
                          child: Center(
                            child: controller.isDataLoading.value==false?
                            CircularProgressIndicator():
                            Center(
                              child: DropdownButton<Categories>(
                                alignment: AlignmentDirectional.bottomCenter,
                                underline: Container(color: Colors.transparent),
                                hint:  const Text("الفئات"),
                                value:controller.selectedCategories.value,
                                onChanged: (v) {
                                  controller.selectedCategories.value=v;
                                  controller.categorieId.value = v?.categoryId;
                                },
                                items: controller.dataCategory
                                    .map<DropdownMenuItem<Categories>>(
                                        (Categories value) {
                                      return DropdownMenuItem<Categories>(
                                        value: value,
                                        child: Text(value.name.toString()),
                                      );
                                    }).toList(),
                              ),
                            ),
                          )
                      ),
                    ),

                    const SizedBox(height: 10,),

                    SizedBox(height:47,child:
                    MyTextFieldWidget(
                      keyboardType: TextInputType.number,
                      hintText: 'الفلتر',
                      onChanged: (value){
                      controller.selectedFilterProd.value=value;
                      },)),// الفلتر
                    const SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
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
                          child: Center(
                            child: controller.isDataLoading.value==false?
                            CircularProgressIndicator():
                            Center(
                              child: DropdownButton<Stores>(
                                alignment: AlignmentDirectional.bottomCenter,
                                underline: Container(color: Colors.transparent),
                                hint:  const Text("المتاجر"),
                                value:controller.selectedStores.value,
                                onChanged: (v) {
                                  controller.selectedStores.value=v;
                                  controller.storesId.value = v?.storeId;
                                },
                                items: controller.dataStores
                                    .map<DropdownMenuItem<Stores>>(
                                        (Stores value) {
                                      return DropdownMenuItem<Stores>(
                                        value: value,
                                        child: Text(value.name.toString()),
                                      );
                                    }).toList(),
                              ),
                            ),
                          )
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
                             value:controller.selectProd.value,
                              onChanged:(v) {
                                controller.selectProd.value=v;
                                controller.selectedrelatedProdOptions.value = v!.id;
                                },
                              items:controller.dataProduct.
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
                  ],
                ),
              ),
              isExpanded:item.isExpanded!.value);
        }).toList()));
  }
}
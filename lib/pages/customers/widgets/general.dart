
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/porducts_controller.dart';
import 'package:opencart/controllers/wizard_controller.dart';


import '../../../Controllers/customer_controller.dart';
import '../../../model/ProductData.dart';
import '../../../model/porducts/category.dart';
import '../../../model/porducts/manufacturers.dart';


class GeneralFirstCustomerExpantionPanel extends StatelessWidget {
  const GeneralFirstCustomerExpantionPanel({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CustomerController controller ;
  @override
  Widget build(BuildContext context) {


    return Obx(() => ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          controller.customer[panelIndex].isExpanded!.value = !isExpanded;
        },
        children:  controller.customer.map<ExpansionPanel>((Product item) {
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

                                    color:Colors.white, //background color of dropdown button
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
                                      future:ProductController().initManufacturers(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          var data = snapshot.data!.obs;
                                          return DropdownButton<Manufacturers>(
                                            hint:  const Text("حدد  العميل"),
                                            // value:controller.selectedManufacturers.value,
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
                                              WizardController().manufacturersId.value = v?.manufacturerId;

                                            },

                                          );
                                        }
                                        else {
                                          return const CircularProgressIndicator();
                                        }
                                      },
                                    )
                                ))

                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 1,right: 1),
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color:Colors.white, //background color of dropdown button
                                  border: Border.all(color: Colors.black38, width:0.5), //border of dropdown button
                                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                  boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                     BoxShadow(
                                        color:  const Color.fromRGBO(0, 0, 0, 0.1), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
                                  ]
                              ),
                              child:Center(
                                child:FutureBuilder<List<Categories>>(
                                  future:ProductController().initCategory(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      var data = snapshot.data!.obs;
                                      return DropdownButton<Categories>(
                                        hint:  const Text("مجموعة العميل"),
                                        value:WizardController().selectedCategories.value,
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

                                          WizardController().categorieId.value=v?.categoryId;

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




                  ],
                ),
              ),
              isExpanded: item.isExpanded!.value);
        }).toList()));
  }
}
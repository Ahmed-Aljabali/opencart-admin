import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/porducts_controller.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductState();
  }

}

class ProductState extends State<Product>{
  final  product = Get.put(ProductController());

  @override
  void initState(){
  product.fetchProduct();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text("product"),
        ),
        body:Obx(() => !product.isDataLoading.value? const Center(
          child: CircularProgressIndicator(),
        ): Center(
            child:Row(children: [

              FlatButton(
                  child:const Text("Add New"),
                  onPressed: (){
                    Get.toNamed('/AddProduct');
                  }),

                    FlatButton(
                  child:const Text(" delete"),
                  onPressed: (){
                    product.deleteProduct(67);
                  }),
              FlatButton(
                  child:const Text(" delete"),
                  onPressed: (){
                     Get.toNamed('/UpdateProduct');
                  }),

              FlatButton(
                  child:const Text(" getProduct"),
                  onPressed: (){
                    product.fetchProductById(69);
                  }),


            ],)

        )
        ));

  }


}
Widget cancelBtn() {
  return ElevatedButton(onPressed: () {
    Get.back();
  }, child: Text("Cancel"));
}
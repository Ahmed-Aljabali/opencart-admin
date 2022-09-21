import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/porducts_controller.dart';
import '../../model/porducts/product.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UpdateProductState();
  }

}

class UpdateProductState extends State<UpdateProduct>{
  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final  productController = Get.put(ProductController());
    return Scaffold(
        appBar: AppBar(
          title:const Text("product"),
        ),
        body:Obx(() => !productController.isDataLoading.value? const Center(
          child: CircularProgressIndicator(),
        ): Center(
            child:Row(children: [

              FlatButton(
                  child:const Text("update product"),
                  onPressed: (){
                    List<ProductDescription>? sa= [];
                    var productDescription = ProductDescription(description: "asda",languageId: 1,metaDescription: "asd",name: "asd",metaTitle: "asd",metaKeyword: "asd",tag: "5");
                    sa.add(productDescription);
                    var product =Products(image: "aaa",productDescription: sa,model: "شسيشي",quantity: 100,price: 500,taxClassId: 1,manufacturerId: 2,sku: "aa",status: 1,points: 0,reward: 0);
                    productController.updateProductById(product,30);
                  }),

              productController.error!.isEmpty==true?Text("تم الحفظ بنجاح "):
              Text(productController.error.toString())

            ],)

        )
        ));

  }


}
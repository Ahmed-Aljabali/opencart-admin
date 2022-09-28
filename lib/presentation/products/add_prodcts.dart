import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/Controllers/customer_controller.dart';
import 'package:opencart/controllers/porducts_controller.dart';
import '../../model/porducts/product.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddProductState();
  }

}

class AddProductState extends State<AddProduct>{

  //final ImagePicker _picker = ImagePicker();
  final  productController = Get.put(ProductController());

late   File image;

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title:const Text("add Product"),
        ),
        body:Obx(() => !productController.isDataLoading.value? const Center(
          child: CircularProgressIndicator(),
        ): Center(
            child:Row(children: [
           //   if (File(image!.path) != null)
                Expanded(
                  child: Column(
                    children: [
                      Expanded(child:Text( "image")),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                   //         image = null;
                          });
                        },
                        label: const Text('Remove Image'),
                        icon: const Icon(Icons.close),
                      )
                    ],
                  ),
                )
             ,
                const SizedBox(),
              FlatButton(
                  child:const Text("choose image"),
                  onPressed: () async{
                   // final img = await _picker.pickImage(source: ImageSource.camera);
                   //  setState(() {
                   //   image =File(img!.path);
                   //  });
                  }),

              FlatButton(
                  child:const Text("Add New product"),
                  onPressed: (){
                    List<ProductDescription>? sa= [];
                    var productDescription = ProductDescription(description: "asda",languageId: 1,metaDescription: "asd",name: "asd",metaTitle: "asd",metaKeyword: "asd",tag: "5");
                    sa.add(productDescription);
                    var product =Products(image: "aaa",productDescription: sa,model: "sssss",quantity: 100,price: 500,taxClassId: 1,manufacturerId: 2,sku: "aa",status: 1,points: 0,reward: 0);
                    if (image==null)
                    {
                      print("sa");
                 //     productController.addProductWithImage(product,image);
                    }else{
                      print("11");

                      productController.addProduct(product);

                    }

                  }),



            ],)

        )
        ));

  }


}

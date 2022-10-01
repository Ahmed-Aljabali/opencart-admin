import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:opencart/Interface/Iproduct.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/model/porducts/category.dart';
import 'package:opencart/model/porducts/stores.dart';
import '../model/porducts/attribute.dart';
import '../model/porducts/manufacturers.dart';
import '../model/porducts/product.dart';

class ProductController extends BaseController implements IProduct {
  dynamic _data;
  dynamic _dataOption;
  dynamic _dataManufacturers;
  dynamic _dataCategory;
  dynamic _dataStores;
  dynamic _dataAttribute;
  RxBool listTypeGrid = true.obs ;

  List<Products> get dataProduct => _data;
  List<ProductOption> get dataOption => _dataOption;
  List<Manufacturers> get dataManufacturers => _dataManufacturers;
  List<Categories> get dataCategory => _dataCategory;
  List<Stores> get dataStores => _dataStores;
  List<Attribute> get dataAttribute => _dataAttribute;


  @override
 fetchProduct()async{
   var res = await get("products");
   if (res.statusCode == 200) {
     _data=ProductData.fromJson(jsonDecode(res.body)).data;
   }

   }


  Future<List<ProductOption>> initProductOptions()async {
    var res = await get("product_options/limit/10/page/1");
    if (res.statusCode == 200) {
      _dataOption=  ProductOptionData.fromJson(jsonDecode(res.body)).data;
    }
    return dataOption;
  }

 Future<List<Attribute>> initAttribute()async {
    var res = await get("attributes/limit/10/page/1");

    if (res.statusCode == 200) {
      _dataAttribute=  AttributeData.fromJson(jsonDecode(res.body)).data;
    }
    return dataAttribute;
  }

  Future<List<Manufacturers>> initManufacturers()async {

    var res = await get("manufacturers/limit/10/page/1");
    if (res.statusCode == 200) {
      _dataManufacturers=  ManufacturersData.fromJson(jsonDecode(res.body)).data;
    }
    return dataManufacturers;
  }

 Future<List<Stores>> initStores()async {

    var res = await get("stores");
    if (res.statusCode == 200) {
      _dataStores=  StoresData.fromJson(jsonDecode(res.body)).data;
    }
    return dataStores;
  }

  Future<List<Categories>> initCategory()async {

    var res = await get("categories/extended/limit/10/page/1");
    if (res.statusCode == 200) {
      _dataCategory=  CategoryData.fromJson(jsonDecode(res.body)).data;
    }
    return dataCategory;
  }

  @override
  Future<String?> addProduct(Products product)async{
    var res= await post(product,"products");

    if (res.statusCode==400) {
      msg="successfully saved";
      update();
    }
    return msg;
  }

  @override
   deleteProduct(int id)async{
    var res = await delete("products", id);
    if (res.statusCode == 200) {
      msg = "تم الحذف بنجاح";
      update();
    }
    return msg;
  }


  @override
  Future<String?> fetchProductById(int id)async{
    var res = await getById("products", id.toString());
    if (res.statusCode == 200) {
      msg = "jsonDecode(res.body)";
    }

    return msg;
  }

  @override
  Future<String?> updateProductById(Products products, int id)async {
    var res= await put(products,"products",id);
    if (res==200) {
      msg="successfully updated";
    }
    return msg;
  }

  @override
  Future<String?> addProductWithImage(Products product,File file) async{
    var res= await post(product,"products");
    if (res.statusCode==200) {
     var resImage = await postImage(jsonDecode(res.body)["data"]["id"],file);
       if (resImage==200)
       {
         msg="successfully saved";
       }
    }
    return msg;
  }
}
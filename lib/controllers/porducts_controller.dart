import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/Interface/Iproduct.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/model/porducts/category.dart';
import 'package:opencart/model/porducts/stores.dart';
import '../model/porducts/attribute.dart';
import '../model/porducts/manufacturers.dart';
import '../model/porducts/option/option.dart';
import '../model/porducts/product.dart';

class  ProductController extends BaseController implements IProduct {
  dynamic _data;
  dynamic _dataOption;
  dynamic _dataManufacturers;
  dynamic _dataAttribute;
  RxBool listTypeGrid = true.obs ;

  List<Products> get dataProduct => _data;
  List<ProductOption> get dataOption => _dataOption;
  List<Manufacturers> get dataManufacturers => _dataManufacturers;

  List<Attribute> get dataAttribute => _dataAttribute;
 var manuf =RxList<Manufacturers>();
 var dataStores =RxList<Stores>();
 var dataCategory =RxList<Categories>();


  @override
 fetchProduct()async{
   var res = await get("products");
   if (res.statusCode == 200) {
     _data=ProductData.fromJson(jsonDecode(res.body)).data;
   }

   }


  Future<List<ProductOption>> initProductOptions() async {
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

   initManufacturers()async {
    var res = await get("manufacturers/limit/10/page/1");
    if (res.statusCode == 200) {
      manuf.value= ManufacturersData.fromJson(jsonDecode(res.body)).data!;
    }
    isDataLoading(true);
    update();
    return dataManufacturers;
  }

  initStores()async {
    var res = await get("stores");
    if (res.statusCode == 200) {
      dataStores.value=StoresData.fromJson(jsonDecode(res.body)).data!;
    }

    isDataLoading(true);
    update();
    return dataStores;
  }

   initCategory()async {
    var res = await get("categories/extended/limit/10/page/1");
    if (res.statusCode == 200) {
      dataCategory.value=  CategoryData.fromJson(jsonDecode(res.body)).data!;
    }

    isDataLoading(true);
    update();
  }
  initFilter()async {
    var res = await get("product_filters/filters/limit/10/page/1");
    if (res.statusCode == 200) {
      dataCategory.value=  CategoryData.fromJson(jsonDecode(res.body)).data!;
    }

    isDataLoading(true);
    update();
  }

  @override
  Future<String?> addProduct(Products product)async{
    var res= await post(product,"products");
    var decodedResponse = jsonDecode(utf8.decode(res.bodyBytes)) as Map;

    if (res.statusCode==200 && decodedResponse["success"]==1) {
      msg="تم الحفظ بنجاح";
      isDataLoading(true);
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
import 'dart:io';


import '../model/porducts/product.dart';

abstract class IProduct{
  fetchProduct();
  Future<String?> addProduct(Products product);
  Future<String?> addProductWithImage(Products products,File file);
   deleteProduct(int id);
  Future<String?> fetchProductById(int id);
  Future<String?> updateProductById(Products products,int id);

}
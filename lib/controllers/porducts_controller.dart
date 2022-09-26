import 'dart:convert';
import 'dart:io';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:opencart/Interface/Iproduct.dart';
import 'package:opencart/controllers/BaseController.dart';
import '../model/porducts/product.dart';

class ProductController extends BaseController implements IProduct {
  RxBool listTypeGrid = true.obs ;
  dynamic _data;
  List<Products> get  data => _data;
  @override
  void onInit(){
    error=List.empty();
  //  data.clear();
    fetchProduct();
    super.onInit();
  }
  @override
  void dispose() {
  data.clear();
    super.dispose();
  }

  @override
 fetchProduct()async{
   var res = await get("products");
   if (res.statusCode == 200) {
    _data=Product.fromJson(jsonDecode(res.body)).data;

   }
   }


  @override
  Future<String?> addProduct(Products product)async{
    var res= await post(product,"products");
    if (res.statusCode==200) {
      msg="successfully saved";
    }
    return msg;
  }

  @override
  Future<String?> deleteProduct(int id)async{
    print("object");
    var res = await delete("products", id.toString());
    if (res.statusCode == 200) {
      msg = "تم الحذف بنجاح";
      update();
    }
    print(msg);
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
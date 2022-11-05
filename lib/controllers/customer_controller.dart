import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';

import 'package:http/http.dart' as http;
import '../InterFace/ICustomer.dart';
import '../model/ProductData.dart';
import '../model/cutomers/add_customer.dart';

import '../model/cutomers/customer.dart';
import '../model/cutomers/group_customer.dart';


class CustomerController extends BaseController implements ICustomers{
  RxInt _currentStep = 0.obs;
  late List<Product> customer;
  late List<Product> custInfo;
  RxInt get currentStep => _currentStep;

  dynamic _trx;
  List<Customers> get dataCustomer => _trx;

  set currentStep(RxInt value) => _currentStep = value;
  RxBool _isVaild = true.obs;

  RxBool get isVaild => _isVaild;

  RxBool _isActive = false.obs;

  RxBool get isActive => _isActive;

  RxBool _isNewsletterActive = false.obs;

  RxBool get isNewsletterActive => _isNewsletterActive;
  RxBool _isSafeActive= false.obs;

  RxBool get isSafeActive => _isSafeActive;

  var selectCustomerGroup = Rxn<GroupCustomer>();
 // var postCustomer = Rxn<PostCustomer>();
  var customerGroupId = Rxn<int>();
  var postCustomer=PostCustomer();
  var lastName = TextEditingController();
  var firstName = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  tapped(int step) {
    _currentStep.value = step;
  }

  cancel() {
    _currentStep > 0 ? _currentStep -= 1 : null;
  }

  @override
  void onInit() {

    super.onInit();
    customer = generateItems(1, 'العميل');
    custInfo = generateItems(1, 'معلومات العميل');


  }

  @override
  fetchCustomer(String limit,String page)async{
    var res = await get("customers/limit/$limit/page/$page");
    if (res.statusCode == 200)
    {
      _trx=CustomerData.fromJson(jsonDecode(res.body)).data;
    }
  }


 @override
  Future<String?> deleteCustomer(int id)async{
   var res = await delete("customers", id);
   if (res.statusCode == 200) {
     msg = "تم الحذف بنجاح";
   }
   return msg;

  }


  @override
  Future<http.Response> addNewCustomer(PostCustomer customer) async{
    var res= await post(customer,"customers");
    if (res.statusCode==200) {
      msg="تم الاضافة بنجاح";

      update();
    }

    return res;

  }




}
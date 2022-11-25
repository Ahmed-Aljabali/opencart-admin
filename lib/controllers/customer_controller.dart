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
  var page=1;
  RxInt get currentStep => _currentStep;
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;
  var lstCustomer = List<Customers>.empty(growable: true).obs;

  dynamic _trx;
  //List<Customers> get dataCustomer => _trx;

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
  var customerGroupId = Rxn<int>();
  var postCustomer=PostCustomer();
  var lastName = TextEditingController();
  var firstName = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var foundCustomers=Rx<List<Customers>>([]);

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
    fetchCustomer(page.toString());
    paginateTask();
  }

  @override
  void onClose() {}
  void runFilter(String nameKeyWord){
    List<Customers> cusotmerfilter=[];
    if (nameKeyWord.isEmpty){
      cusotmerfilter=lstCustomer;
    }else{
      cusotmerfilter=lstCustomer.where((element) => element.name!.toLowerCase().contains(nameKeyWord)).toList();
    }
    foundCustomers.value=cusotmerfilter;
    update();
  }


  @override
  Future<List<Customers>> fetchCustomer(String page)async{
    isMoreDataAvailable(false);
    var res = await get("customers/limit/10/page/$page");
      if (res.statusCode == 200)
      {
        lstCustomer.addAll(CustomerData.fromJson(jsonDecode(res.body)).data);
        return CustomerData.fromJson(jsonDecode(res.body)).data;

      }
      return Future.error("ex");

  }


 @override
  Future<http.Response> deleteCustomer(int id)async{
   var res = await delete("customers", id);
   if (res.statusCode == 200) {
     msg = "تم الحذف بنجاح";
   //  dataCustomer.clear();
     fetchCustomer("1");
     isDataLoading(true);
     update();
   }
   return res;

  }


  @override
  Future<http.Response> addNewCustomer(PostCustomer customer) async{
    var res= await post(customer,"customers");
    print(res.body);
    if (res.statusCode==200) {
      error.clear();
      msg="تم الاضافة بنجاح";
      update();
    }
    return res;
  }
  void paginateTask() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page++;
        getMoreTask(page.toString());
      }
    });
  }
  void getMoreTask(var page) {
    try {
      fetchCustomer(page).then((resp) {
        if (resp.length > 0) {
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          showSnackBar("رسالة", "لايوجد بيانات متوفره", Colors.lightBlueAccent);
        }
        lstCustomer.addAll(resp);
      }, onError: (err) {
        isMoreDataAvailable(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isMoreDataAvailable(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }


  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }
}
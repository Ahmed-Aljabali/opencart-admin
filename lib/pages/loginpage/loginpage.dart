import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/order_controller.dart';
import 'package:opencart/controllers/users_controller.dart';
import 'package:opencart/core/utils/math_utils.dart';
import '../../controllers/check_interNet_controller.dart';
import '../../model/user.dart';
import '../../../controllers/users_controller.dart';
import '../widgets/dialogs.dart';

class AuthThreePage extends GetView<UsersController> {


  @override
  Widget build(BuildContext context) {
    final ConnectionManagerController connectionManager = Get.find<ConnectionManagerController>();

    return Obx(() {
      return Scaffold(
          body: Container(
            color: const Color(0xff69B457),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Center(
                    child: RaisedButton(
                      color: Colors.white,
                      textColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding:
                      const EdgeInsets.only(
                          left: 40, top: 10, right: 40, bottom: 10),
                      child: const Text(
                        "تسجيل ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontFamily: 'Cairo Regular'),
                      ),
                      onPressed: () {
                        if (connectionManager.connectionType.value==0){
                          errorInternetDialog();
                        }else{
                          controller.formVisible.value = true;
                          controller.formsIndex.value = 1;


                        }


                      },
                    ),
                  ),
                ),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: (!controller.formVisible.value)
                      ? null
                      : Container(
                    color: Colors.black54,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                             SizedBox(width: MediaQuery.of(context).size.width*0.1),
                            MaterialButton(padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 5, bottom: 5),

                                child: Text(
                                  'تسجيل دخول',
                                  style: TextStyle(fontSize: 25, fontFamily: 'Cairo Family',color: controller.formsIndex.value == 1
                                      ? Colors.black
                                      : Colors.black ,),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                minWidth: 100,
                                height: 40,
                                color: Colors.white,
                                onPressed: () {
                                  controller.formsIndex.value = 1;
                                }),

                            IconButton(
                              iconSize: 40,
                              color: Colors.white,
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                controller.formVisible.value = false;
                              },
                            )
                          ],
                        ),
                        Container(
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child: LoginForm()

                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
    });
  }
}

class LoginForm extends StatelessWidget {
  UsersController login = Get.find();
  var userName = TextEditingController();
  var password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ConnectionManagerController connectionManager = Get.find<ConnectionManagerController>();
    userName.text="admin";
    password.text="admin";
    return Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
//          GetBuilder<ConnectionManagerController>(builder: (builder)=>Text((controller.connectionType == 0 )? 'No Internet' : (controller.connectionType == 1) ? 'You are Connected to Wifi' : 'You are Connected to Mobile Internet',style: TextStyle(fontSize: 30),)),

    TextFormField(
                style: TextStyle(fontSize: 20,fontFamily: 'Cairo Regular'),
                controller: userName,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "ادحل اسم المستخدم",
                  hintStyle: TextStyle(fontFamily: 'Cairo Regular'),
                  border: OutlineInputBorder(),


                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'يرجى ادحال اسم المستخدم ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                style: TextStyle(fontSize: 24),
                controller: password,
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "ادحل كلمة السر",
                  border: OutlineInputBorder(),

                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'يرجى ادحال كلمة المرور';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              MaterialButton(

                  color: Colors.lightGreen,


                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 5, bottom: 5),

                  child: Text(
                    'تسجيل دخول',
                    style: TextStyle(fontSize: 25, fontFamily: 'Cairo Family',color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  minWidth: 100,
                  height: 40,

                  onPressed: () {

                    if (_formKey.currentState!.validate()) {
                      if (connectionManager.connectionType.value==0){
                        errorInternetDialog();
                      }else{
                        login.login(
                            User(password: password.text, username: userName.text));


                      }

                    }
                  }),

            ],
          ),
        )
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Enter email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Confirm password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text("Signup"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}





////////////////


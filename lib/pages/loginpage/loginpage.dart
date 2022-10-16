import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/controllers/BaseController.dart';
import 'package:opencart/controllers/order_controller.dart';
import 'package:opencart/controllers/users_controller.dart';
import '../../model/user.dart';
import '../../../controllers/users_controller.dart';

class AuthThreePage extends GetView<UsersController> {


  @override
  Widget build(BuildContext context) {
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
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      padding:
                      const EdgeInsets.only(
                          left: 40, top: 10, right: 40, bottom: 10),
                      child: const Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontFamily: 'Cairo Regular'),
                      ),
                      onPressed: () {
                        controller.formVisible.value = true;
                        controller.formsIndex.value = 1;
                        /*setState(() {
                   formVisible.value = true;
                   _formsIndex = 1;
                  });*/
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
                            const SizedBox(width: 70.0),
                            RaisedButton(
                              textColor: controller.formsIndex.value == 1
                                  ? Colors.white
                                  : Colors.black,
                              color: controller.formsIndex.value == 1
                                  ? Colors.white
                                  : Colors.white,
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 5, bottom: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                controller.formsIndex.value = 1;
                              },
                              child: const Text(
                                "تسجيل دخول",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                    fontFamily: 'Cairo Regular'),
                              ),
                            ),

                          /*   RaisedButton(
                              textColor:  controller.formsIndex.value == 2
                                  ? Colors.white
                                  : Colors.black,
                              color:
                              controller.formsIndex.value == 2 ? Colors.red : Colors.white,
                              child: Text("Signup"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {

                                controller.formsIndex.value =2 ;

                              },
                            ),//SignUp //SignUp*/// sign up

                            IconButton(
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
                            child:

                                LoginForm()

                          ),
                        )
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
    userName.text="admin";
    password.text="admin";
    return Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              TextFormField(
                controller: userName,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  hintText: "ادحل اسم المستخدم",
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
                controller: password,
                textAlign: TextAlign.right,
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
              RaisedButton(
                color: Colors.lightGreen,
                textColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text("تسجيل دخول"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    login.login(
                        User(password: password.text, username: userName.text));
                  }
                },
              ),
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


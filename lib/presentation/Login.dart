import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/login_controller.dart';
import '../model/user.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);



  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var userName=  TextEditingController();
  var password=  TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LoginController login = Get.put(LoginController());
    return  Scaffold(

      appBar: AppBar(
        title:const Text("widget.title"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: userName),
            TextField(controller: password),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '2',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed:()=> {
          login.login(User(password:password.text,username: userName.text )),


      },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
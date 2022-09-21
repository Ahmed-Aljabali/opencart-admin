
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/login_controller.dart';
import '../model/user.dart';

class AuthThreePage extends StatefulWidget {
  static  String path = "lib/src/pages/login/auth3.dart";

  @override
  _AuthThreePageState  createState() =>  _AuthThreePageState();
}


class _AuthThreePageState extends State<AuthThreePage> {
  late final String backImg;
  late bool formVisible;
  int? _formsIndex;

  @override
  void initState() {
    super.initState();
    formVisible = false;
    _formsIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color:const Color(0xff69B457),
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
                const  EdgeInsets.only(left: 40, top: 10, right: 40, bottom: 10),
                child:const Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontFamily: 'FONTSrepo'),
                ),
                onPressed: () {
                  setState(() {
                   formVisible = true;
                   _formsIndex = 1;
                  });
                },
              ),
            ),
          ),
          AnimatedSwitcher(
            duration:const Duration(milliseconds: 500),
            child: (!formVisible)
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
                              textColor: _formsIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                              color: _formsIndex == 1
                                  ? Colors.white
                                  : Colors.white,
                              padding:const EdgeInsets.only(
                                  left: 15, right: 15, top: 5, bottom: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                setState(() {
                                  _formsIndex = 1;
                                });
                              },
                              child:const Text(
                                "تسجيل دخول",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                    fontFamily: 'FONTSrepo'),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            /* RaisedButton(
                              textColor: _formsIndex == 2
                                  ? Colors.white
                                  : Colors.black,
                              color:
                                  _formsIndex == 2 ? Colors.red : Colors.white,
                              child: Text("Signup"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                setState(() {
                                  _formsIndex = 2;
                                });
                              },
                            ),//SignUp*/ //SignUp

                            IconButton(
                              color: Colors.white,
                              icon:const Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  formVisible = false;
                                });
                              },
                            )
                          ],
                        ),
                       Container(
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child:
                                _formsIndex == 1 ? LoginForm() : SignupForm(),
                          ),
                        )
                      ],
                    ),
                  ),
          )
        ],
      ),
    ));
  }
}
class LoginForm extends StatefulWidget{

  const LoginForm({Key? key}) : super(key: key);
  @override
  State<LoginForm> createState() => _LoginForm();

}
class _LoginForm extends State<LoginForm> {
  LoginController login = Get.put(LoginController());


  var userName=  TextEditingController();
  var password=  TextEditingController();

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
            controller: userName,
            textAlign: TextAlign.right,
            decoration:const InputDecoration(
              hintText: "ادحل اسم المستخدم",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            controller: password,
            textAlign: TextAlign.right,
            obscureText: true,
            decoration:const InputDecoration(
              hintText: "ادحل كلمة السر",
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
            child:const Text("Login"),
            onPressed: () {
              login.login(User(password:password.text,username: userName.text ));

            },
          ),
        ],
      ),
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



class SimpleCrypt {

  static  final int minASC = 32;
  static final int maxASC = 126;
  static  final int nooOFChars = maxASC - minASC + 1;

  static int moveAsc(int a, int mLvl) {
    // Move the Asc value so it stays inside interval MIN_ASC and MAX_ASC
    mLvl = mLvl % nooOFChars;
    a = a + mLvl;
    if (a < minASC) {
      a = a + nooOFChars;
    }
    else if (a > maxASC) {
      a = a - nooOFChars;
    }

    return a;
  }

  static String? encrypt(String s, String key) {
    try {
      String encrypt = "";
      int p = 0;
      int keyPos = 0;
      int c = 0;
      String e="";
      int k = 0;
      int chkSum = 0;

      if (key == "") {

        encrypt = s;

        return encrypt;
      }


      for (; p <s.length; p ++) {

        if (s.codeUnitAt(p) < minASC ||
            s.codeUnitAt(p)   > maxASC) {
          print("Char at position  $p  is invalid! Project1");
          return encrypt;
        }

      }

      for (keyPos=1; keyPos <=key.length; keyPos += 1){

        chkSum = chkSum +key.codeUnitAt(keyPos-1) * keyPos;

      }

      keyPos = 0;

      for (p=1; p <=s.length; p += 1) {
        // ISSUE: Potential Substring problem; VB6 Original: Mid(s, p, 1)
        c = (s.codeUnitAt(p-1));
        keyPos = keyPos + 1;
        if (keyPos > key.length) {
          keyPos = 1;
        }

        // ISSUE: Potential Substring problem; VB6 Original: Mid(key, keyPos, 1)
        //k = (key.substring(keyPos - 1, 1)[0]) as int;
        k = (key.codeUnitAt((keyPos-1))) ;

        c = moveAsc(c, k);
        c = moveAsc(c, k * key.length);
        c = moveAsc(c, chkSum * k);
        c = moveAsc(c, p * k);
        c = moveAsc(c, s.length * p);
        // This is only for getting new chars for different word lengths

        e = e + (String.fromCharCode(c));
      }
      encrypt = e;
print("object $encrypt");
      return encrypt;
    }catch(e){

      print(e);

    }
  }

  static String decrypt(String s, String key) {
    String decrypt = "";
    int p = 0;
    int keyPos = 0;
    int c = 0;
    String d = "";
    int k = 0;
    int chkSum = 0;
    if (key == "") {
      decrypt = s;
      return decrypt;
    }
    for (keyPos=1 ; keyPos <= key.length; keyPos += 1){

      chkSum = chkSum +key.codeUnitAt(keyPos-1) * keyPos;

    }


    keyPos = 0;

    for (p=1; p <=s.length; p += 1) {
      // ISSUE: Potential Substring problem; VB6 Original: Mid(s, p, 1)
      c=s.codeUnitAt(p-1);
      keyPos = keyPos + 1;
      if (keyPos > key.length) {
        keyPos = 1;
      }

      // ISSUE: Potential Substring problem; VB6 Original: Mid(key, keyPos, 1)
      k = key.codeUnitAt (keyPos-1) ;

      // Do MoveAsc in reverse order from encrypt, and with a minus sign this time(to unmove)
      c = moveAsc(c, -(s.length * p));
      c = moveAsc(c, -(p * k));
      c = moveAsc(c, -(chkSum * k));
      c = moveAsc(c, -(k * key.length));
      c = moveAsc(c, -k);
      d = d + (String.fromCharCode(c));
    }
    decrypt = d;
 print("dada $decrypt");
    return decrypt;

  }
}
void splitQR(String qrCode, [bool isDecrypt = false]) {
  try {
    Pattern pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    RegExp regExp =  RegExp(pattern.toString());


    if (regExp.hasMatch(qrCode) == false) {
      if (isDecrypt == false) {
        qrCode = SimpleCrypt.decrypt(qrCode, "AppexIT.biz");
        isDecrypt = true;
       // print("5210");
        splitQR(qrCode, true);
      }else{
        print("111111111${qrCode.substring(0, 3)}");
        print("111111111${qrCode.substring(8, qrCode.length)}");

      }

    } else {
      print("sadad$qrCode");
    }

  }catch(e) {
    print("00000$e");

  }
}
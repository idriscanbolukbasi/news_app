import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsapp/screens/Login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  Future<bool> register() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      if (userCredential.user.emailVerified != null) {
        userCredential.user.sendEmailVerification();
        Fluttertoast.showToast(
            msg:
                "E-mailinize gelen linke tıklayarak hesabınızı onayladıktan sonra giriş yapabilirsiniz.");
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message);
    } catch (e) {
      Fluttertoast.showToast(msg: e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/login_bg.png",
                    ),
                    fit: BoxFit.fill)),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Haber",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                      Container(
                        width: 12,
                      ),
                      Text("Uygulaması",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            controller: _emailController,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                hintText: "E-mail",
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                hintText: "Şifre",
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: TextField(
                            controller: _passwordAgainController,
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                icon: Icon(
                                  Icons.repeat,
                                  color: Colors.white,
                                ),
                                hintText: "Şifre (Tekrar)",
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 10, bottom: 20, left: 25, right: 25),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          color: Colors.white,
                          child: FlatButton(
                              onPressed: () async {
                                if (_passwordController.text != "" &&
                                    _passwordController.text ==
                                        _passwordAgainController.text) {
                                  if (await register()) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Şifre alanı boş olmamalı ve şifreler birbiriyle eşleşmeli.");
                                }
                              },
                              child: Text("Kayıt Ol",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16))),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}

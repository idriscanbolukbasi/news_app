import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsapp/screens/Home.dart';
import 'package:newsapp/screens/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      User user = (await _firebaseAuth.signInWithCredential(credential)).user;

      if (user != null) {
        Fluttertoast.showToast(msg: "Giriş işlemi başarılı.");
        return true;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.message);
    }

    return false;
  }

  Future<bool> signIn() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      if (userCredential.user != null) {
        if (userCredential.user.emailVerified) {
          Fluttertoast.showToast(msg: "Giriş İşlemi Başarılı");
          return true;
        } else {
          Fluttertoast.showToast(
              msg:
                  "Lütfen önce emailinize gelen linke tıklayarak hesabınızı onaylayın.");
          return false;
        }
      }
      return false;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message);
    } catch (e) {
      Fluttertoast.showToast(msg: e.message);
    }
    return false;
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 3,
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
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            controller: _emailController,
                            cursorColor: Colors.white,
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
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            controller: _passwordController,
                            cursorColor: Colors.white,
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
                          margin: EdgeInsets.only(
                              top: 10, bottom: 20, left: 25, right: 25),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          color: Colors.white,
                          child: FlatButton(
                              onPressed: () async {
                                if (await signIn()) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                }
                              },
                              child: Text("Giriş Yap",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16))),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 10, bottom: 20, left: 25, right: 25),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          color: Color(0xffea4335),
                          child: FlatButton(
                              onPressed: () async {
                                if (await signInWithGoogle()) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                }
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/google_icon.png",
                                    height: 40,
                                  ),
                                  Text("Google ile Giriş Yap",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ],
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          height: 100,
                          child: InkWell(
                            splashColor: Colors.black,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: Text(
                                "Hesabınız yok mu? Kayıt olmak için tıklayın.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}

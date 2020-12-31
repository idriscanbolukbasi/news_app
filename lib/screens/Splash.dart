import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/Home.dart';
import 'package:newsapp/screens/Login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Animatable<Color> bg = TweenSequence<Color>([
    TweenSequenceItem(
        tween: ColorTween(begin: Colors.white, end: Colors.blue), weight: 2),
    TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue, end: Colors.white), weight: 1),
  ]);
  Animatable<Color> iconColor = TweenSequence<Color>([
    TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue, end: Colors.white), weight: 2),
    TweenSequenceItem(
        tween: ColorTween(begin: Colors.white, end: Colors.blue), weight: 1),
  ]);
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _controller.forward().whenComplete(() => Navigator.of(context)
        .pushReplacement(MaterialPageRoute(
            builder: (context) =>
                _firebaseAuth.currentUser == null ? LoginScreen() : Home())));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
              body: Container(
            color: bg.evaluate(AlwaysStoppedAnimation(_controller.value)),
            child: Center(
              child: Image.asset(
                "assets/icon1.jpg",
                height: 100,
                color: iconColor
                    .evaluate(AlwaysStoppedAnimation(_controller.value)),
              ),
            ),
          ));
        });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

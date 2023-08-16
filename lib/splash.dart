import 'dart:async';
import 'package:flutter/material.dart';
import 'package:termomete/landing.dart';
//import 'package:termomete/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LandingPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(244, 246, 254, 1),
        body: Center(
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white.withOpacity(0.50),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Color.fromRGBO(244, 246, 254, 1),
              backgroundImage: AssetImage("img/logo.png"),
            ),
          ),
        ),
      ),
    );
  }
}

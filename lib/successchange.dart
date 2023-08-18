//import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:termomete/landing.dart';

import 'widget/Custom_button.dart';
//import 'package:termomete/login.dart';

class SuccessChangePage extends StatefulWidget {
  const SuccessChangePage({Key? key}) : super(key: key);

  @override
  State<SuccessChangePage> createState() => _SuccessChangePageState();
}

class _SuccessChangePageState extends State<SuccessChangePage> {
  @override
  Widget build(BuildContext context) {
    //double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(244, 246, 254, 1),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: h * 0.3),
              CircleAvatar(
                radius: 70,
                backgroundColor: Color.fromRGBO(141, 183, 245, 1),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("img/success.jpg"),
                ),
              ),
              SizedBox(height: h * 0.03),
              Text(
                "Your Password has been",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(11, 55, 120, 1),
                ),
              ),
              Text(
                "Change Successfully!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(11, 55, 120, 1),
                ),
              ),
              SizedBox(height: h * 0.06),
              CustomSquareButton(
                onTap: () {
                  Navigator.of(context).pushNamed('/signin');
                },
                buttonText: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

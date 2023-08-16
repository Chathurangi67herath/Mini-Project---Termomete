import 'package:flutter/material.dart';
//import 'package:termomete/splash.dart';
//import 'package:termomete/splash.dart';
//import 'package:termomete/splash.dart';

//import 'addfreezer.dart';
import 'createprofile.dart';
import 'login.dart';
import 'newpassword.dart';
import 'profile.dart';
import 'signup.dart';
import 'signout.dart';
import 'cpassword.dart';
import 'verifyemail.dart';
//import 'splash.dart';
//import 'landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/signin': (BuildContext context) => new LoginPage(),
        '/signout': (BuildContext context) => new SignoutPage(),
        '/cprofile': (BuildContext context) => new CprofilePage(),
        '/profile': (BuildContext context) => new ProfilePage(),
        '/cpassword': (BuildContext context) => new CpasswordPage(),
        '/verify': (BuildContext context) => new VerifyPage(),
        '/newpassword': (BuildContext context) => new NewpasswordPage(),
      },
      title: 'Termomete',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewpasswordPage(),
    );
  }
}

import 'package:flutter/material.dart';

import 'addfreezer.dart';
import 'createprofile.dart';
import 'editfreezerdetails.dart';
import 'home.dart';
import 'login.dart';
import 'newpassword.dart';
import 'notification.dart';
import 'profile.dart';
import 'search.dart';
import 'setting.dart';
import 'signup.dart';
import 'signout.dart';
import 'cpassword.dart';
import 'successchange.dart';
import 'verifyemail.dart';

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
        '/successchange': (BuildContext context) => new SuccessChangePage(),
        '/editfreezerdetails': (BuildContext context) => new EditFreezerPage(),
        '/addnew': (BuildContext context) => new AddFreezerPage(),
        '/home': (BuildContext context) => new HomePage(),
        '/notification': (BuildContext context) => new NotificationPage(),
        '/search': (BuildContext context) => new SearchPage(),
        '/setting': (BuildContext context) => new SettingPage(),
      },
      title: 'Termomete',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(),
    );
  }
}

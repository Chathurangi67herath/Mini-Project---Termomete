import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'about.dart';
import 'addfreezer.dart';
import 'createprofile.dart';
import 'editfreezerdetails.dart';
import 'freezerdetails.dart';
import 'help.dart';
import 'home.dart';
import 'language.dart';
import 'login.dart';
import 'newpassword.dart';
import 'notification.dart';
import 'profile.dart';
import 'search.dart';
import 'setting.dart';
import 'signup.dart';
import 'cpassword.dart';
import 'successchange.dart';
import 'verifyemail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/help': (BuildContext context) => new HelpPage(),
        '/language': (BuildContext context) => new LanguagePage(),
        '/about': (BuildContext context) => new AboutPage(),
        '/fdetails': (BuildContext context) => new FreezerDetails(),
      },
      title: 'Termomete',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return HomePage();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return LoginPage();
        },
      ),
    );
  }
}

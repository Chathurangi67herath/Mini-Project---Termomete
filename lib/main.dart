import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:termomete/screens/onboarding_screen.dart';
import 'package:termomete/services/google_sign_in.dart';
import 'package:termomete/widget/navigation.dart';

import 'screens/about.dart';
import 'screens/addfreezer.dart';
import 'screens/createprofile.dart';
import 'screens/editfreezerdetails.dart';
import 'screens/freezerdetails.dart';
import 'screens/help.dart';
import 'screens/home.dart';
import 'screens/intro_search.dart';
import 'screens/language.dart';
import 'screens/login.dart';
import 'screens/newpassword.dart';
import 'screens/notification.dart';
import 'screens/profile.dart';
import 'screens/search.dart';
import 'screens/setting.dart';
import 'screens/signup.dart';
import 'screens/cpassword.dart';
import 'screens/splash.dart';
import 'screens/successchange.dart';
import 'screens/verifyemail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final pref = await SharedPreferences.getInstance();
  final showHome = pref.getBool('showHome') ?? false;
  runApp(MyApp(
    showHome: showHome,
  ));
}

class MyApp extends StatefulWidget {
  bool showHome;
  MyApp({required this.showHome});

  @override
  State<MyApp> createState() => _MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
          navigatorKey: navigatorKey,
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
            '/editfreezerdetails': (BuildContext context) =>
                new EditFreezerPage(),
            '/addnew': (BuildContext context) => new AddFreezerPage(),
            '/home': (BuildContext context) => new HomePage(),
            '/notification': (BuildContext context) => new NotificationPage(),
            '/search': (BuildContext context) => new SearchPage(),
            '/setting': (BuildContext context) => new SettingPage(),
            '/help': (BuildContext context) => new HelpPage(),
            '/language': (BuildContext context) => new LanguagePage(),
            '/about': (BuildContext context) => new AboutPage(),
            '/fdetails': (BuildContext context) => new FreezerDetails(),
            '/bnavigation': (context) => CustomFooterNavigationBarNew(),
          },
          title: 'Termomete',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: widget.showHome ? CurrentPage() : OnboardingPage()),
    );
  }
}

class CurrentPage extends StatelessWidget {
  const CurrentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomFooterNavigationBarNew();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something went Wrong"),
            );
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}

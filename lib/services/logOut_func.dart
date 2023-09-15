import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignOut {
  BuildContext context;
  SignOut({required this.context});
  Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushNamed('/signin');

      // Successful sign-out
    } catch (e) {
      print(e);
      // Handle sign-out errors
    }
  }
}

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:termomete/main.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final BuildContext? context;
  GoogleSignInProvider({this.context});
  bool isLoading = false;
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future signInWithGoogle(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      isLoading = true;
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      _user = googleUser;

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw e;
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future logOutGoogle() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}

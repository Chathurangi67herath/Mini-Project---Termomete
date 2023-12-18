import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:termomete/model/user.dart';
import 'package:termomete/services/create_user.dart';
import 'package:termomete/widget/Snackbar.dart';
import '../main.dart';

class LoginFunction {
  String email;
  String password;
  BuildContext context;
  LoginFunction(
      {required this.email, required this.password, required this.context});

  Future login(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      final auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        ShowSnackBar(data: "Password is wrong", context: context).showSnack();
      } else if (e.code == "user-not-found") {
        ShowSnackBar(data: "Email not found", context: context).showSnack();
      }
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

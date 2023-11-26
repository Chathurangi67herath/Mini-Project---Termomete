import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:termomete/main.dart';
import 'package:termomete/model/user.dart';
import 'package:termomete/services/create_user.dart';

class SignUp {
  BuildContext contecxt;
  String email;
  String password;
  SignUp({required this.email, required this.password, required this.contecxt});
  Future<void> signUp() async {
    try {
      showDialog(
          context: contecxt,
          builder: (contecxt) => Center(
                child: CircularProgressIndicator(),
              ));
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      await CreateUser(
              user: UserDetails(
                  fname: "",
                  lname: "",
                  phoneNum: "",
                  backUrl: "",
                  profUrl: "",
                  id: user.user!.uid))
          .createUserFunc();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

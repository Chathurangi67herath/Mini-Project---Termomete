import 'package:firebase_auth/firebase_auth.dart';

class LoginFunction {
  String email;
  String password;
  LoginFunction({required this.email, required this.password});
  Future<void> login() async {
    final auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class SignOut {
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Successful sign-out
    } catch (e) {
      // Handle sign-out errors
    }
  }
}

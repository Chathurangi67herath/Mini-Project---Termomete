import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignOut {
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("showHome", false);
      // Successful sign-out
    } catch (e) {
      // Handle sign-out errors
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:termomete/model/user.dart';

class GetUserDetails {
  final String? currentUser;
  GetUserDetails({this.currentUser});
  Future<UserDetails> getDetails() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(currentUser)
        .get();
    // try {
    final UserDetails ud =
        UserDetails.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    return ud;
    // } catch (e) {
    //   print('error');
    // }
  }
}

import 'package:termomete/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateUser {
  UserDetails? user;
  CreateUser({this.user});
  Future createUserFunc() async {
    try {
      final docUser =
          FirebaseFirestore.instance.collection('user').doc(user!.id);
      final userObj = UserDetails(
        id: user!.id,
        lname: user!.lname,
        fname: user!.fname,
        backUrl: user!.backUrl,
        profUrl: user!.profUrl,
        phoneNum: user!.phoneNum,
      );
      final json = userObj.toJson();
      await docUser.set(json);
    } catch (e) {
      print(e);
    }
  }
}

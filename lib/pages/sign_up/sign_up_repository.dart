import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../sign_up/sign_up_model.dart';

class SignUpRepository {
  final _firebase = FirebaseAuth.instance;
  final database = FirebaseFirestore.instance;

  Future<String> saveUser(SignUpModel user) async {
    final collection = database.collection('users');

    try {
      final credential = await _firebase.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      collection
          .doc(credential.user!.uid.toString())
          .set({'name': user.name, 'email': user.email, 'cash': '0.00'});
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return 'error';
      }
    }
  }

  //late SharedPreferences preferences;
  // Future<bool> saveUser(SignUpModel user) async {
  //   preferences = await SharedPreferences.getInstance();
  //   String userJson = json.encode(user.toMap());
  //   if (preferences.getString(user.email) == null) {
  //     preferences.setString(user.email, userJson);
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}

import 'package:firebase_auth/firebase_auth.dart';
import '../sign_up/sign_up_model.dart';

class SignUpRepository {
  final _firebase = FirebaseAuth.instance;

  Future<String> saveUser(SignUpModel user) async {
    try {
      final credential = await _firebase.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
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

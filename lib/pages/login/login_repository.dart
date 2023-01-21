import 'package:firebase_auth/firebase_auth.dart';
import 'login_model.dart';

class LoginRepository {
  final _firebase = FirebaseAuth.instance;

  Future<String?> checkingUser(LoginModel userModel) async {
    String check = '';
    try {
      UserCredential checkLogin = await _firebase.signInWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
      if (checkLogin.user != null) {
        check = 'Success';
      }
      check = 'Success';
    } catch (e) {
      check = 'error';
    }
    return check;
  }
}

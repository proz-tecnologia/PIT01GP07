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

  //Map userMap = {};
  // Future<String> checkingUser(LoginModel userModel) async {
  //   preferences = await SharedPreferences.getInstance();
  //   String? check = preferences.getString(userModel.email);
  //   if (check == null) {
  //     return 'Usuário ou senha incorretos!';
  //   } else {
  //     userMap = json.decode(check);
  //     if (userMap['password'] == userModel.password) {
  //       return 'Success';
  //     } else {
  //       return 'Usuário OU senha incorretos!';
  //     }
  //   }
  // }

  // Future<void> userLogin(LoginModel userModel) async {
  //   preferences = await SharedPreferences.getInstance();
  //   preferences.setBool('isLogged', true);
  //   preferences.setString('lastLogged', userModel.email);
  // }
}

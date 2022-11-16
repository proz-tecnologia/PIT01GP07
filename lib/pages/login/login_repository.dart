import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_model.dart';

class LoginRepository {
  late SharedPreferences preferences;

  LoginRepository() {
    SharedPreferences.getInstance().then((value) => preferences = value);
  }

  Map userMap = {};

  String checkingUser(LoginModel userModel) {
    String? check = preferences.getString(userModel.email);
    if (check == null) {
      return 'Usuário ou senha incorretos!';
    } else {
      userMap = json.decode(check);
      if (userMap['password'] == userModel.password) {
        return 'Success';
      } else {
        return 'Usuário OU senha incorretos!';
      }
    }
  }

  String getUser() {
    return userMap['name'];
  }
}

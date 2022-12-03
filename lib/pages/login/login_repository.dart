import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_model.dart';

class LoginRepository {
  late SharedPreferences preferences;

  Map userMap = {};

  Future<String> checkingUser(LoginModel userModel) async {
    preferences = await SharedPreferences.getInstance();
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

  Future<void> userLogin(LoginModel userModel) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setBool('isLogged', true);
    preferences.setString('lastLogged', userModel.email);
  }
}

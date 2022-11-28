import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/login_model.dart';
import '../sign_up/sign_up_model.dart';

class AppRepository {
  late SharedPreferences preferences;

  AppRepository() {
    /*SharedPreferences.getInstance().then((value) {
      print("then $value");
      return preferences = value;
    }).catchError((_) => print('catch error'));*/
  }

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
    print(preferences.getBool('isLogged').toString());
  }

  Future<String> lastLogged() async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getString("lastLogged")!;
  }

  String getUser() {
    return userMap['name'];
  }

  Future<bool> saveUser(SignUpModel user) async {
    preferences = await SharedPreferences.getInstance();
    String userJson = json.encode(user.toMap());
    if (preferences.getString(user.email) == null) {
      preferences.setString(user.email, userJson);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> islogged() async {
    preferences = await SharedPreferences.getInstance();

    return preferences.getBool('isLogged') ?? false;
  }

  void deleteAll() {
    preferences.clear();
  }
}

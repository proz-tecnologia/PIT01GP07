import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/login_model.dart';
import '../sign_up/sign_up_model.dart';

class AppRepository {
  late SharedPreferences preferences;

  AppRepository() {
    SharedPreferences.getInstance().then((value) {
      print("then $value");
      return preferences = value;
    }).catchError((_) => print('catch error'));
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

  bool saveUser(SignUpModel user) {
    String userJson = json.encode(user.toMap());
    if (preferences.getString(user.email) == null) {
      preferences.setString(user.email, userJson);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> islogged() async {
    //preferences = await SharedPreferences.getInstance();

    return preferences.getBool('islogged') ?? false;
  }

  void deleteAll() {
    preferences.clear();
  }
}

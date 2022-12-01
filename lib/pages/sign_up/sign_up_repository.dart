import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../sign_up/sign_up_model.dart';

class SignUpRepository {
  late SharedPreferences preferences;

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
}

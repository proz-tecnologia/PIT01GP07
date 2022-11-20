import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste/pages/sign_up/sign_up_model.dart';

class SignUpRepository {
  late SharedPreferences preferences;

  SignUpRepository() {
    SharedPreferences.getInstance().then((value) => preferences = value);
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

  void deleteAll() {
    preferences.clear();
  }
}

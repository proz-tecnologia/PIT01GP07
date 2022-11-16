import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileBarRepository {
  late SharedPreferences preferences;

  LoginRepository() {
    SharedPreferences.getInstance().then((value) => preferences = value);
  }

  String? getUserName(String userEmail) {
    String? userJson = preferences.getString(userEmail);
    if (userJson != null) {
      Map userMap = json.decode(userJson);
      String name = userMap['email'];
      return name;
    } else {
      return null;
    }
  }
}

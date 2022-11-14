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
    if (preferences.getString(user.userEmail) == null) {
      preferences.setString(user.userEmail, userJson);
      return true;
    } else {
      return false;
    }
  }

  List<dynamic> getUsers() {
    String jsonUsers = preferences.getString("userList")!;
    List<dynamic> jsonUserList = json.decode(jsonUsers);
    print(jsonUserList);
    return jsonUserList;
  }

  void deleteAll() {
    preferences.clear();
    print("Deletou tudo");
  }
}

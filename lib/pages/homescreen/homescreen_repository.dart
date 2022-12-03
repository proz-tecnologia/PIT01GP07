import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenRepository {
  late SharedPreferences preferences;

  HomeScreenRepository() {
    SharedPreferences.getInstance().then((value) => preferences);
  }

  Future<String> currentUserName() async {
    try {
      preferences = await SharedPreferences.getInstance();
      String email = preferences.getString("lastLogged")!;
      String user = preferences.getString(email)!;
      final userMap = json.decode(user);
      log(userMap.toString());
      final name = userMap['name'];
      return name;
    } catch (e) {
      return 'error';
    }
  }

  Future<String> getCashValue() async {
    String cash;
    try {
      preferences = await SharedPreferences.getInstance();
      String email = preferences.getString("lastLogged")!;
      String user = preferences.getString(email)!;
      final userMap = json.decode(user) as Map;
      if (userMap.containsKey('cash')) {
        cash = '111';
        return cash;
      } else {
        userMap['cash'] = '0.00';
        preferences.setString(email, json.encode(userMap));
        return getCashValue();
      }
    } catch (e) {
      return 'error';
    }
  }
}

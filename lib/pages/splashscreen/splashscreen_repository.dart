import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenRepository {
  late SharedPreferences preferences;

  Future<bool?> islogged() async {
    preferences = await SharedPreferences.getInstance();

    bool? islogged = preferences.getBool('isLogged');

    if (islogged == null) {
      preferences.setBool('islogged', false);
      return false;
    } else {
      return islogged;
    }
  }
}

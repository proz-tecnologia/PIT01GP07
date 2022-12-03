import 'package:shared_preferences/shared_preferences.dart';
import '../login/login_model.dart';

class SplashScreenRepository {
  late SharedPreferences preferences;

  Future<void> userLogin(LoginModel userModel) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setBool('isLogged', true);
    preferences.setString('lastLogged', userModel.email);
  }

  Future<String> lastLogged() async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getString("lastLogged")!;
  }

  Future<bool> islogged() async {
    preferences = await SharedPreferences.getInstance();

    return preferences.getBool('isLogged') ?? false;
  }
}

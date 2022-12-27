import 'package:firebase_auth/firebase_auth.dart';

class SplashScreenRepository {
  final _firebase = FirebaseAuth.instance;

  Future<bool?> islogged() async {
    bool? islogged = false;
    try {
      User? user = _firebase.currentUser;
      if (user == null) {
        islogged = false;
      } else {
        islogged = true;
      }

      return islogged;
    } catch (e) {
      return null;
    }
  }
  // late SharedPreferences preferences;

  // Future<bool?> islogged() async {
  //   preferences = await SharedPreferences.getInstance();

  //   bool? islogged = preferences.getBool('isLogged');

  //   if (islogged == null) {
  //     preferences.setBool('islogged', false);
  //     return false;
  //   } else {
  //     return islogged;
  //   }
  // }
}

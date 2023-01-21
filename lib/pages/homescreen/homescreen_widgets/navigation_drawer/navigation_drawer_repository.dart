import 'package:firebase_auth/firebase_auth.dart';

class NavigationDrawerRepository {
  Future<String> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return 'success';
    } catch (e) {
      return 'error';
    }
  }
}

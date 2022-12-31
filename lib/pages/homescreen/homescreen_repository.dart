import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenRepository {
  final _firebase = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getUserData() async {
    final userData = await _database
        .collection('users')
        .where('email', isEqualTo: _firebase.currentUser!.email)
        .get();
    return userData;
  }

  Future<String> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return 'success';
    } catch (e) {
      return 'error';
    }
  }

  Future<Map?> currentUserName() async {
    final userDdata = await getUserData();
    try {
      final name = userDdata.docs.first.data();
      return name;
    } catch (e) {
      return null;
    }
  }

  // Shared Preferences Stack
  late SharedPreferences preferences;

  // HomeScreenRepository() {
  //   SharedPreferences.getInstance().then((value) => preferences);
  // }

  // Future<String> currentUserName() async {
  //   try {
  //     preferences = await SharedPreferences.getInstance();
  //     String email = preferences.getString("lastLogged")!;
  //     String user = preferences.getString(email)!;
  //     final userMap = json.decode(user);
  //     log(userMap.toString());
  //     final name = userMap['name'];
  //     return name;
  //   } catch (e) {
  //     return 'error';
  //   }
  // }

  Future<String> getCashValue() async {
    String cash;
    try {
      preferences = await SharedPreferences.getInstance();
      String email = preferences.getString("lastLogged")!;
      String user = preferences.getString(email)!;
      final userMap = json.decode(user) as Map;
      if (userMap.containsKey('cash')) {
        cash = userMap['cash'];
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

  // Future<String> logout() async {
  //   try {
  //     preferences = await SharedPreferences.getInstance();
  //     preferences.setBool('isLogged', false);
  //     return 'success';
  //   } catch (e) {
  //     return 'error';
  //   }
  // }
}

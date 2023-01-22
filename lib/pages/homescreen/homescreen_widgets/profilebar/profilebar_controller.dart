import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'profilebar_repository.dart';

class ProfileBarController {
  ValueNotifier<String> userName = ValueNotifier('Usuário');

  ProfileBarRepository repository =
      ProfileBarRepository(FirebaseAuth.instance, FirebaseFirestore.instance);
  Future<void> getUserName() async {
    final user = await repository.userData();
    if (user != null) {
      userName.value = user['name'];
    } else {
      userName.value = userName.value;
    }
  }

  Future<bool?> logout() async {
    String logout = await repository.logout();
    if (logout == 'Success') {
      return true;
    } else {
      return false;
    }
  }
}

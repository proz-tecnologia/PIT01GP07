import 'package:flutter/material.dart';

import 'profilebar_repository.dart';

class ProfileBarController {
  ValueNotifier<String> userName = ValueNotifier('Usuário');

  ProfileBarRepository repository = ProfileBarRepository();

  Future<void> getUserName() async {
    final user = await repository.userData();
    if (user != null) {
      userName.value = user['name'];
    } else {
      userName.value = userName.value;
    }
  }
}

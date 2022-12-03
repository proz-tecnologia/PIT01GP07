import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:teste/pages/homescreen/homescreen_states.dart';
import 'homescreen_repository.dart';

class HomeScreenController {
  final HomeScreenRepository repository = HomeScreenRepository();
  ValueNotifier<String> userName = ValueNotifier('Usuário');
  ValueNotifier<String> cashValue = ValueNotifier('2.00');
  ValueNotifier<VisibleOrObscureText> visibilityText =
      ValueNotifier(VisibleText());

  late String currentUser;

  Future<void> getUserName() async {
    String user = await repository.currentUserName();
    log(user);

    if (user != 'error') {
      userName.value = user;
    } else {
      userName.value = 'Deu ruim';
    }
  }

  Future<void> getCashValue() async {
    String cash = await repository.getCashValue();
    if (cash != 'error') {
      cashValue.value = cash;
    } else {
      cashValue.value = "Erro de servidor";
    }
  }

  void cashVisibility(String cash) {
    cashValue.value = '666';
  }
}

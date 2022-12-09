import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'homescreen_repository.dart';
import 'homescreen_states.dart';

class HomeScreenController {
  final HomeScreenRepository repository = HomeScreenRepository();
  ValueNotifier<String> userName = ValueNotifier('Usuário');
  ValueNotifier<String> cashValue = ValueNotifier('0.00');
  ValueNotifier<Icon> iconVisibility =
      ValueNotifier(const Icon(Icons.visibility_off));
  bool obscure = true;
  String lastCashValue = '';

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
    lastCashValue = cashValue.value;
  }

  void cashVisibility() {
    if (obscure) {
      cashValue.value = '******';
      iconVisibility.value = const Icon(Icons.visibility);
      obscure = false;
    } else {
      iconVisibility.value = const Icon(Icons.visibility_off);
      obscure = true;
      cashValue.value = lastCashValue;
    }
  }
}

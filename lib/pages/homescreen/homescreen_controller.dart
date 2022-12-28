import 'package:flutter/material.dart';
import 'homescreen_repository.dart';

class HomeScreenController {
  final HomeScreenRepository repository = HomeScreenRepository();
  ValueNotifier<String> userName = ValueNotifier('Usuário');
  ValueNotifier<String> cashValue = ValueNotifier('0.00');
  ValueNotifier<Icon> iconVisibility =
      ValueNotifier(const Icon(Icons.visibility_off));
  bool obscure = true;
  String lastCashValueLoaded = '';

  Future<void> getUserName() async {
    String user = await repository.currentUserName();
    if (user != 'error') {
      userName.value = user;
    } else {
      userName.value = 'Deu ruim';
    }
  }

  void setCashValue(String cash) {
    cashValue.value = cash;
  }

  Future<void> getCashValue() async {
    String cash = await repository.getCashValue();
    if (cash != 'error') {
      cashValue.value = cash;
    } else {
      cashValue.value = "Erro no servidor";
    }
    lastCashValueLoaded = cashValue.value;
  }

  void cashVisibility() {
    if (obscure) {
      cashValue.value = '******';
      iconVisibility.value = const Icon(Icons.visibility);
      obscure = false;
    } else {
      iconVisibility.value = const Icon(Icons.visibility_off);
      obscure = true;
      cashValue.value = lastCashValueLoaded;
    }
  }

  Future<bool?> logout() async {
    String logout = await repository.logout();
    if (logout == 'success') {
      return true;
    } else if (logout == 'error') {
      return false;
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import 'homescreen_repository.dart';

class HomeScreenController {
  final HomeScreenRepository repository = HomeScreenRepository();
  ValueNotifier<String> userName = ValueNotifier('Usuário');
  ValueNotifier<String> userEmail = ValueNotifier('Email');
  ValueNotifier<String> cashValue = ValueNotifier('0.00');
  ValueNotifier<String> incomes = ValueNotifier('0.00');
  ValueNotifier<String> expenses = ValueNotifier('0.00');
  ValueNotifier<Icon> iconVisibility =
      ValueNotifier(const Icon(Icons.visibility_off));
  bool obscure = true;
  String lastCashValueLoaded = '';

  Future<void> getUserData() async {
    final user = await repository.userData();
    if (user != null) {
      userName.value = user['name'];
      userEmail.value = user['email'];
      cashValue.value = user['cash'];
      incomes.value = user['totalIncomes'];
      print(incomes.value);
      expenses.value = user['totalExpenses'];
      print(expenses.value);
      lastCashValueLoaded = cashValue.value;
    } else {
      userName.value = 'Deu ruim';
    }
  }

  void setCashValue(String cash) {
    cashValue.value = cash;
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

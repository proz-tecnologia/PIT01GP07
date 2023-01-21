import 'package:flutter/material.dart';

import 'cash_balance_bar_repository.dart';

class CashBalanceBarController {
  ValueNotifier<String> cashValue = ValueNotifier('0.00');

  ValueNotifier<Icon> iconVisibility =
      ValueNotifier(const Icon(Icons.visibility_off));
  bool obscure = true;
  String lastCashValueLoaded = '';

  CashBalanceBarRepository repository = CashBalanceBarRepository();

  Future<void> getUserCashValue() async {
    final user = await repository.userData();
    if (user != null) {
      cashValue.value = user['cash'];
    } else {
      cashValue.value = cashValue.value;
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
}

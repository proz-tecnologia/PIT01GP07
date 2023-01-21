import 'package:flutter/material.dart';
import 'homescreen_repository.dart';

class HomeScreenController {
  final HomeScreenRepository repository = HomeScreenRepository();

  static ValueNotifier<String> userEmail = ValueNotifier('Email');

  static ValueNotifier<String> incomes = ValueNotifier('0.00');
  static ValueNotifier<String> expenses = ValueNotifier('0.00');
  static ValueNotifier<List<Map<String, dynamic>>> firstExpenses =
      ValueNotifier([]);

  Future<void> getUserData() async {
    final user = await repository.userData();
    if (user != null) {
      userEmail.value = user['email'];

      incomes.value = user['totalIncomes'];
      expenses.value = user['totalExpenses'];
    }
  }
}

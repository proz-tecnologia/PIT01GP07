import 'package:flutter/material.dart';
import 'package:teste/pages/homescreen/homescreen_repository.dart';
import 'package:teste/pages/operation/operation_states.dart';
import '../homescreen/homescreen_controller.dart';
import 'operation_repository.dart';
import 'operation_model.dart';

class OperationController {
  OperationRepository repository = OperationRepository();
  HomeScreenController homeScreenController = HomeScreenController();
  HomeScreenRepository homeScreenRepository = HomeScreenRepository();
  ValueNotifier<List<String>> accounts = ValueNotifier([]);
  ValueNotifier<OperationAccountsStates> state =
      ValueNotifier(OperationAccountsInitialState());

  Future<void> performOperation(
    OperationModel operation,
  ) async {
    String cashString = await repository.addOperation(operation: operation);
    double modelCash = double.parse(operation.operationValue);
    double cash = 0.0;
    double incomes = 0.0;
    double expenses = 0.0;
    final userData = await homeScreenRepository.userData();
    if (userData != null) {
      cash = double.parse(userData['cash']);
    }
    if (cashString != 'error') {
      if (operation.operation == 'income') {
        double newCash = cash + modelCash;
        incomes = double.parse(userData!['totalIncomes']) + modelCash;

        HomeScreenController.incomes.value = incomes.toString();
        repository.setNewCashIncomesExpenses(
          newCash: newCash.toString(),
          totalOperations: incomes.toString(),
          operation: 'totalIncomes',
        );
        Map<String, dynamic>? currentCash =
            await repository.getAccountCashValue(operation.account);
        if (currentCash != null) {
          double newAccountCash =
              double.parse(currentCash['cashvalue']) + modelCash;

          await repository.setNewAccountCashValue(
              operation.account, newAccountCash.toString());
        }
      } else if (operation.operation == 'expense') {
        double newCash = cash - modelCash;
        expenses = double.parse(userData!['totalExpenses']) + modelCash;

        HomeScreenController.expenses.value = expenses.toString();

        repository.setNewCashIncomesExpenses(
          newCash: newCash.toString(),
          totalOperations: expenses.toString(),
          operation: 'totalExpenses',
        );

        Map<String, dynamic>? currentCash =
            await repository.getAccountCashValue(operation.account);
        if (currentCash != null) {
          double newAccountCash =
              double.parse(currentCash['cashvalue']) - modelCash;

          await repository.setNewAccountCashValue(
              operation.account, newAccountCash.toString());
        }
      }
    }
  }

  Future<void> getAccounts() async {
    state.value = OperationAccountsLoadingState();
    final accountsList = await repository.accountsList();
    if (accountsList != null) {
      if (accountsList.isEmpty) {
        state.value = OperationAccountsFirtAccessState();
      } else {
        for (var i = 0; i < accountsList.length; i++) {
          accounts.value.add(accountsList[i]['account']);
        }
        state.value = OperationAccountsSuccessState();
      }
    } else {
      state.value = OperationAccountsErrorState();
    }
  }
}

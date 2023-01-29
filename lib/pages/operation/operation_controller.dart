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
      {required OperationModel operationModel, String? secondAccount}) async {
    String cashString = '';
    if (operationModel.operation != 'transfer') {
      cashString = await repository.addOperation(operation: operationModel);
    }
    double modelCash = double.parse(operationModel.operationValue);
    double cash = 0.0;
    double incomes = 0.0;
    double expenses = 0.0;
    final userData = await homeScreenRepository.userData();
    if (userData != null) {
      cash = double.parse(userData['cash']);
    }
    if (cashString != 'error') {
      //Nova receita
      if (operationModel.operation == 'income') {
        double newCash = cash + modelCash;
        incomes = double.parse(userData!['totalIncomes']) + modelCash;

        HomeScreenController.incomes.value = incomes.toString();
        repository.setNewCashIncomesExpenses(
          newCash: newCash.toString(),
          totalOperations: incomes.toString(),
          operation: 'totalIncomes',
        );
        Map<String, dynamic>? accountCurrentCash =
            await repository.getAccountCashValue(operationModel.account);
        if (accountCurrentCash != null) {
          double newAccountCash =
              double.parse(accountCurrentCash['cashvalue']) + modelCash;

          await repository.setNewAccountCashValue(
              operationModel.account, newAccountCash.toString());
        }
        //Fim da nova receita
      } else if (operationModel.operation == 'expense') {
        //Nova Despesa
        double newCash = cash - modelCash;
        expenses = double.parse(userData!['totalExpenses']) + modelCash;

        HomeScreenController.expenses.value = expenses.toString();

        repository.setNewCashIncomesExpenses(
          newCash: newCash.toString(),
          totalOperations: expenses.toString(),
          operation: 'totalExpenses',
        );

        Map<String, dynamic>? accountCurrentCash =
            await repository.getAccountCashValue(operationModel.account);
        if (accountCurrentCash != null) {
          double newAccountCash =
              double.parse(accountCurrentCash['cashvalue']) - modelCash;

          await repository.setNewAccountCashValue(
              operationModel.account, newAccountCash.toString());
        }
        //Fim da nova despesa
      } else {
        //Nova transferência
        await repository.setNewTransfer(
            operationModel: operationModel, inAccoount: secondAccount!);
        Map<String, dynamic>? outCurrentCash =
            await repository.getAccountCashValue(operationModel.account);
        if (outCurrentCash != null) {
          double oldAccountCash =
              double.parse(outCurrentCash['cashvalue']) - modelCash;

          await repository.setNewAccountCashValue(
              operationModel.account, oldAccountCash.toString());
        }

        Map<String, dynamic>? inCurrentCash =
            await repository.getAccountCashValue(secondAccount);
        if (inCurrentCash != null) {
          double newAccountCash =
              double.parse(inCurrentCash['cashvalue']) + modelCash;

          await repository.setNewAccountCashValue(
              secondAccount, newAccountCash.toString());
        }
      }
    }
  }

  Future<void> getAccounts() async {
    state.value = OperationAccountsLoadingState();
    final accountsList = await repository.accountsList();
    if (accountsList != null) {
      for (var i = 0; i < accountsList.length; i++) {
        accounts.value.add(accountsList[i]['account']);
        state.value = OperationAccountsSuccessState();
      }
    } else {
      state.value = OperationAccountsErrorState();
    }
  }
}

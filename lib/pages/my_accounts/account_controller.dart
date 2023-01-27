import 'package:flutter/widgets.dart';
import 'account_model.dart';
import 'account_repository.dart';
import 'account_states.dart';

class AccountController {
  AccountRepository repository = AccountRepository();

  ValueNotifier<AddAccountStates> addAccountState =
      ValueNotifier(AddAccountInitialState());
  ValueNotifier<List<Map<String, dynamic>>> accounts = ValueNotifier([]);

  Future<void> addAccount(AccountModel accountModel) async {
    addAccountState.value = AddAccountLoadingState();
    String saveAccount =
        await repository.saveAccount(accountModel: accountModel);
    final data = await repository.getUserData() as Map;
    double newCash =
        double.parse(accountModel.value) + double.parse(data['cash']);
    double totalOperations =
        double.parse(accountModel.value) + double.parse(data['totalIncomes']);
    String saveNewData = await repository.setNewCashIncomesExpenses(
        newCash: newCash.toString(),
        totalOperations: totalOperations.toString());
    if (saveAccount == 'success' || saveNewData == 'success') {
      addAccountState.value = AddAccountSuccessState();
    } else {
      addAccountState.value = AddAccountErrorState();
    }
  }

  Future<void> getAccounts() async {
    addAccountState.value = AddAccountLoadingState();
    final accountsList = await repository.accountsList();
    if (accountsList != null) {
      if (accountsList.isEmpty) {
        addAccountState.value = AddAccountFirtAccessState();
      } else {
        accounts.value = accountsList;
        addAccountState.value = AddAccountSuccessState();
      }
    } else {
      addAccountState.value = AddAccountErrorState();
    }
  }
}

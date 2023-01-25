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
    if (saveAccount == 'success') {
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

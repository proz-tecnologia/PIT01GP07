import 'package:flutter/widgets.dart';
import 'account_model.dart';
import 'account_repository.dart';
import 'account_states.dart';

class AccountController {
  AccountRepository repository = AccountRepository();

  ValueNotifier<AddAccountStates> addAccountState =
      ValueNotifier(AddAccountInitialState());

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
}

import 'package:flutter/widgets.dart';
import 'package:teste/pages/homescreen/homescreen_widgets/cards_container_widgets/card_account_widgets/account_model.dart';
import 'package:teste/pages/homescreen/homescreen_widgets/cards_container_widgets/card_account_widgets/account_states.dart';

import 'account_repository.dart';

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

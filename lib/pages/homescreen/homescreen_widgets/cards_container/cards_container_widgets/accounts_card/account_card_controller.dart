import 'package:flutter/widgets.dart';
import 'package:teste/pages/homescreen/homescreen_widgets/cards_container/cards_container_widgets/accounts_card/account_card_states.dart';
import 'account_card_repository.dart';

class AccountCardController {
  final AccountCardRepository repository = AccountCardRepository();

  ValueNotifier<List<Map<String, dynamic>>> firstAccounts = ValueNotifier([]);
  ValueNotifier<AccountCardStates> state =
      ValueNotifier(AccountCardInitialState());

  Future<void> getAccounts() async {
    state.value = AccountCardLoadingState();
    final expensesList = await repository.firstOperations();
    if (expensesList != null) {
      if (expensesList.isEmpty) {
        state.value = AccountCardFirtAccessState();
      } else {
        firstAccounts.value = expensesList;
        state.value = AccountCardSuccessState();
      }
    } else {
      state.value = AccountCardErrorState();
    }
  }
}

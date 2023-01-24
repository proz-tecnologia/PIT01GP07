import 'package:flutter/widgets.dart';
import 'tab_cards_repository.dart';
import 'tab_cards_states.dart';

class ExpensesCardController {
  final ExpensesCardRepository repository = ExpensesCardRepository();

  ValueNotifier<List<Map<String, dynamic>>> firstExpenses = ValueNotifier([]);
  ValueNotifier<DefaultTabState> state =
      ValueNotifier(DefaultTabInitialState());

  Future<void> getOperations(String operation) async {
    state.value = DefaultTabLoadingState();
    final expensesList = await repository.firstOperations(operation);
    if (expensesList != null) {
      if (expensesList.isEmpty) {
        state.value = DefaultTabFirtAccessState();
      } else {
        firstExpenses.value = expensesList;
        state.value = DefaultTabSuccessState();
      }
    } else {
      state.value = DefaultTabErrorState();
    }
  }
}

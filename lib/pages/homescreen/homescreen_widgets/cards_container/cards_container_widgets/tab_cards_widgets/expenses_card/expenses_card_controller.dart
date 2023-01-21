import 'package:flutter/widgets.dart';
import 'expenses_card_repository.dart';
import 'expenses_card_states.dart';

class ExpensesCardController {
  final ExpensesCardRepository repository = ExpensesCardRepository();

  ValueNotifier<List<Map<String, dynamic>>> firstExpenses = ValueNotifier([]);
  ValueNotifier<ExpensesCardState> state =
      ValueNotifier(ExpensesCardInitialState());

  Future<void> setNewExpense() async {
    state.value = ExpensesCardLoadingState();
    final expensesList = await repository.firstExpenses();
    if (expensesList != null) {
      if (expensesList.isEmpty) {
        state.value = ExpensesCardFirtAccessState();
      } else {
        firstExpenses.value = expensesList;
        state.value = ExpensesCardSuccessState();
      }
    } else {
      state.value = ExpensesCardErrorState();
    }
  }
}

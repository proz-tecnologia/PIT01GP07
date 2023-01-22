import 'package:flutter/widgets.dart';

import 'all_expenses_repository.dart';
import 'all_expenses_states.dart';

class AllExpensesController {
  final AllExpensesRepository repository = AllExpensesRepository();

  ValueNotifier<List<Map<String, dynamic>>> expenses = ValueNotifier([]);
  ValueNotifier<AllExpensesState> state =
      ValueNotifier(AllExpensesInitialState());

  Future<void> getExpensesList() async {
    state.value = AllExpensesLoadingState();
    final expensesList = await repository.firstExpenses();
    if (expensesList != null) {
      expenses.value = expensesList;
      state.value = AllExpensesSuccessState();
    } else {
      state.value = AllExpensesErrorState();
    }
  }
}

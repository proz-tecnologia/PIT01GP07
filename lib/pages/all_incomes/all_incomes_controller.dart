import 'package:flutter/widgets.dart';

import 'all_incomes_repository.dart';
import 'all_incomes_states.dart';

class AllIncomesController {
  final AllIncomesRepository repository = AllIncomesRepository();

  ValueNotifier<List<Map<String, dynamic>>> expenses = ValueNotifier([]);
  ValueNotifier<AllIncomesState> state =
      ValueNotifier(AllIncomesInitialState());

  Future<void> getExpensesList() async {
    state.value = AllIncomesLoadingState();
    final expensesList = await repository.firstExpenses();
    if (expensesList != null) {
      expenses.value = expensesList;
      state.value = AllIncomesSuccessState();
    } else {
      state.value = AllIncomesErrorState();
    }
  }
}

import 'package:flutter/widgets.dart';
import 'package:teste/pages/homescreen/homescreen_widgets/cards_container/cards_container_widgets/operations_card/expenses_incomes_card/expenses_incomes_repository.dart';
import 'package:teste/pages/homescreen/homescreen_widgets/cards_container/cards_container_widgets/operations_card/expenses_incomes_card/expenses_incomes_states.dart';

class ExpensesIncomesCardController {
  final ExpensesIncomesCardRepository repository =
      ExpensesIncomesCardRepository();

  ValueNotifier<List<Map<String, dynamic>>> firstExpenses = ValueNotifier([]);
  ValueNotifier<ExpensesIncomesCardState> state =
      ValueNotifier(ExpensesIncomesCardInitialState());

  Future<void> getOperations(String operation) async {
    state.value = ExpensesIncomesCardLoadingState();
    final expensesList = await repository.firstOperations(operation);
    if (expensesList != null) {
      if (expensesList.isEmpty) {
        state.value = ExpensesIncomesCardFirtAccessState();
      } else {
        firstExpenses.value = expensesList;
        state.value = ExpensesIncomesCardSuccessState();
      }
    } else {
      state.value = ExpensesIncomesCardErrorState();
    }
  }
}

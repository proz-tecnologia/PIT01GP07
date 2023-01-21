import 'package:teste/pages/homescreen/homescreen_repository.dart';
import '../homescreen/homescreen_controller.dart';
import 'operation_repository.dart';
import 'operation_model.dart';

class OperationController {
  OperationRepository repository = OperationRepository();
  HomeScreenController homeScreenController = HomeScreenController();
  HomeScreenRepository homeScreenRepository = HomeScreenRepository();

  Future<void> performOperation(
    OperationModel operation,
  ) async {
    String cashString = await repository.addOperation(operation: operation);
    double modelCash = double.parse(operation.operationValue);
    double cash = 0.0;
    double incomes = 0.0;
    double expenses = 0.0;
    final userData = await homeScreenRepository.userData();
    if (userData != null) {
      cash = double.parse(userData['cash']);
    }
    if (cashString != 'error') {
      if (operation.operation == 'income') {
        double newCash = cash + modelCash;
        incomes = double.parse(userData!['totalIncomes']) + modelCash;

        HomeScreenController.incomes.value = incomes.toString();
        repository.setNewCashIncomesExpenses(
          newCash: newCash.toString(),
          totalOperations: incomes.toString(),
          operation: 'totalIncomes',
        );
      } else if (operation.operation == 'expense') {
        double newCash = cash - modelCash;
        expenses = double.parse(userData!['totalExpenses']) + modelCash;

        HomeScreenController.expenses.value = expenses.toString();

        repository.setNewCashIncomesExpenses(
          newCash: newCash.toString(),
          totalOperations: expenses.toString(),
          operation: 'totalExpenses',
        );
      }
    }
  }
}

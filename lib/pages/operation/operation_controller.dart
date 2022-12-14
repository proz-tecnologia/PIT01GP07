import 'dart:developer';

import '../homescreen/homescreen_controller.dart';
import 'operation_repository.dart';
import 'operation_model.dart';

class OperationController {
  OperationRepository repository = OperationRepository();
  HomeScreenController homeScreenController = HomeScreenController();

  Future<void> performOperation(
    OperationModel operation,
  ) async {
    String cashString = await repository.addOperationReturnBalance(
      model: operation,
    );

    double modelCash = double.parse(operation.operationValue);
    print(cashString);
    double cash = double.parse(cashString);

    if (operation.operation == 'income') {
      double newCash = cash + modelCash;
      repository.setNewCashValue(newCash.toString());
      homeScreenController.cashValue.addListener(() {
        homeScreenController.setCashValue(newCash.toString());
      });
    } else if (operation.operation == 'expense') {
      double newCash = cash - modelCash;
      homeScreenController.cashValue.addListener(() {
        homeScreenController.setCashValue(newCash.toString());
      });
      repository.setNewCashValue(newCash.toString());
    }
  }
}

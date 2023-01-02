import 'dart:developer';

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
    print(cashString);
    final userData = await homeScreenRepository.userData();
    if (userData != null) {
      cash = double.parse(userData['cash']);
    }
    if (cashString != 'error') {
      print('4444');
      if (operation.operation == 'income') {
        double newCash = cash + modelCash;
        homeScreenController.setCashValue(newCash.toString());
        repository.setNewCashValue(newCash.toString());
      } else if (operation.operation == 'expense') {
        double newCash = cash - modelCash;
        homeScreenController.setCashValue(newCash.toString());
        repository.setNewCashValue(newCash.toString());
      }
    }
  }
}

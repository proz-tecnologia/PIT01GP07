import 'package:flutter/widgets.dart';

import 'my_operations_repository.dart';
import 'my_operations_states.dart';

class MyOperationsController {
  final MyOperationsRepository repository = MyOperationsRepository();

  ValueNotifier<List<Map<String, dynamic>>> operations = ValueNotifier([]);
  ValueNotifier<MyOperationsState> state =
      ValueNotifier(MyOperationsInitialState());

  Future<void> getOperationsList(String operation) async {
    state.value = MyOperationsLoadingState();
    final operationsList = await repository.operationsList(operation);
    if (operationsList != null) {
      operations.value = operationsList;
      state.value = MyOperationsSuccessState();
    } else {
      state.value = MyOperationsErrorState();
    }
  }
}

import 'package:flutter/widgets.dart';
import 'add_card_repository.dart';
import 'add_card_model.dart';

class AddCardController {
  AddCardRepository repository = AddCardRepository();

  ValueNotifier<AddCardStates> addCardState =
  ValueNotifier(AddCardInitialState());

  Future<void> addCard(AddCardModel operation) async {
    addCardState.value = AddCardLoadingState();
    String addCreditCard =
    await repository.addCreditCard(operation: operation);
    if ( addCreditCard == 'success') {
      addCardState.value = AddCardSuccessState();
    } else {
      addCardState.value = AddCardErrorState();
    }
  }
}

abstract class AddCardStates {}

class AddCardInitialState implements AddCardStates {}

class AddCardLoadingState implements AddCardStates {}

class AddCardSuccessState implements AddCardStates {}

class AddCardErrorState implements AddCardStates {}
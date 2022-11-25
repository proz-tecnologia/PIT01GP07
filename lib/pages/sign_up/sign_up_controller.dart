import 'package:flutter/widgets.dart';
import 'package:teste/pages/sign_up/sign_up_model.dart';
import 'package:teste/pages/sign_up/sign_up_states.dart';

import '../repository/repository.dart';

class SignUpController extends ChangeNotifier {
  static final SignUpController instance = SignUpController();

  SignUpState state = SignUpInitialState();

  AppRepository repository = AppRepository();

  Future<void> addUser(SignUpModel userModel) async {
    updateState(SignUpLoadingState());
    if (repository.saveUser(userModel)) {
      updateState(
          SignUpSuccessState(message: "Usuário cadastrado com sucesso!"));
    } else {
      updateState(SignUpErrorState(message: 'O usuário já está cadastrado!'));
    }
  }

  void updateState(SignUpState newState) {
    state = newState;
    notifyListeners();
  }
}

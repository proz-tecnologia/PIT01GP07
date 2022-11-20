import 'package:flutter/widgets.dart';
import 'package:teste/pages/sign_up/sign_up_model.dart';
import 'package:teste/pages/sign_up/sign_up_repository.dart';
import 'package:teste/pages/sign_up/sign_up_states.dart';

class SignUpController extends ChangeNotifier {
  static final SignUpController instance = SignUpController();

  SignUpState state = SignUpInitialState();

  SignUpRepository repository = SignUpRepository();

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

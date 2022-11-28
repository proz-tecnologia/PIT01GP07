import 'package:flutter/widgets.dart';
import '../repository/repository.dart';
import 'sign_up_model.dart';
import 'sign_up_states.dart';

class SignUpController extends ChangeNotifier {
  static final SignUpController instance = SignUpController();

  SignUpState state = SignUpInitialState();

  AppRepository repository = AppRepository();

  Future<void> addUser(SignUpModel userModel) async {
    updateState(SignUpLoadingState());
    if (await repository.saveUser(userModel)) {
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

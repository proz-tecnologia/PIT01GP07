import 'package:flutter/widgets.dart';
import 'login_model.dart';
import 'login_repository.dart';
import 'login_states.dart';

class LoginController extends ChangeNotifier {
  static final LoginController instance = LoginController();

  LoginState state = LoginInitialState();

  LoginRepository repository = LoginRepository();

  Future<void> addUser(LoginModel userModel) async {
    updateState(LoginLoadingState());
    String loginMessage = repository.checkingUser(userModel);
    if (loginMessage == 'Success') {
      updateState(LoginSuccessState(message: "Login com sucesso!"));
    } else {
      updateState(LoginErrorState(message: loginMessage));
    }
  }

  void updateState(LoginState newState) {
    state = newState;
    notifyListeners();
  }
}

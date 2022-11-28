import 'package:flutter/widgets.dart';
import 'login_repository.dart';
import 'login_model.dart';
import 'login_states.dart';

class LoginController extends ChangeNotifier {
  static final LoginController instance = LoginController();

  LoginState state = LoginInitialState();

  AppRepository repository = AppRepository();

  Future<void> validateUser(LoginModel userModel) async {
    updateState(LoginLoadingState());
    String loginMessage = await repository.checkingUser(userModel);
    if (loginMessage == 'Success') {
      updateState(LoginSuccessState());
      await repository.userLogin(userModel);
    } else {
      updateState(LoginErrorState(message: loginMessage));
    }
  }

  void updateState(LoginState newState) {
    state = newState;
    notifyListeners();
  }
}

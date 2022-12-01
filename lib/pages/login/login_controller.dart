import 'package:flutter/widgets.dart';
import 'login_repository.dart';
import 'login_model.dart';
import 'login_states.dart';

class LoginController extends ValueNotifier<LoginState> {
  final LoginRepository repository;
  LoginController(this.repository) : super(LoginInitialState());

  Future<void> validateUser(LoginModel userModel) async {
    String loginMessage = await repository.checkingUser(userModel);
    if (loginMessage == 'Success') {
      value = LoginSuccessState();
      await repository.userLogin(userModel);
    } else {
      value = LoginErrorState(message: loginMessage);
    }
  }
}

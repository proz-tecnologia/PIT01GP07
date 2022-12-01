abstract class LoginState {}

class LoginInitialState implements LoginState {}

class LoginLoadingState implements LoginState {}

class LoginSuccessState implements LoginState {}

class LoginErrorState implements LoginState {
  final String message;

  LoginErrorState({
    required this.message,
  });
}

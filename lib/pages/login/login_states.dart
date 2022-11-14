abstract class LoginState {}

class LoginInitialState implements LoginState {}

class LoginLoadingState implements LoginState {}

class LoginSuccessState implements LoginState {
  final String message;

  LoginSuccessState({
    required this.message,
  });
}

class LoginErrorState implements LoginState {
  final String message;

  LoginErrorState({
    required this.message,
  });
}

abstract class SignUpState {}

class SignUpInitialState implements SignUpState {}

class SignUpLoadingState implements SignUpState {}

class SignUpSuccessState implements SignUpState {
  final String message;

  SignUpSuccessState({
    required this.message,
  });
}

class SignUpErrorState implements SignUpState {
  final String message;

  SignUpErrorState({
    required this.message,
  });
}

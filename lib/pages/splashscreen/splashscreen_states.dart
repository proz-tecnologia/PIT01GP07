abstract class SplashState {}

class SplashScreenInitialState implements SplashState {}

class SplashScreenLoadingState implements SplashState {}

class SplashScreenLoginTrueState implements SplashState {}

class SplashScreenLoginFalseState implements SplashState {}

class SplashScreenErrorState implements SplashState {
  final String message;

  SplashScreenErrorState({
    required this.message,
  });
}

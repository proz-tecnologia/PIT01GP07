abstract class SplashState {}

class SplashScreenInitialState implements SplashState {}

class SplashScreenLoadingState implements SplashState {}

class SplashScreenUserLoggedState implements SplashState {}

class SplashScreenNoUserLoggedState implements SplashState {}

class SplashScreenErrorState implements SplashState {
  final String message;

  SplashScreenErrorState({
    required this.message,
  });
}

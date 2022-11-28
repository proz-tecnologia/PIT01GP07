import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '../repository/repository.dart';
import 'splashscreen_states.dart';

class SplashScreenController extends ValueNotifier<SplashState> {
  final AppRepository repository;
  SplashScreenController(this.repository) : super(SplashScreenInitialState());

  Future<void> checkingLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    value = SplashScreenLoadingState();
    await Future.delayed(const Duration(seconds: 3));
    bool? login = await repository.islogged();
    if (login == false) {
      value = SplashScreenNoUserLoggedState();
    } else if (login == true) {
      value = SplashScreenUserLoggedState();
    } else {
      value = SplashScreenErrorState(message: "Houve um erro no servidor!");
    }
  }
}

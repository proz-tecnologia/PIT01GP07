import 'package:flutter/widgets.dart';
import 'package:teste/pages/sign_up/sign_up_model.dart';
import 'package:teste/pages/sign_up/sign_up_repository.dart';
import 'package:teste/pages/sign_up/sign_up_states.dart';

class MyException implements Exception {
  final String message;

  MyException(this.message);
}

class SignUpController extends ChangeNotifier {
  static final SignUpController instance = SignUpController();

  final List<Map> _userList = [];

  List<Map> get userList => _userList;

  SignUpState state = SignUpInitialState();

  SignUpRepository repository = SignUpRepository();

  Future<void> getUsers() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> addUser(SignUpModel userModel) async {
    updateState(SignUpLoadingState());
    if (repository.saveUser(userModel)) {
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

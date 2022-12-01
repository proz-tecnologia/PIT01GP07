import 'package:flutter/widgets.dart';
import 'sign_up_model.dart';
import 'sign_up_repository.dart';
import 'sign_up_states.dart';

class SignUpController extends ValueNotifier<SignUpState> {
  SignUpRepository repository = SignUpRepository();

  SignUpController(this.repository) : super(SignUpInitialState());

  Future<void> addUser(SignUpModel userModel) async {
    if (await repository.saveUser(userModel)) {
      value = SignUpSuccessState(message: "Usuário cadastrado com sucesso!");
    } else {
      value = SignUpErrorState(message: 'O usuário já está cadastrado!');
    }
  }
}

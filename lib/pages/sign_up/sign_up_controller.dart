import 'package:flutter/widgets.dart';
import 'sign_up_model.dart';
import 'sign_up_repository.dart';
import 'sign_up_states.dart';

class SignUpController extends ValueNotifier<SignUpState> {
  SignUpRepository repository = SignUpRepository();

  SignUpController(this.repository) : super(SignUpInitialState());

  Future<void> addUser(SignUpModel userModel) async {
    String addUser = await repository.saveUser(userModel);
    if (addUser == 'Success') {
      value = SignUpSuccessState(message: "Usuário cadastrado com sucesso!");
    } else if (addUser == 'The account already exists for that email.') {
      value = SignUpErrorState(message: 'O usuário já está cadastrado!');
    } else {
      value = SignUpErrorState(message: 'Erro no servidor!');
    }
  }
}

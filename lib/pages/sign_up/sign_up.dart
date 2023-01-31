import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/default_button.dart';
import 'sign_up_controller.dart';
import 'sign_up_model.dart';
import 'sign_up_repository.dart';
import 'sign_up_states.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpController controller = SignUpController(
      SignUpRepository(FirebaseAuth.instance, FirebaseFirestore.instance));
  final _formKey = GlobalKey<FormState>();
  Icon icon = const Icon(Icons.visibility);
  Icon icon2 = const Icon(Icons.visibility);
  bool obscure = true;
  bool obscure2 = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassowrdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.value is SignUpErrorState) {
        final errorState = controller.value as SignUpErrorState;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            behavior: SnackBarBehavior.floating,
            content: Text(errorState.message),
          ),
        );
      } else if (controller.value is SignUpSuccessState) {
        nameController.text = '';
        emailController.text = '';
        passwordController.text = '';
        confirmPassowrdController.text = '';
        final errorState = controller.value as SignUpSuccessState;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            behavior: SnackBarBehavior.floating,
            content: Text(errorState.message),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.primary,
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        ' Cadastre-se',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 100,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nome obrigatório';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Nome',
                        suffixIcon: Icon(Icons.account_box),
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'E-mail obrigatório';
                        } else if (EmailValidator.validate(value) == false) {
                          return 'Insira um e-mail válido';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Digite seu e-mail',
                        suffixIcon: Icon(Icons.email),
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: obscure,
                      decoration: InputDecoration(
                        hintText: 'Digite sua senha',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (obscure) {
                                icon = const Icon(Icons.visibility_off);
                                obscure = false;
                              } else {
                                icon = const Icon(Icons.visibility);
                                obscure = true;
                              }
                            });
                          },
                          icon: icon,
                        ),
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: confirmPassowrdController,
                      validator: (value) {
                        if (value != passwordController.text) {
                          return 'Você deve repetir a senha para confirmação';
                        }
                        return null;
                      },
                      obscureText: obscure2,
                      decoration: InputDecoration(
                        hintText: 'Digite sua senha',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (obscure2) {
                                icon2 = const Icon(Icons.visibility_off);
                                obscure2 = false;
                              } else {
                                icon2 = const Icon(Icons.visibility);
                                obscure2 = true;
                              }
                            });
                          },
                          icon: icon2,
                        ),
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  DefaultButton(
                    title: "Cadastrar",
                    func: () {
                      register();
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      SignUpModel newUser = SignUpModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      controller.addUser(newUser);
    }
  }
}

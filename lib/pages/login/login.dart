import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/styleapp.dart';
import '../../widgets/default_button/default_button.dart';
import '../../widgets/login_with/login_with.dart';
import '../homescreen/homescreen.dart';
import '../recover/recover.dart';
import 'login_controller.dart';
import 'login_model.dart';
import 'login_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = LoginController.instance;
  final _formKey = GlobalKey<FormState>();
  Icon icon = const Icon(Icons.visibility);
  bool obscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.state is LoginErrorState) {
        final errorState = controller.state as LoginErrorState;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            behavior: SnackBarBehavior.floating,
            content: Text(errorState.message),
          ),
        );
      } else if (controller.state is LoginSuccessState) {
        final successState = controller.state as LoginSuccessState;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(
            name: successState.message,
          ),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackgroudColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    ' Olá!',
                    style: TextStyle(
                      fontSize: 36,
                      color: AppColors.backgroudColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
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
                  decoration: InputDecoration(
                    enabledBorder: StyleApp.outlinedBorder,
                    hintText: 'Digite seu e-mail',
                    suffixIcon: const Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, digite a senha!';
                    }
                    return null;
                  },
                  obscureText: obscure,
                  decoration: InputDecoration(
                    enabledBorder: StyleApp.outlinedBorder,
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const RecoverScreen(),
                        ));
                      },
                      child: const Text(
                        'Recuperar senha?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondtextColor,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              DefaultButton(
                title: "Entrar",
                func: () {
                  login();
                },
              ),
              const LoginWith(),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      LoginModel newUser = LoginModel(
        email: emailController.text,
        password: passwordController.text,
      );
      controller.validateUser(newUser);
    }
  }
}

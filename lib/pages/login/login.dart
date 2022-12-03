import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:teste/pages/login/login_repository.dart';

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
  LoginController controller = LoginController(LoginRepository());
  final _formKey = GlobalKey<FormState>();
  Icon icon = const Icon(Icons.visibility);
  bool obscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.value is LoginErrorState) {
        final errorState = controller.value as LoginErrorState;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            behavior: SnackBarBehavior.floating,
            content: Text(errorState.message),
          ),
        );
      } else if (controller.value is LoginSuccessState) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            behavior: SnackBarBehavior.floating,
            content: Text(controller.toString()),
          ),
        );
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
                  SizedBox(width: 16),
                  Text(
                    ' Olá!',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 36,
                      color: AppColors.backgroudColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  cursorColor: AppColors.focusTextFormFieldColor,
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
                    enabledBorder: StyleApp.outlineTextField,
                    focusColor: AppColors.focusTextFormFieldColor,
                    border: StyleApp.outlineTextField,
                    focusedBorder: StyleApp.focusTextField,
                    hintText: 'Digite seu e-mail',
                    suffixIcon: const Icon(Icons.email),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.secondtextColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                  cursorColor: AppColors.focusTextFormFieldColor,
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, digite a senha!';
                    }
                    return null;
                  },
                  obscureText: obscure,
                  decoration: InputDecoration(
                    enabledBorder: StyleApp.outlineTextField,
                    focusColor: AppColors.focusTextFormFieldColor,
                    border: StyleApp.outlineTextField,
                    focusedBorder: StyleApp.focusTextField,
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
                padding: const EdgeInsets.only(top: 8, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RecoverScreen()),
                        );
                      },
                      child: const Text(
                        'Recuperar senha?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondtextColor,
                            fontSize: 14),
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

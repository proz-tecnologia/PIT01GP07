import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teste/pages/login/login_repository.dart';
import '../../widgets/default_button.dart';
import 'login_widgets/login_with.dart';
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
  LoginController controller =
      LoginController(LoginRepository(FirebaseAuth.instance));
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
                      color: Color(0xff5CB3B9),
                      fontSize: 60,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
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
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
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
                  style: Theme.of(context).textTheme.bodyText1,
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
                      child: Text(
                        'Recuperar senha?',
                        style: Theme.of(context).textTheme.overline,
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

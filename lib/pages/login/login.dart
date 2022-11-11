import 'package:flutter/material.dart';
import 'package:teste/design_system/colors.dart';
import 'package:teste/design_system/styleapp.dart';
import 'package:teste/pages/homescreen/homescreen.dart';
import 'package:teste/widgets/default_button/default_button.dart';

import '../../widgets/login_with/login_with.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  Icon icon = const Icon(Icons.visibility);
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackgroudColor,
      body: SingleChildScrollView(
        child: Form(
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
                      color: AppColors.secondtextColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'E-mail obrigatório';
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
                  validator: (value) {
                    if (value != '123456') {
                      return 'Senha incorreta, utilize a senha 123456';
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
                      onTap: () {},
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
                  entrar();
                },
              ),
              const LoginWith(),
            ],
          ),
        ),
      ),
    );
  }

  void entrar() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => const HomeScreen(),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:teste/design_system/colors.dart';
import 'package:teste/widgets/default_button/default_button.dart';

import '../../design_system/styleapp.dart';
import '../../widgets/login_with/login_with.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  Icon icon = const Icon(Icons.visibility);
  Icon icon2 = const Icon(Icons.visibility);
  bool obscure = true;
  bool obscure2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondBackgroudColor,
        appBar: AppBar(
          backgroundColor: AppColors.secondBackgroudColor,
          iconTheme: const IconThemeData(color: AppColors.secondtextColor),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      ' Cadastre-se',
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.secondtextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logotipo.png',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nome obrigatório';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: StyleApp.outlinedBorder,
                      hintText: 'Nome',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                  padding: const EdgeInsets.all(8.0),
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
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value != '123456') {
                        return 'Senha incorreta, utilize a senha 123456';
                      }
                      return null;
                    },
                    obscureText: obscure2,
                    decoration: InputDecoration(
                      enabledBorder: StyleApp.outlinedBorder,
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
                  ),
                ),
                DefaultButton(
                  title: "Cadastrar",
                  func: () {
                    cadastrar();
                  },
                ),
              ],
            ),
          ),
        ));
  }

  void cadastrar() {
    Navigator.pop(context);
  }
}

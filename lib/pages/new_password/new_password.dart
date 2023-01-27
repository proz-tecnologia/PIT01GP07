import 'package:flutter/material.dart';
import '../../widgets/default_button.dart';
import '../login/login.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPassword();
}

class _NewPassword extends State<NewPassword> {
  bool hidePassword = true;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nova senha',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Sua identidade foi verificada. Digite sua nova senha , por favor.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 36),
              SizedBox(
                child: TextFormField(
                  controller: _passwordController,
                  onChanged: (value) {},
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    counterText: " ",
                    suffixIcon: IconButton(
                      icon: hidePassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        setState(
                          () {
                            hidePassword = !hidePassword;
                          },
                        );
                      },
                    ),
                    hintText: 'Digite nova senha',
                  ),
                  validator: (senha) {
                    if (senha == null || senha.isEmpty) {
                      return 'Campo não pode ficar vazio';
                    } else if (senha.length < 6) {
                      return 'Senha deve ter ao menos 6 dígitos';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                child: TextFormField(
                  controller: _confirmPasswordController,
                  onChanged: (value) {},
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    counterText: " ",
                    suffixIcon: IconButton(
                      icon: hidePassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        setState(
                          () {
                            hidePassword = !hidePassword;
                          },
                        );
                      },
                    ),
                    hintText: 'Confirme nova senha',
                  ),
                  validator: (senha2) {
                    if (senha2 == null || senha2.isEmpty) {
                      return 'Campo não pode ficar vazio';
                    } else if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      return 'Senhas não são iguais';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              DefaultButton(
                title: 'Confirmar',
                func: () {
                  if (_formKey.currentState!.validate()) {}
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
              ),
              const SizedBox(height: 36),
              const Expanded(
                child: Image(
                  image: AssetImage("assets/images/background/password.png"),
                  alignment: Alignment.bottomRight,
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

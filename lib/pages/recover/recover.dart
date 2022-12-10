import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../widgets/default_button/default_button.dart';
import '../../widgets/dialog_box/custom_dialog_box.dart';
import '../email_confirmation/email_confirmation.dart';

class RecoverScreen extends StatefulWidget {
  const RecoverScreen({super.key});

  @override
  State<RecoverScreen> createState() => _RecoverScreen();
}

class _RecoverScreen extends State<RecoverScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
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
                  'Recuperar senha',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Por favor, informe seu email cadastrado para que uma nova senha seja criada.',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      counterText: " ",
                      hintText: 'Digite seu e-mail',
                      suffixIcon: Icon(Icons.email),
                    ),
                    style: Theme.of(context).textTheme.bodyText1,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'E-mail obrigatório';
                      } else if (EmailValidator.validate(email) == false) {
                        return 'Email inválido';
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 24),
              DefaultButton(
                title: "Próximo",
                func: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmailConfirmation()),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),
              DefaultButton(
                title: "MENSAGEM DE ERRO",
                func: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialogBox(
                        title: "Oops!",
                        descriptions:
                            "Não conseguimos identificar esse endereço de e-mail, mas você pode tentar de novo. ",
                        text: "Tentar de novo",
                        img: Image.asset('assets/images/background/erro.png'),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              const Expanded(
                child: Image(
                  image: AssetImage(
                      "assets/images/background/forgot_password.png"),
                  alignment: Alignment.bottomLeft,
                ),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

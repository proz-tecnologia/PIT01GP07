import 'package:flutter/material.dart';
import 'package:teste/design_system/styleapp.dart';
import '../../design_system/colors.dart';
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
      backgroundColor: AppColors.secondBackgroudColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.secondBackgroudColor,
        iconTheme: const IconThemeData(color: AppColors.backgroudColor),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 32),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recuperar senha',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: AppColors.backgroudColor,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Por favor, informe seu email cadastrado para que uma nova senha seja criada.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.backgroudColor,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: TextFormField(
                    controller: _emailController,
                    cursorColor: AppColors.focusTextFormFieldColor,
                    decoration: InputDecoration(
                      counterText: " ",
                      focusColor: AppColors.focusTextFormFieldColor,
                      border: StyleApp.outlineTextField,
                      focusedBorder: StyleApp.focusTextField,
                      hintText: 'Digite seu e-mail',
                      suffixIcon: const Icon(Icons.email),
                      labelStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color:
                            AppColors.focusTextFormFieldColor.withOpacity(0.5),
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.secondtextColor,
                    ),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'E-mail obrigatório';
                      } else if (!email.contains("@")) {
                        return 'Email inválido';
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmailConfirmation()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 48),
                    backgroundColor: AppColors.backgroudColor),
                child: const Text(
                  'Próximo',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.secondBackgroudColor,
                  ),
                ),
              ),
              const SizedBox(height: 96),
              ElevatedButton(
                onPressed: () {
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
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 48),
                    backgroundColor: AppColors.backgroudColor),
                child: const Text(
                  'MENSAGEM DE ERRO',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.secondBackgroudColor,
                  ),
                ),
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

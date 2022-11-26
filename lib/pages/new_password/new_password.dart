import 'package:flutter/material.dart';
import 'package:teste/design_system/colors.dart';

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
      backgroundColor: AppColors.secondBackgroudColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key:_formKey,
          child: Column(
          children: <Widget>[
            const SizedBox(height: 32),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nova senha',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  color: Color(0xFF539CA1),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Sua identidade foi verificada. Digite sua nova senha , por favor.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xFF539CA1),
              ),
            ),
            const SizedBox(height: 36),
            SizedBox(
              child: TextFormField(
                controller: _passwordController,
                onChanged: (value) {
                  print(value);
                },
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF2F595B),
                ),
                obscureText: hidePassword,
                cursorColor: const Color(0xFF539CA1),
                decoration: InputDecoration(
                  counterText:" ",
                  suffixIcon: IconButton(
                    disabledColor: const Color(0xFF2F595B),
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
                  focusColor: const Color(0xFF539CA1),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                        color: const Color(0xFF539CA1).withOpacity(0.4),
                        width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFF539CA1), width: 2),
                  ),
                  labelText: 'Digite nova senha',
                  labelStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color(0xFF539CA1).withOpacity(0.5),
                  ),
                ),
                validator:(senha) {
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
                controller:_confirmPasswordController,
                onChanged: (value) {
                  print(value);
                },
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF2F595B),
                ),
                obscureText: hidePassword,
                cursorColor: const Color(0xFF539CA1),
                decoration: InputDecoration(
                  counterText:" ",
                  suffixIcon: IconButton(
                    disabledColor: const Color(0xFF2F595B),
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
                  focusColor: const Color(0xFF539CA1),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                        color: const Color(0xFF539CA1).withOpacity(0.4),
                        width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFF539CA1), width: 2),
                  ),
                  labelText: 'Confirme nova senha',
                  labelStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color(0xFF539CA1).withOpacity(0.5),
                  ),
                ),
                validator:(senha2) {
                  if (senha2 == null || senha2.isEmpty) {
                    return 'Campo não pode ficar vazio';
                  } else if (_passwordController.text != _confirmPasswordController.text) {
                    return 'Senhas não são iguais';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()){}
                Navigator.push(context,MaterialPageRoute(builder:
                    (context)=> const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 48),
                  backgroundColor: const Color(0xFF539CA1)),
              child: const Text(
                'Confirmar',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Color(0xFFF6F6F6),
                ),
              ),
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

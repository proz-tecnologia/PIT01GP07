import 'package:flutter/material.dart';
import 'package:teste/design_system/colors.dart';
import '../email_confirmation/email_confirmation .dart';

class RecoverScreen extends StatefulWidget {
  const RecoverScreen({super.key});

  @override
  State<RecoverScreen> createState() => _RecoverScreen();
}

class _RecoverScreen extends State<RecoverScreen> {
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
              height: 52,
              child: TextField(
                cursorColor: AppColors.backgroudColor,
                decoration: InputDecoration(
                  focusColor: AppColors.backgroudColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                        color: const Color(0xFF539CA1).withOpacity(0.4),
                        width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: AppColors.backgroudColor, width: 2),
                  ),
                  labelText: 'Digite seu e-mail',
                  labelStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color(0xFF539CA1).withOpacity(0.5),
                  ),
                ),
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF2F595B),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
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
                  color: Color(0xFFF6F6F6),
                ),
              ),
            ),
            const SizedBox(height: 96),
            const Expanded(
              child: Image(
                image:
                    AssetImage("assets/images/background/forgot_password.png"),
                alignment: Alignment.bottomLeft,
              ),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

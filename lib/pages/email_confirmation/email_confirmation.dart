import 'package:flutter/material.dart';
import 'package:teste/design_system/colors.dart';

class EmailConfirmation extends StatefulWidget {
  const EmailConfirmation({super.key});

  @override
  State<EmailConfirmation> createState() => _EmailConfirmation();
}

class _EmailConfirmation extends State<EmailConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackgroudColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 56),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'E-mail enviado',
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
              'Verifique sua conta de e-mail para a finalizar a verificação. O link enviado irá lhe redirencionar para a criação de uma nova senha.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.backgroudColor,
              ),
            ),
            const SizedBox(height: 36),
            const Expanded(
              child: Image(
                image: AssetImage("assets/images/background/email.png"),
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 36),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 48),
                  backgroundColor: AppColors.backgroudColor),
              child: const Text(
                'Finalizar',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: AppColors.primarytextColor,
                ),
              ),
            ),
            const SizedBox(height: 96),
          ],
        ),
      ),
    );
  }
}

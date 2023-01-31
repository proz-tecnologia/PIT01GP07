import 'package:flutter/material.dart';
import '../../widgets/default_button.dart';
import '../password_updated.dart';

class EmailConfirmation extends StatefulWidget {
  const EmailConfirmation({super.key});

  @override
  State<EmailConfirmation> createState() => _EmailConfirmation();
}

class _EmailConfirmation extends State<EmailConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 84),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'E-mail enviado',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Verifique o link enviado para continuar o processo.',
              style: Theme.of(context).textTheme.titleMedium,
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
            DefaultButton(
              title: "Finalizar",
              func: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PasswordUpdate()),
                );
              },
            ),
            const SizedBox(height: 96),
          ],
        ),
      ),
    );
  }
}

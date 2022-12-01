import 'package:flutter/material.dart';
import '../../widgets/default_button/default_button.dart';

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
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color:Theme.of(context).colorScheme.primary,
          ),
          elevation: 0.0,
        ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 56),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'E-mail enviado',style:Theme.of(context).textTheme.headline4
                ),
              ),
             const SizedBox(height: 32),
             Text(
              'Verifique sua conta de e-mail para a finalizar a verificação. O link enviado irá lhe redirencionar para a criação de uma nova senha.',
              style:  Theme.of(context).textTheme.bodyText1,
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
              title: 'Finalizar',
              func: (){
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 96),
          ],
        ),
      ),
    );
  }
}

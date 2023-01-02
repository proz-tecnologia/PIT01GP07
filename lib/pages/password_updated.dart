import 'package:flutter/material.dart';
import 'package:teste/pages/login/login.dart';
import '../widgets/default_button.dart';

class PasswordUpdate extends StatefulWidget {
  const PasswordUpdate({super.key});

  @override
  State<PasswordUpdate> createState() => _PasswordUpdate();
}

class _PasswordUpdate extends State<PasswordUpdate> {
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
              child: Text('Senha atualizada',
                  style: Theme.of(context).textTheme.headline1),
            ),
            const SizedBox(height: 32),
            Text(
              'Sua nova senha foi definida e já pode ser atualizada.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 36),
            const Expanded(
              child: Image(
                image: AssetImage(
                    "assets/images/background/confirmed_password.png"),
              ),
            ),
            const SizedBox(height: 36),
            DefaultButton(
              title: 'Login',
              func: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
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

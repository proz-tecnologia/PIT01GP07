import 'package:flutter/material.dart';
import 'package:teste/pages/sign_up/sign_up.dart';


class LoginWith extends StatelessWidget {
  const LoginWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary,
                height: 1.5,
                width: MediaQuery.of(context).size.width * 0.32,
              ),
               Text(
                "Ou entrar com",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Container(
                color: Theme.of(context).colorScheme.primary,
                height: 1.5,
                width: MediaQuery.of(context).size.width * 0.32,
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/login_icons/facebook.png',
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/login_icons/google.png',
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                "Ainda não é cadastrado?",
                   style: Theme.of(context).textTheme.bodyText2,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const SignUp(),
                  ));
                },
                child: Text(
                  " Crie sua conta",
                  style:Theme.of(context).textTheme.caption,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

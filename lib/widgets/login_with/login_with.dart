import 'package:flutter/material.dart';
import 'package:teste/pages/sign_up/sign_up.dart';

import '../../design_system/colors.dart';

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
                color: AppColors.backgroudColor,
                height: 1.5,
                width: MediaQuery.of(context).size.width * 0.32,
              ),
              const Text(
                "Ou entrar com",
                style: TextStyle(
                  color: AppColors.secondtextColor,
                ),
              ),
              Container(
                color: AppColors.backgroudColor,
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
              const Text(
                "Ainda não é cadastrado?",
                style: TextStyle(color: AppColors.secondtextColor),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const SignUp(),
                  ));
                },
                child: const Text(
                  " Crie sua conta",
                  style: TextStyle(
                      color: AppColors.secondtextColor,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

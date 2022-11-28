import 'package:flutter/material.dart';

import '../../widgets/default_button/default_button.dart';
import '../homescreen/homescreen.dart';
import '../login/login.dart';
import 'splashscreeen_controller.dart';
import 'splashscreen_repository.dart';
import 'splashscreen_states.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController controller =
      SplashScreenController(SplashScreenRepository());

  @override
  void initState() {
    super.initState();
    controller.checkingLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder<SplashState>(
      valueListenable: controller,
      builder: ((context, value, child) {
        if (value is SplashScreenInitialState) {
          return Center(
            child: Image.asset('assets/images/logotipo.png'),
          );
        } else if (value is SplashScreenLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (value is SplashScreenNoUserLoggedState) {
          return nextPage(
              text: "Não há usuário logado. Por favor faça login",
              title: "LOGIN",
              func: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const LoginScreen(),
                ));
              });
        } else if (value is SplashScreenUserLoggedState) {
          return nextPage(
              text: 'Já há um usuário logado. Clique para continuar!',
              title: "Continuar",
              func: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ));
              });
        } else if (value is SplashScreenErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            behavior: SnackBarBehavior.floating,
            content: Text(value.message),
          ));
        }
        return const Center(
          child: Text("Tivemos um problema!"),
        );
      }),
    ));
  }

  Widget nextPage(
      {required String text, required String title, required Function func}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          DefaultButton(title: title, func: func),
        ],
      ),
    );
  }
}

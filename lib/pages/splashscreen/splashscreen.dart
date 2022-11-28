import 'package:flutter/material.dart';
import 'package:teste/pages/homescreen/homescreen.dart';
import 'package:teste/pages/login/login.dart';
import 'package:teste/pages/repository/repository.dart';
import 'package:teste/pages/splashscreen/splashscreeen_controller.dart';
import 'package:teste/pages/splashscreen/splashscreen_states.dart';
import 'package:teste/widgets/default_button/default_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController controller = SplashScreenController(AppRepository());

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
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Não há usuário logado. Por favor, faça login!"),
                DefaultButton(
                    title: "LOGIN",
                    func: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const LoginScreen(),
                      ));
                    }),
              ],
            ),
          );
        } else if (value is SplashScreenUserLoggedState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
          ));
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
}

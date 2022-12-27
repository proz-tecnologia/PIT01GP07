import 'package:flutter/material.dart';

import '../../widgets/default_button/default_button.dart';
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
    controller.addListener(() {
      if (controller.value is SplashScreenNoUserLoggedState) {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      } else if (controller.value is SplashScreenUserLoggedState) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    });
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
        } else if (value is SplashScreenErrorState) {
          return const Center(
            child: Text("Tivemos um problema!"),
          );
        }
        return const Center(
          child: Text(""),
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

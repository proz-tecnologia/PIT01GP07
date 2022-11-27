import 'package:flutter/material.dart';
import 'package:teste/pages/homescreen/homescreen.dart';
import 'package:teste/pages/login/login.dart';
import 'package:teste/pages/repository/repository.dart';
import 'package:teste/pages/splashscreen/splashscreeen_controller.dart';
import 'package:teste/pages/splashscreen/splashscreen_states.dart';

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
        } else if (value is SplashScreenLoginFalseState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen(),
          ));
        } else if (value is SplashScreenLoginTrueState) {
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
          child: Text("Não aconteceu nada!"),
        );
      }),
    ));
  }
}

/*class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: ValueListenableBuilder<SplashState>(
      valueListenable: controller,
      builder: ((_, value, child) {
        if (value is SplashScreenInitialState) {
          return Center(
            child: Image.asset('assets/images/logotipo.png'),
          );
        } else if (value is SplashScreenLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (value is SplashScreenLoginFalseState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen(),
          ));
        } else if (value is SplashScreenLoginTrueState) {
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
          child: Text("Não aconteceu nada!"),
        );
      }),
    ));
  }
}*/
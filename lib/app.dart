import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teste/pages/email_confirmation/email_confirmation.dart';
import 'package:teste/pages/homescreen/homescreen.dart';
import 'package:teste/pages/login/login.dart';
import 'package:teste/pages/new_password/new_password.dart';
import 'package:teste/pages/recover/recover.dart';
import 'package:teste/pages/sign_up/sign_up.dart';
import 'design_system/light_theme.dart';
import 'pages/splashscreen/splashscreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const SplashScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/signup': (context) => const SignUp(),
        '/newpassword': (context) => const NewPassword(),
        '/recover': (context) => const RecoverScreen(),
        '/emailconfirmation': (context) => const EmailConfirmation()
      },
    );
  }
}

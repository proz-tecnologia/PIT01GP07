import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'design_system/light_theme.dart';
import 'pages/splashscreen/splashscreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates:const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [ Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      theme:lightTheme,
      home: const SplashScreen(),
    );
  }
}

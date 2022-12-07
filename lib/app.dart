import 'package:flutter/material.dart';
import 'design_system/light_theme.dart';
import 'pages/splashscreen/splashscreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:lightTheme,
      home: const SplashScreen(),
    );
  }
}

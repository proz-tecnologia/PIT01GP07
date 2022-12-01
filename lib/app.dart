import 'package:flutter/material.dart';
import 'package:teste/pages/login/login.dart';

import 'package:teste/pages/repository/repository.dart';
import 'design_system/constants.dart';
import 'design_system/theme_manager.dart';
import 'pages/splashscreen/splashscreen.dart';

ThemeManager _themeManager = ThemeManager();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: const SplashScreen(),
    );
  }
}

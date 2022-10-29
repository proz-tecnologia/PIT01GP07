import 'package:flutter/material.dart';

import 'pages/splashscreen/splashscreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff5cb3b9),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xff3b3d53)),
        )),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff5cb3b9)),
      ),
      home: const SplashScreen(),
    );
  }
}

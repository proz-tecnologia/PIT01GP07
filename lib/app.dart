import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'design_system/colors.dart';
import 'pages/splashscreen/splashscreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: AppColors.primaryIconColor,
        ),
        textTheme: GoogleFonts.inderTextTheme(),
        scaffoldBackgroundColor: AppColors.backgroudColor,
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

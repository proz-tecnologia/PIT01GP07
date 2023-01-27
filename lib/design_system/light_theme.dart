import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(

    ///COLOR SCHEME
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xfff6f6f6),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff5CB3B9),
      secondary: Color(0xfff6f6f6),
      tertiary: Color(0xff2F595B),
      surface: Colors.white,
    ),

    /// TEXT THEME
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xff539CA1),
        fontSize: 42,
        fontWeight: FontWeight.w300,
      ),
      displayMedium: TextStyle(
        color: Color(0xff2F595B),
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        color: Color(0xfff6f6f6),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        color: Color(0xff2F595B),
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: Color(0xff539CA1),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: Color(0xff2F595B),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0xff2F595B),
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        color: Color(0xff2F595B),
        fontWeight: FontWeight.bold,
        letterSpacing: 0.1,
      ),
    ),

    ///TEXT FIELD
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(width: 2.0),
    )));

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(

  ///COLOR SCHEME
  brightness:Brightness.light,
    scaffoldBackgroundColor: const Color(0xfff6f6f6),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff32847a),
  ),

  /// TEXT THEME
    textTheme: const TextTheme(

    headline2: TextStyle (
      color: Color(0xff32847a),
    ),

    headline4: TextStyle (
        color: Color(0xff32847a),
      ),

      bodyText1: TextStyle (
        color: Color(0xff32847a),
      ),

      bodyText2: TextStyle (
        color: Color(0xff32847a),
      ),
      caption: TextStyle (
        color: Color(0xff2F595B),
        fontWeight: FontWeight.w500,
        fontSize:14,
      ),

      button: TextStyle (
        color: Color(0xfff6f6f6),
        fontWeight: FontWeight.w400,
        fontSize:24,
      ),

    ),

  ///TEXT FIELD
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.0),
        borderSide: const BorderSide(width: 2.0),
    )
  )


);

ThemeData darkTheme = ThemeData(
    brightness:Brightness.dark
);


class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

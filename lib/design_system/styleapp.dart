import 'package:flutter/material.dart';

class StyleApp {
  StyleApp._();
  static final boxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 2,
  );
  static const borderRadius = Radius.circular(20.0);
  static BorderRadius buttonBorderRadius = BorderRadius.circular(10.0);
  static OutlineInputBorder outlinedBorder = OutlineInputBorder(
    borderRadius: StyleApp.buttonBorderRadius,
    borderSide: const BorderSide(
      width: 2.0,
    ),
  );

  static OutlineInputBorder outlineTextField = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(
      width: 2,
    ),
  );

  static OutlineInputBorder focusTextField = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(width: 2),
  );

  static const titleCardStyle = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      fontSize: 18);
}

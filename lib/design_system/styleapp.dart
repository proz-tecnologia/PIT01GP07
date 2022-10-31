import 'package:flutter/material.dart';
import 'package:teste/design_system/colors.dart';

class StyleApp {
  StyleApp._();
  static final boxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 2,
  );
  static const borderRadius = Radius.circular(10.0);

  static const titleCardStyle = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      color: AppColors.secondtextColor,
      fontSize: 18);
}

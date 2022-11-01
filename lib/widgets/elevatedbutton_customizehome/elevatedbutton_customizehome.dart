import 'package:flutter/material.dart';
import '../../design_system/colors.dart';

Widget customizehomebutton() {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16),
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: AppColors.revertBackgroundColor,
        foregroundColor: AppColors.secondtextColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(
            Icons.dashboard_customize,
            color: AppColors.secondtextColor,
          ),
          Text(
            "Customizar tela inicial",
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.secondtextColor,
            ),
          ),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import '../../design_system/colors.dart';

Widget seemorebutton({
  required String text,
}) {
  return Container(
    alignment: Alignment.bottomRight,
    color: Colors.transparent,
    child: TextButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: AppColors.secondtextColor,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: AppColors.secondtextColor,
          )
        ],
      ),
    ),
  );
}

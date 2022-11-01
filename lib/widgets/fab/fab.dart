import 'package:flutter/material.dart';

import '../../design_system/colors.dart';

Widget fab({
  required Icon icon,
}) {
  return SizedBox(
    height: 56,
    width: 56,
    child: FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppColors.secondtextColor,
      foregroundColor: AppColors.secondBackgroudColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: icon,
    ),
  );
}

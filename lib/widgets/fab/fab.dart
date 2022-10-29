import 'package:flutter/material.dart';

Widget fab ({
  required Icon icon,
}) {
  return SizedBox(
    height: 56,
    width: 56,
    child: FloatingActionButton(
      onPressed: () {},
      backgroundColor: const Color (0xFF2F595B),
      foregroundColor: const Color (0XFFF6F6F6),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
      child: icon,
    ),
  );
}
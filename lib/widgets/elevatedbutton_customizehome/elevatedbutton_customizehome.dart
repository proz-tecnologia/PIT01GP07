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
        backgroundColor: Colors.green,
        foregroundColor: Colors.green,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(
            Icons.dashboard_customize,
            color: Colors.green,
          ),
          Text(
            "Customizar tela inicial",
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.green,
            ),
          ),
        ],
      ),
    ),
  );
}

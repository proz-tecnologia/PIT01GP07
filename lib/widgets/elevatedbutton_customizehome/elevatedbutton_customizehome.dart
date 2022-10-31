import 'package:flutter/material.dart';

Widget customizehomebutton () {
  return Padding(
    padding: const EdgeInsets.only(left:16.0,right:16),
    child: ElevatedButton(
      onPressed: () {},
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(16.0),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10.0)
  ),
    backgroundColor: const Color (0XFFFFFFFF),
    foregroundColor: const Color (0xFF2F595B),),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              Icons.dashboard_customize,
              color:  Color (0xFF2F595B),
            ),
            Text(
              "Customizar tela inicial",
              style: TextStyle(
                fontFamily:'Inter',
                fontWeight:FontWeight.w700,
                fontSize: 16,
                color: Color (0xFF2F595B),
              ),
            ),
          ],
        ),
     ),
  );
}
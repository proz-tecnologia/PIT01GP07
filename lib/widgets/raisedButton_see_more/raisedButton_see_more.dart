import 'package:flutter/material.dart';

Widget seeMoreButton ({
  required String text,
}) {
  return  Container(
    alignment:Alignment.bottomRight,
    color: Colors.transparent,
    child: TextButton(
              onPressed: () {},
              child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontFamily:'Inter',
                    fontWeight:FontWeight.w700,
                    fontSize: 12,
                    color: Color (0xFF2F595B),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size:18,
                  color:  Color (0xFF2F595B),
                )
              ],
            ),
    ),
  );
}

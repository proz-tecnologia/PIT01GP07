import 'package:flutter/material.dart';
import 'package:teste/design_system/styleapp.dart';

import '../../design_system/colors.dart';

// ignore: must_be_immutable
class Expenses extends StatefulWidget {
  bool check;

  Expenses({
    Key? key,
    required this.check,
  }) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    if (widget.check) {
      return Container(
        width: double.infinity,
        height: 240,
        decoration: const BoxDecoration(
            color: AppColors.primarytextColor,
            borderRadius: BorderRadius.all(StyleApp.borderRadius)),
        child: const Text("Atrasadas"),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 240,
        decoration: const BoxDecoration(
            color: AppColors.primarytextColor,
            borderRadius: BorderRadius.all(StyleApp.borderRadius)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("Despesa 1"),
                Text("R\$10,00"),
                Text("Paga")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("Despesa 1"),
                Text("R\$10,00"),
                Text("Paga")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("Despesa 1"),
                Text("R\$10,00"),
                Text("Paga")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text("Ver tudo"),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.secondtextColor,
                ),
              ],
            )
          ],
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:teste/widgets/raisedButton_see_more/raisedbutton_see_more.dart';

import '../../design_system/colors.dart';
import '../../design_system/styleapp.dart';

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
          borderRadius: BorderRadius.only(
              bottomLeft: StyleApp.borderRadius,
              bottomRight: StyleApp.borderRadius,
              topRight: StyleApp.borderRadius),
        ),
        child: const Text("Atrasadas"),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 240,
        decoration: const BoxDecoration(
            color: AppColors.primarytextColor,
            borderRadius: BorderRadius.only(
                bottomLeft: StyleApp.borderRadius,
                bottomRight: StyleApp.borderRadius,
                topLeft: StyleApp.borderRadius)),
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
            seemorebutton(text: "Ver tudo")
          ],
        ),
      );
    }
  }
}

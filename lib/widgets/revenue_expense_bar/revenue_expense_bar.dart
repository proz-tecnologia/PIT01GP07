import 'package:flutter/material.dart';
import 'package:teste/design_system/styleapp.dart';

import '../../design_system/colors.dart';

class RevenueExpenseBar extends StatefulWidget {
  const RevenueExpenseBar({super.key});

  @override
  State<RevenueExpenseBar> createState() => _RevenueExpenseBarState();
}

class _RevenueExpenseBarState extends State<RevenueExpenseBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primarytextColor,
        borderRadius: BorderRadius.all(StyleApp.borderRadius),
      ),
      width: MediaQuery.of(context).size.width * 0.92,
      height: 40,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.arrow_circle_up,
                  color: AppColors.revenueColor,
                  size: 35,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Receita'),
                    Text('R\$ 250,00'),
                  ],
                )
              ],
            ),
            Container(
              color: AppColors.secondtextColor,
              width: 1.5,
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.arrow_circle_down,
                  color: AppColors.expenseColor,
                  size: 35,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Despesa'),
                    Text('R\$ 120,00'),
                  ],
                )
              ],
            )
          ]),
    );
  }
}

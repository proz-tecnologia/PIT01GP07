import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/styleapp.dart';

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
        color:  Colors.green,
        borderRadius: BorderRadius.all(StyleApp.borderRadius),
      ),
      width: MediaQuery.of(context).size.width * 0.92,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          children: [
            const Icon(
              Icons.arrow_circle_up,
              color:  Colors.green,
              size: 35,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Receita',
                  style: TextStyle(
                    color:  Colors.green,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'R\$ 250,00',
                  style: TextStyle(
                      color:  Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            )
          ],
        ),
        Container(
          color:  Colors.green,
          width: 1.5,
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.arrow_circle_down,
              color:  Colors.green,
              size: 35,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Despesa',
                  style: TextStyle(
                    color:  Colors.green,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'R\$ 120,00',
                  style: TextStyle(
                    color:  Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}

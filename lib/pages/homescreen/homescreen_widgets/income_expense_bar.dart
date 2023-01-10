import 'package:flutter/material.dart';
import 'package:teste/pages/homescreen/homescreen_controller.dart';

class IncomeExpenseBar extends StatefulWidget {
  const IncomeExpenseBar({super.key});

  @override
  State<IncomeExpenseBar> createState() => _IncomeExpenseBarState();
}

class _IncomeExpenseBarState extends State<IncomeExpenseBar> {
  HomeScreenController controller = HomeScreenController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      width: MediaQuery.of(context).size.width * 0.92,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          children: [
            const Icon(
              Icons.arrow_circle_up,
              color: Color(0xff32847a),
              size: 35,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Text(
                  'Receita',
                  style: TextStyle(
                    color: Color(0xff32847a),
                    fontSize: 14,
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: HomeScreenController.incomes,
                  builder: ((context, value, child) {
                    return Text(
                      'R\$ $value',
                      style: const TextStyle(
                          color: Color(0xff32847a),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    );
                  }),
                ),
              ],
            )
          ],
        ),
        Container(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
          width: 1.5,
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.arrow_circle_down,
              color: Color(0xffbf3131),
              size: 35,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Text(
                  'Despesa',
                  style: TextStyle(
                    color: Color(0xffbf3131),
                    fontSize: 14,
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: HomeScreenController.expenses,
                  builder: ((context, value, child) {
                    return Text(
                      'R\$ $value',
                      style: const TextStyle(
                        color: Color(0xffbf3131),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    );
                  }),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}

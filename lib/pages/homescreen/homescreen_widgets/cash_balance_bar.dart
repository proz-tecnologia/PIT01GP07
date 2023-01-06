import 'package:flutter/material.dart';
import 'package:teste/pages/homescreen/homescreen_controller.dart';

class CashBalanceBar extends StatefulWidget {
  const CashBalanceBar({super.key});

  @override
  State<CashBalanceBar> createState() => _CashBalanceBarState();
}

class _CashBalanceBarState extends State<CashBalanceBar> {
  HomeScreenController controller = HomeScreenController();
  bool obscure = true;
  Icon icon = const Icon(Icons.visibility_off);
  String textTemp = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saldo atual',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable: HomeScreenController.cashValue,
                    builder: (context, value, child) {
                      return Text(
                        'R\$ $value',
                        style: Theme.of(context).textTheme.headline3,
                      );
                    }),
              ],
            ),
          ),
          ValueListenableBuilder(
              valueListenable: controller.iconVisibility,
              builder: (context, value, child) {
                return IconButton(
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: controller.cashVisibility,
                    icon: controller.iconVisibility.value);
              }),
        ],
      ),
    );
  }
}
// setState(() {
//                   if (obscure) {
//                     icon = const Icon(Icons.visibility);
//                     obscure = false;
//                   } else {
//                     icon = const Icon(Icons.visibility_off);
//                     obscure = true;
//                   }
//                 });
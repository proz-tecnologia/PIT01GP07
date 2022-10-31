import 'package:flutter/material.dart';

import '../../design_system/colors.dart';

class CashBalanceBar extends StatefulWidget {
  const CashBalanceBar({super.key});

  @override
  State<CashBalanceBar> createState() => _CashBalanceBarState();
}

class _CashBalanceBarState extends State<CashBalanceBar> {
  bool obscure = true;
  Icon icon = const Icon(Icons.visibility_off);
  String balanceText = '130,00';
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
              children: [
                const Text(
                  'Saldo atual',
                  style: TextStyle(
                    color: AppColors.primarytextColor,
                  ),
                ),
                Text(
                  'R\$ $balanceText',
                  style: const TextStyle(
                    color: AppColors.primarytextColor,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  if (obscure) {
                    icon = const Icon(Icons.visibility);
                    obscure = false;
                    textTemp = balanceText;
                    balanceText = '*******';
                  } else {
                    icon = const Icon(Icons.visibility_off);
                    obscure = true;
                    balanceText = textTemp;
                  }
                });
              },
              icon: icon)
        ],
      ),
    );
  }
}

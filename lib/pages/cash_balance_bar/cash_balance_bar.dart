import 'package:flutter/material.dart';

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
                 Text(
                  'Saldo atual',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'R\$ $balanceText',
                  style: Theme.of(context).textTheme.headline3,
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

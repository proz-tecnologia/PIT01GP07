import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

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
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text('Saldo atual'),
              Text(
                'R\$ $balanceText',
              ),
            ],
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

import 'package:flutter/material.dart';
import '../options_tabs.dart';
import 'financial_tabs.dart';

class Financial extends StatefulWidget {
  const Financial({super.key});

  @override
  State<Financial> createState() => _FinancialState();
}
class _FinancialState extends State<Financial> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Meu Financeiro",
            style:Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 8),
          TabView(title1: 'Renda', title2: 'Despesas', content1: minhasRendas() , content2: minhasDespesas(), cardHeight: 200 ,)
        ],
      ),
    );

  }
}

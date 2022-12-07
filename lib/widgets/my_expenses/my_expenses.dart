import 'package:flutter/material.dart';
import '../options_tabs.dart';
import 'expenses_tabs.dart';

class MyExpensesCard extends StatefulWidget {
  const MyExpensesCard({
    Key? key,
  }) : super(key: key);

  @override
  State<MyExpensesCard> createState() => _MyExpensesCardState();
}

class _MyExpensesCardState extends State<MyExpensesCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Minhas Despesas",
            style:Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 8),
           TabView(title1: 'Atrasadas', title2: 'Em dia', content1: despesasAtrasadas() , content2: despesasEmDia(), cardHeight: 120 ,)
        ],
      ),
    );

  }
}
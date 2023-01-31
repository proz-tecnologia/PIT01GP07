import 'package:flutter/material.dart';

import '../options_tabs.dart';

class ExpensesIncomesCards extends StatefulWidget {
  final String cardtitle;
  final String firstTabTitle;
  final String secondTabTitle;
  final Widget firstTabContent;
  final Widget secondTabContent;
  final double cardHeight;

  const ExpensesIncomesCards({
    Key? key,
    required this.cardtitle,
    required this.firstTabTitle,
    required this.secondTabTitle,
    required this.firstTabContent,
    required this.secondTabContent,
    required this.cardHeight,
  }) : super(key: key);

  @override
  State<ExpensesIncomesCards> createState() => _ExpensesIncomesCardsState();
}

class _ExpensesIncomesCardsState extends State<ExpensesIncomesCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.cardtitle,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 8),
          TabView(
            firstTabtitle: widget.firstTabTitle,
            secondTabTitle: widget.secondTabTitle,
            firstTabContent: widget.firstTabContent,
            secondTabContent: widget.secondTabContent,
            cardHeight: widget.cardHeight,
          ),
        ],
      ),
    );
  }
}

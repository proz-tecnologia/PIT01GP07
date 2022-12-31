import 'package:flutter/material.dart';

import 'options_tabs.dart';

class TabCards extends StatefulWidget {
  final String cardtitle;
  final String firstTabTitle;
  final String secondTabTitle;
  final Widget firstTabContent;
  final Widget secondTabContent;
  final double cardHeight;

  const TabCards({
    Key? key,
    required this.cardtitle,
    required this.firstTabTitle,
    required this.secondTabTitle,
    required this.firstTabContent,
    required this.secondTabContent,
    required this.cardHeight,
  }) : super(key: key);

  @override
  State<TabCards> createState() => _TabCardsState();
}

class _TabCardsState extends State<TabCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.cardtitle,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 8),
          TabView(
            firstTabtitle: widget.firstTabTitle,
            secondTabTitle: widget.secondTabTitle,
            firstTabContent: widget.firstTabContent,
            secondTabContent: widget.secondTabContent,
            cardHeight: widget.cardHeight,
          )
        ],
      ),
    );
  }
}

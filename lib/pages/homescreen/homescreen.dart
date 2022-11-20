import 'package:flutter/material.dart';

import '../../widgets/bottom_bar/tab_bar.dart';
import '../../widgets/cards_container/cards_container.dart';
import '../../widgets/cash_balance_bar/cash_balance_bar.dart';
import '../../widgets/fab/fab.dart';
import '../../widgets/option_cards/options_cards.dart';
import '../../widgets/profile_bar/profilebar.dart';
import '../../widgets/revenue_expense_bar/revenue_expense_bar.dart';

class HomeScreen extends StatefulWidget {
  String name;
  HomeScreen({
    Key? key,
    this.name = '',
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16.0,
            ),
            ProfileBar(
              name: widget.name,
            ),
            const CashBalanceBar(),
            const RevenueExpenseBar(),
            const SizedBox(
              height: 16.0,
            ),
            const OptionsCards(),
            const SizedBox(
              height: 16.0,
            ),
            const CardsContainer(),
          ],
        ),
      ),
      floatingActionButton: fab(icon: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: TabBarWidget(
        index: index,
        onChangedTab: onChangedTab,
      ),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}

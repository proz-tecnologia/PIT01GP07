import 'package:flutter/material.dart';
import 'package:pit01gp07/widgets/cards_container/cards_container.dart';
import 'package:pit01gp07/widgets/revenue_expense_bar/revenue_expense_bar.dart';
import '../../widgets/bottom_bar/tabBar.dart';
import '../../widgets/card_credit_cards/card_credit_cards.dart';
import '../../widgets/elevatedbuttom_customizehome/elevatedbuttom_customizehome.dart';
import '../../widgets/fab/fab.dart';
import '../../widgets/option_cards/optionsCards.dart';
import '../../widgets/profile_bar/profilebar.dart';
import '../../widgets/cash_balance_bar/cash_balance_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
            const ProfileBar(),
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
             const CardCreditCards(),
            const CardsContainer(),
            customizehomebutton(),
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

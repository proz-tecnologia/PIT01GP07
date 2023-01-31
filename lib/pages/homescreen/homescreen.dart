import 'package:flutter/material.dart';
import 'homescreen_controller.dart';
import 'homescreen_widgets/tab_bar.dart';
import 'homescreen_widgets/cards_container/cards_container.dart';
import 'homescreen_widgets/cash_balance_bar/cash_balance_bar.dart';
import 'homescreen_widgets/fab.dart';
import 'homescreen_widgets/profilebar/profilebar_widgets/profilebar.dart';
import 'homescreen_widgets/income_expense_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController controller = HomeScreenController();

  @override
  void initState() {
    super.initState();
    controller.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: const [
          SizedBox(
            height: 16.0,
          ),
          ProfileBar(),
          CashBalanceBar(),
          IncomeExpenseBar(),
          SizedBox(
            height: 16.0,
          ),
          CardsContainer(),
        ],
      ),
      floatingActionButton: const Fab(icon: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: const TabBarWidget(),
    );
  }
}

import 'package:flutter/material.dart';
import 'homescreen_controller.dart';
import 'homescreen_widgets/tab_bar.dart';
import 'homescreen_widgets/cards_container_widgets/cards_container.dart';
import 'homescreen_widgets/cash_balance_bar.dart';
import 'homescreen_widgets/fab.dart';
import 'homescreen_widgets/navigation_drawer.dart';
import 'homescreen_widgets/options_cards.dart';
import 'homescreen_widgets/profilebar_widgets/profilebar.dart';
import 'homescreen_widgets/revenue_expense_bar.dart';

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
    controller.getUserName();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 16.0,
            ),
            ProfileBar(),
            CashBalanceBar(),
            RevenueExpenseBar(),
            SizedBox(
              height: 16.0,
            ),
            OptionsCards(),
            SizedBox(
              height: 16.0,
            ),
            CardsContainer(),
          ],
        ),
      ),
      floatingActionButton: const Fab(icon: Icon(Icons.add)),
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

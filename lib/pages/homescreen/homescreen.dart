import 'package:flutter/material.dart';
import 'package:pit01gp07/widgets/revenue_expense_bar/revenue_expense_bar.dart';

import '../../widgets/profile_bar/profilebar.dart';
import '../cash_balance_bar/cash_balance_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 16.0,
            ),
            ProfileBar(),
            CashBalanceBar(),
            RevenueExpenseBar()
          ],
        ),
      ),
    );
  }
}

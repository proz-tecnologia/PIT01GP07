import 'package:controle_gastos_prototipo/pages/cash_balance_bar/cash_balance_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CashBalanceBar(),
          ],
        ),
      ),
    );
  }
}

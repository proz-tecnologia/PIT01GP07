import 'package:flutter/material.dart';

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
          children: [
            const SizedBox(
              height: 16.0,
            ),
            const ProfileBar(),
            Container(
              color: const Color(0xff2f595b),
              height: 1.5,
              width: MediaQuery.of(context).size.width * 0.92,
            ),
            const CashBalanceBar(),
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste/pages/all_expenses/expense_item.dart';

import 'all_incomes_controller.dart';

class MyIncomes extends StatefulWidget {
  const MyIncomes({super.key});

  @override
  State<MyIncomes> createState() => _MyIncomesState();
}

class _MyIncomesState extends State<MyIncomes> {
  AllIncomesController controller = AllIncomesController();

  String formatDate(Timestamp timestamp) {
    final date =
        DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
    final formatedDate = DateFormat('dd/MM/yyyy').format(date);
    return formatedDate;
  }

  @override
  void initState() {
    super.initState();
    controller.getExpensesList();
  }

  @override
  void dispose() {
    super.dispose();
    controller.expenses.dispose();
    controller.state.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Minhas Receitas'),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.expenses,
        builder: (context, value, child) {
          return ListView(
            children: [
              for (int i = 0; i < value.length; i++)
                ExpenseItem(
                    description: value[i]['description'].toString(),
                    date: formatDate(value[i]['date']),
                    cashvalue: value[i]['cashvalue'].toString(),
                    categorie: value[i]['categorie'].toString(),
                    account: value[i]['account'].toString())
            ],
          );
        },
      ),
    );
  }
}

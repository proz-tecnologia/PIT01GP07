import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'expenses_card_controller.dart';
import 'expenses_card_states.dart';

class ShowFirstExpenses extends StatefulWidget {
  const ShowFirstExpenses({super.key});

  @override
  State<ShowFirstExpenses> createState() => _ShowFirstExpensesState();
}

class _ShowFirstExpensesState extends State<ShowFirstExpenses> {
  ExpensesCardController controller = ExpensesCardController();

  String formatDate(Timestamp timestamp) {
    final date =
        DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
    final formatedDate = DateFormat('dd/MM/yyyy').format(date);
    return formatedDate;
  }

  @override
  void initState() {
    super.initState();
    controller.setNewExpense();
  }

  @override
  void dispose() {
    super.dispose();
    controller.firstExpenses.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller.state,
        builder: ((context, value, child) {
          if (value is ExpensesCardInitialState) {
            return Container();
          } else if (value is ExpensesCardLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (value is ExpensesCardErrorState) {
            return const Center(
              child: Text('Tivemos um problema'),
            );
          } else if (value is ExpensesCardFirtAccessState) {
            return const Center(
              child: Text('Ainda não despesas cadastradas'),
            );
          } else {
            return ValueListenableBuilder(
                valueListenable: controller.firstExpenses,
                builder: ((context, value, child) {
                  return Column(children: [
                    for (int i = 0; i < value.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 4),
                        child: Row(children: [
                          const SizedBox(width: 16),
                          const Text(
                            'Despesa 1',
                            style: TextStyle(
                              color: Color(0xff2F595B),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 32),
                          Text(
                            'R\$ ${value[i]['cashvalue']}',
                            style: const TextStyle(
                              color: Color(0xff2F595B),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            formatDate(value[i]['date']),
                            style: const TextStyle(
                              color: Color(0xff2F595B),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 16),
                        ]),
                      ),
                  ]);
                }));
          }
        }));
  }
}

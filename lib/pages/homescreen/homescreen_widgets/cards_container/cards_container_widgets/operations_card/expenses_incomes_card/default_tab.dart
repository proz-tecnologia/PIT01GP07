import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../widgets/raisedbutton_see_more.dart';
import 'expenses_incomes_controller.dart';
import 'expenses_incomes_states.dart';

class DefaultTab extends StatefulWidget {
  final String tabState;
  const DefaultTab({super.key, required this.tabState});

  @override
  State<DefaultTab> createState() => _DefaultTabState();
}

class _DefaultTabState extends State<DefaultTab> {
  ExpensesIncomesCardController controller = ExpensesIncomesCardController();
  late String operation;

  String formatDate(Timestamp timestamp) {
    final date =
        DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
    final formatedDate = DateFormat('dd/MM/yyyy').format(date);
    return formatedDate;
  }

  @override
  void initState() {
    super.initState();
    if (widget.tabState == 'expense') {
      controller.getOperations('expense');
      operation = 'Despesa';
    } else if (widget.tabState == 'income') {
      controller.getOperations('income');
      operation = 'Receita';
    }
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
          if (value is ExpensesIncomesCardInitialState) {
            return Container();
          } else if (value is ExpensesIncomesCardLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (value is ExpensesIncomesCardErrorState) {
            return const Center(
              child: Text('Tivemos um problema'),
            );
          } else if (value is ExpensesIncomesCardFirtAccessState) {
            return const Center(
              child: Text('Ainda não há despesas cadastradas'),
            );
          } else {
            return ValueListenableBuilder(
                valueListenable: controller.firstExpenses,
                builder: ((context, value, child) {
                  return Column(children: [
                    for (int i = 0; i < value.length; i++)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, bottom: 4, right: 16),
                        child: Row(children: [
                          const SizedBox(width: 16),
                          Text(
                            '${value[i]['description']}',
                            style: const TextStyle(
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
                        ]),
                      ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: SeeMoreButton(
                          text: "Ver tudo",
                          page: () {
                            if (widget.tabState == 'expense') {
                              Navigator.of(context).pushNamed('/myoperations',
                                  arguments: {
                                    'operation': 'expense',
                                    'tabTitle': 'Despesas'
                                  });
                            } else if (widget.tabState == 'income') {
                              Navigator.of(context).pushNamed('/myoperations',
                                  arguments: {
                                    'operation': 'income',
                                    'tabTitle': 'Receitas'
                                  });
                            }
                          }),
                    ),
                  ]);
                }));
          }
        }));
  }
}

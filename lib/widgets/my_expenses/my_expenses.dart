// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:teste/design_system/styleapp.dart';

import '../../design_system/colors.dart';
import 'expenses_tabs.dart';

class MyExpensesCard extends StatefulWidget {
  const MyExpensesCard({super.key});

  @override
  State<MyExpensesCard> createState() => _MyExpensesCardState();
}

class _MyExpensesCardState extends State<MyExpensesCard> {
  bool expenseTime = false;
  Color patternColor = AppColors.primarytextColor;
  Color behindColor = AppColors.backgroudColor;
  Color primaryTextColor = AppColors.primarytextColor;
  Color secondTextColor = AppColors.secondtextColor;
  TextDecoration underline = TextDecoration.none;
  TextDecoration secunderline = TextDecoration.underline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Minhas Despesas",
            style: StyleApp.titleCardStyle,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 290,
            decoration: BoxDecoration(
              color: AppColors.secondBackgroudColor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                StyleApp.boxShadow,
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: behindColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          height: 50,
                          child: Text(
                            "Atrasadas",
                            style: TextStyle(
                                decoration: underline,
                                fontWeight: FontWeight.w700,
                                color: primaryTextColor,
                                fontSize: 18),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            patternColor = AppColors.backgroudColor;
                            behindColor = AppColors.primarytextColor;
                            primaryTextColor = AppColors.secondtextColor;
                            secondTextColor = AppColors.primarytextColor;
                            secunderline = TextDecoration.none;
                            underline = TextDecoration.underline;
                            expenseTime = true;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: patternColor,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                              )),
                          height: 50,
                          child: Text(
                            "Em dia",
                            style: TextStyle(
                                decoration: secunderline,
                                fontWeight: FontWeight.w700,
                                color: secondTextColor,
                                fontSize: 18),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            patternColor = AppColors.primarytextColor;
                            behindColor = AppColors.backgroudColor;
                            primaryTextColor = AppColors.primarytextColor;
                            secondTextColor = AppColors.secondtextColor;
                            underline = TextDecoration.none;
                            secunderline = TextDecoration.underline;
                            expenseTime = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Expenses(
                  check: expenseTime,
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

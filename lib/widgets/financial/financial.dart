// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/styleapp.dart';
import 'financial_tabs.dart';

class Financial extends StatefulWidget {
  const Financial({super.key});

  @override
  State<Financial> createState() => _FinancialState();
}

class _FinancialState extends State<Financial> {
  bool financialTime = false;
  Color patternColor = AppColors.primarytextColor;
  Color behindColor = AppColors.backgroudColor;
  Color primaryTextColor = AppColors.primarytextColor;
  Color secondTextColor = AppColors.secondtextColor;
  TextDecoration underline = TextDecoration.none;
  TextDecoration secunderline = TextDecoration.underline;
  Radius leftRadius = const Radius.circular(0.0);
  Radius rightRadius = const Radius.circular(20.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Financeiro",
            style: StyleApp.titleCardStyle,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 290,
            decoration: BoxDecoration(
              color: AppColors.backgroudColor,
              borderRadius: const BorderRadius.all(StyleApp.borderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  // changes position of shadow
                ),
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
                            borderRadius: BorderRadius.only(
                                bottomLeft: rightRadius,
                                bottomRight: rightRadius,
                                topRight: StyleApp.borderRadius,
                                topLeft: StyleApp.borderRadius),
                          ),
                          height: 50,
                          child: Text(
                            "Renda",
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
                            leftRadius = const Radius.circular(20.0);
                            rightRadius = const Radius.circular(0.0);
                            financialTime = true;
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
                              borderRadius: BorderRadius.only(
                                  bottomRight: leftRadius,
                                  bottomLeft: leftRadius,
                                  topLeft: StyleApp.borderRadius,
                                  topRight: StyleApp.borderRadius)),
                          height: 50,
                          child: Text(
                            "Despesas",
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
                            leftRadius = const Radius.circular(0.0);
                            rightRadius = const Radius.circular(20.0);
                            financialTime = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: FinancialTabs(
                  check: financialTime,
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

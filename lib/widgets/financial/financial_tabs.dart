import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/styleapp.dart';
import '../raisedButton_see_more/raisedbutton_see_more.dart';

// ignore: must_be_immutable
class FinancialTabs extends StatefulWidget {
  bool check;

  FinancialTabs({
    Key? key,
    required this.check,
  }) : super(key: key);

  @override
  State<FinancialTabs> createState() => _FinancialTabsState();
}

class _FinancialTabsState extends State<FinancialTabs> {
  @override
  Widget build(BuildContext context) {
    if (widget.check) {
      return Container(
        width: double.infinity,
        height: 240,
        decoration: const BoxDecoration(
          color: AppColors.primarytextColor,
          borderRadius: BorderRadius.only(
              bottomLeft: StyleApp.borderRadius,
              bottomRight: StyleApp.borderRadius,
              topRight: StyleApp.borderRadius),
        ),
        child: const Text("Renda"),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 240,
        decoration: const BoxDecoration(
            color: AppColors.primarytextColor,
            borderRadius: BorderRadius.only(
                bottomLeft: StyleApp.borderRadius,
                bottomRight: StyleApp.borderRadius,
                topLeft: StyleApp.borderRadius)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: AppColors.revenueColor,
                    ),
                    child: Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: AppColors.revenueColor),
                          ),
                        ),
                        const Text(
                          "Alugel",
                          style: TextStyle(
                              fontSize: 18, color: AppColors.secondtextColor),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.blue),
                          ),
                        ),
                        const Text(
                          "Alimentação",
                          style: TextStyle(
                              fontSize: 18, color: AppColors.secondtextColor),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.lightBlue),
                          ),
                        ),
                        const Text(
                          "Carro",
                          style: TextStyle(
                              fontSize: 18, color: AppColors.secondtextColor),
                        )
                      ],
                    ),
                  ],
                ))
              ],
            ),
            seemorebutton(text: "Categorias")
          ],
        ),
      );
    }
  }
}

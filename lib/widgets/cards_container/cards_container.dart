import 'package:flutter/material.dart';
import 'package:teste/widgets/financial/financial.dart';
import '../../design_system/styleapp.dart';
import '../card_account_info/card_account_info.dart';
import '../card_credit_cards/card_credit_cards.dart';
import '../elevatedbutton_customizehome/elevatedbutton_customizehome.dart';
import '../my_expenses/my_expenses.dart';

class CardsContainer extends StatefulWidget {
  const CardsContainer({super.key});

  @override
  State<CardsContainer> createState() => _CardsContainerState();
}

class _CardsContainerState extends State<CardsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:  BoxDecoration(
          color:  Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: StyleApp.borderRadius,
            topRight: StyleApp.borderRadius,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(
        height: 4.0),
         Center(
           child: Container(
              color:Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
              width: 50,
              height: 2.3,
            ),
         ),
          const SizedBox(
            height: 16.0,
          ),
          const MyExpensesCard(),
          const CardCreditCards(),
          const CardAccountInfo(),
          const Financial(),
          const CustomizeHomeButton(),
          const SizedBox(
            height: 96.0,
          ),
        ],
      ),
    );
  }
}

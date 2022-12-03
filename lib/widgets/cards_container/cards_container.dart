import 'package:flutter/widgets.dart';

import '../../design_system/colors.dart';
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
      decoration: const BoxDecoration(
          color: AppColors.secondBackgroudColor,
          borderRadius: BorderRadius.only(
            topLeft: StyleApp.borderRadius,
            topRight: StyleApp.borderRadius,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          const MyExpensesCard(),
          const CardCreditCards(),
          const CardAccountInfo(),
          const Financial(),
          customizehomebutton(),
          const SizedBox(
            height: 32.0,
          ),
        ],
      ),
    );
  }
}

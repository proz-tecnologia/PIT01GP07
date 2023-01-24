import 'package:flutter/material.dart';
import '../../../../design_system/styleapp.dart';
import 'cards_container_widgets/tab_cards_widgets/expenses_incomes_card/default_tab.dart';
import 'cards_container_widgets/tab_cards_widgets/expenses_incomes_card/tab_cards.dart';
import 'cards_container_widgets/my_credit_cards/card_credit_cards.dart';

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
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: StyleApp.borderRadius,
            topRight: StyleApp.borderRadius,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4.0),
          Center(
            child: Container(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
              width: 50,
              height: 2.3,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const TabCards(
            cardtitle: 'Minhas Despesas',
            firstTabTitle: 'Despesas',
            secondTabTitle: 'Receitas',
            firstTabContent: DefaultTab(
              tabState: 'expense',
            ),
            secondTabContent: DefaultTab(
              tabState: 'income',
            ),
            cardHeight: 160,
          ),
          const CardCreditCards(),
          const SizedBox(
            height: 96.0,
          ),
        ],
      ),
    );
  }
}

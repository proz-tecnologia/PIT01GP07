import 'package:flutter/material.dart';
import '../../../../design_system/styleapp.dart';
import 'cards_container_widgets/tab_cards_widgets/expenses_card/expenses_card.dart';
import 'cards_container_widgets/tab_cards_widgets/tab_cards.dart';
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
          TabCards(
            cardtitle: 'Minhas Despesas',
            firstTabTitle: 'Atrasadas',
            secondTabTitle: 'Em dia',
            firstTabContent: const ShowFirstExpenses(),
            secondTabContent: const ShowFirstExpenses(),
            cardHeight: 120,
            func: () {
              Navigator.pushNamed(context, '/myexpenses');
            },
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

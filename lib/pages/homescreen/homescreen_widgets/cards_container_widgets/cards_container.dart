import 'package:flutter/material.dart';
import 'package:teste/pages/homescreen/homescreen_widgets/tab_cards_widgets/tab_cards.dart';
import '../../../../design_system/styleapp.dart';
import 'card_account_widgets/card_account_info.dart';
import 'card_credit_cards_widgets/card_credit_cards.dart';
import 'elevatedbutton_customizehome.dart';
import '../tab_cards_widgets/financial_tabs.dart';
import '../tab_cards_widgets/expenses_tabs.dart';

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
            firstTabContent: despesasAtrasadas(),
            secondTabContent: despesasEmDia(),
            cardHeight: 120,
          ),
          const CardCreditCards(),
          const CardAccountInfo(),
          TabCards(
            cardtitle: 'Meu Financeiro',
            firstTabTitle: 'Renda',
            secondTabTitle: 'Despesas',
            firstTabContent: minhasRendas(),
            secondTabContent: minhasDespesas(),
            cardHeight: 200,
          ),
          const CustomizeHomeButton(),
          const SizedBox(
            height: 96.0,
          ),
        ],
      ),
    );
  }
}

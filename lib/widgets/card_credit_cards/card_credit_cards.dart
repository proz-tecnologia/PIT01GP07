import 'package:flutter/material.dart';
import '../../pages/my_credit_cards.dart';
import '../carousel/carousel.dart';
import '../raisedButton_see_more/raisedbutton_see_more.dart';
import '../../design_system/styleapp.dart';


class CardCreditCards extends StatefulWidget {
  const CardCreditCards({super.key});

  @override
  CardCreditCardsState createState() => CardCreditCardsState();
}

class CardCreditCardsState extends State<CardCreditCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text("Meus Cartões",
            style:Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.all(StyleApp.borderRadius,
              ),
              boxShadow: [
                StyleApp.boxShadow,
              ],
            ),
            child: Column(
              children:  [
                const SizedBox(height: 16),
                const CarrouselSlider(),
                SeeMoreButton(
                  text: "Ver fatura",
                  page: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyCreditCards()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

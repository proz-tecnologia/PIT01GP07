import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/styleapp.dart';
import '../carousel/carousel.dart';
import '../raisedButton_see_more/raisedbutton_see_more.dart';

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
          const Text("Meus Cartões", style: StyleApp.titleCardStyle),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.revertBackgroundColor,
              borderRadius: const BorderRadius.all(
                StyleApp.borderRadius,
              ),
              boxShadow: [
                StyleApp.boxShadow,
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const CarrouselSlider(),
                seemorebutton(text: "Ver fatura"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../carousel/carousel.dart';
import '../raisedButton_see_more/raisedButton_see_more.dart';

class CardCreditCards extends StatefulWidget{
  const CardCreditCards({super.key});

  @override
  CardCreditCardsState createState() => CardCreditCardsState();
}

class CardCreditCardsState extends State<CardCreditCards>{

  @override
  Widget build (BuildContext context){
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height:90),
          const Text("Meus Cartões",style: TextStyle (
              fontFamily:'Inter',
              fontWeight:FontWeight.w700,
              color: Color (0xFF2F595B),
              fontSize: 18)),
          const SizedBox(height:8),
          Container(
            height:324,
            width:double.infinity,
            decoration: const BoxDecoration(
              color:   Color (0XFFFFFFFF),
               borderRadius: BorderRadius.all(Radius.circular(10),
    ),
            ),
            child:Column(
              children:  [
                const SizedBox(height:16),
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
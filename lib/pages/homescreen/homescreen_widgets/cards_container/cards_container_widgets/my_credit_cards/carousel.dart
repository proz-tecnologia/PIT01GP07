import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'credit_cardsinfo.dart';

class CarrouselSlider extends StatefulWidget {
  const CarrouselSlider({super.key});

  @override
  CarrouselSliderState createState() => CarrouselSliderState();
}

class CarrouselSliderState extends State<CarrouselSlider> {
  final assetsImagesList = [
    "assets/images/credit_cards/digio.png",
    "assets/images/credit_cards/nubank.png",
    "assets/images/credit_cards/amedigital.png",
    "assets/images/credit_cards/fortbrasil.png"
  ];
  final dados = [
    const CreditCardInfo(
        nome: 'DIGIO', tipo: "Crédito", limite: 450, fatura: 200),
    const CreditCardInfo(
        nome: 'NUBANK', tipo: "Crédito", limite: 600, fatura: 230),
    const CreditCardInfo(
        nome: 'AME', tipo: "Crédito", limite: 651, fatura: 100),
    const CreditCardInfo(
        nome: 'FORTBRASIL', tipo: "Crédito", limite: 453, fatura: 450),
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
              height: 164,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              }),
          itemCount: assetsImagesList.length,
          itemBuilder: (context, index, realIndex) {
            final assetImage = assetsImagesList[index];
            return buildImage(assetImage, index);
          },
        ),
        buildIndicator(),
        const SizedBox(height: 24),
        buildTextBox(),
      ],
    ));
  }

  Widget buildImage(String assetImage, int index) => Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.transparent,
            child: Image.asset(assetImage, fit: BoxFit.cover),
          ),
        ],
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: assetsImagesList.length,
        effect: WormEffect(
          dotWidth: 8,
          dotHeight: 8,
          dotColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
          activeDotColor: Theme.of(context).colorScheme.tertiary,
        ),
      );

  Widget buildTextBox() => Column(
        children: [
          Container(
              width: double.infinity,
              color: Colors.transparent,
              child: dados[activeIndex]),
        ],
      );
}

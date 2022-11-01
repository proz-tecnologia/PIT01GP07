import 'package:flutter/material.dart';

import '../../design_system/colors.dart';

class OptionsCards extends StatefulWidget {
  const OptionsCards({super.key});

  @override
  State<OptionsCards> createState() => _OptionsCardsState();
}

class _OptionsCardsState extends State<OptionsCards> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        card(icon: const Icon(Icons.home), text: 'CHAVES PIX'),
        const SizedBox(width: 4),
        card(icon: const Icon(Icons.receipt_long), text: 'COMPROVANTES'),
        const SizedBox(width: 4),
        card(icon: const Icon(Icons.home), text: 'METAS'),
        const SizedBox(width: 4),
        card(icon: const Icon(Icons.calendar_month), text: 'CALENDÁRIO'),
      ],
    );
  }
}
/*Widget optionsCards () {
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
        children: [
          card(
              icon: const Icon(Icons.home),
              text:'CHAVES PIX'
          ),
          const SizedBox(width: 4),
          card(
              icon: const Icon(Icons.receipt_long),
              text:'COMPROVANTES'
          ),
          const SizedBox(width: 4),
          card(
              icon: const Icon(Icons.home),
              text:'METAS'
          ),
          const SizedBox(width: 4),
          card(
              icon: const Icon(Icons.calendar_month),
              text:'CALENDÁRIO'
          ),
        ],
      );

}*/

Widget card({
  required String text,
  required Icon icon,
}) {
  return SizedBox(
    width: 84,
    child: Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(70, 70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            backgroundColor: AppColors.secondBackgroudColor,
            foregroundColor: AppColors.secondtextColor,
          ),
          child: icon,
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: AppColors.secondBackgroudColor,
              fontSize: 10),
        ),
      ],
    ),
  );
}

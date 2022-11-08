import 'package:flutter/material.dart';
import '../../design_system/colors.dart';

Widget accountInfo({
  required String nome,
  required String tipo,
  required double saldo,
  required String assetImage,
}) {
  String meuSaldo= saldo.toStringAsFixed(2).replaceAll(".", ",");
  return Row(
    children: [
      const SizedBox(width: 16),
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          assetImage,
          height: 48,
          width: 48,
        ),
      ),
      const SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nome,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.secondtextColor,
            ),
          ),
          Text(
            tipo,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.secondtextColor,
            ),
          ),
        ],
      ),
      const SizedBox(width: 29),
      const Spacer(),
      Text(
        "R\$ $meuSaldo",
        style: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: AppColors.secondtextColor,
        ),
      ),
      const SizedBox(width: 16),
    ],
  );
}

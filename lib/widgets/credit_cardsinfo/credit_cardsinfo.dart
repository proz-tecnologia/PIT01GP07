import 'package:flutter/material.dart';

Widget creditcardInfo ({
  required String nome,
  required String tipo,
  required double limite,
  required double fatura,

})
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(width: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Cartão $nome",
            style: const TextStyle(
              fontFamily:'Inter',
              fontWeight:FontWeight.w700,
              fontSize: 16,
              color: Color (0xFF2F595B),
            ),
          ),
          Text(
            tipo,
            style: const TextStyle(
              fontFamily:'Inter',
              fontWeight:FontWeight.w500,
              fontSize: 16,
              color: Color (0xFF2F595B),
            ),
          ),
          const SizedBox(height:16),
          const Text(
            "Limite Disponível",
            style:  TextStyle(
              fontFamily:'Inter',
              fontWeight:FontWeight.w700,
              fontSize: 16,
              color: Color (0xFF2F595B),
            ),
          ),
          Text(
            "R\$ $limite",
            style: const  TextStyle(
              fontFamily:'Inter',
              fontWeight:FontWeight.w500,
              fontSize: 14,
              color: Color (0xFF2F595B),
            ),
          ),
        ],
      ),
      const SizedBox(width: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Text(
            "Fatura Aberta",
            style: TextStyle(
              fontFamily:'Inter',
              fontWeight:FontWeight.w700,
              fontSize: 16,
              color: Color (0xFF2F595B),
            ),
          ),
          Text(
          "R\$ $fatura",
            style: const TextStyle(
              fontFamily:'Inter',
              fontWeight:FontWeight.w500,
              fontSize: 20,
              color: Color (0xFF2F595B),
            ),
          ),
           const Text(
            "Vencimento em 10/10",
            style:  TextStyle(
              fontFamily:'Inter',
              fontWeight:FontWeight.w500,
              fontSize: 12,
              color: Color (0xFF2F595B),
            ),
          ),
        ],
      ),
    ],
  );}

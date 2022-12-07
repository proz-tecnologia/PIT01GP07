import 'package:flutter/material.dart';

class CreditCardInfo extends StatelessWidget {
  final String nome;
  final String tipo;
  final double limite;
  final double fatura;
  const CreditCardInfo(
      {super.key, required this.nome, required this.tipo, required this.limite, required this.fatura});

  @override
  Widget build(BuildContext context) {

    String meuLimite= limite.toStringAsFixed(2).replaceAll(".", ",");
    String minhaFatura= fatura.toStringAsFixed(2).replaceAll(".", ",");
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
            style:Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            tipo,
            style:Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 16),
           Text(
            "Limite Disponível",
             style:Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            "R\$ $meuLimite",
            style:Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
      const SizedBox(width: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Fatura Aberta",
             style:Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            "R\$ $minhaFatura",
            style:  TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 24,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
           Text(
            "Vencimento em 10/10",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      ),
    ],
  );
}}

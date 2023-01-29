import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  final String nome;
  final String tipo;
  final String saldo;
  final String assetImage;

  const AccountInfo(
      {super.key,
      required this.nome,
      required this.tipo,
      required this.saldo,
      required this.assetImage});

  @override
  Widget build(BuildContext context) {
    String meuSaldo = saldo.replaceAll(".", ",");

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
              tipo,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              nome,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        const Spacer(),
        Text(
          "R\$ $meuSaldo",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

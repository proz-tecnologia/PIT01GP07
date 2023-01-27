import 'package:flutter/material.dart';

class OperationItem extends StatefulWidget {
  final String description;
  final String date;
  final String cashvalue;
  final String categorie;
  final String account;

  const OperationItem(
      {super.key,
      required this.description,
      required this.date,
      required this.cashvalue,
      required this.categorie,
      required this.account});

  @override
  State<OperationItem> createState() => _OperationItemState();
}

class _OperationItemState extends State<OperationItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(
              widget.description,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Spacer(),
            Text(
              widget.date,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ]),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            'Conta: ${widget.account}',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            'Categoria: ${widget.categorie}',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(children: [
            Text(
              'R\$ ${widget.cashvalue}',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            const Spacer(),
            Text(
              'Pago',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ]),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

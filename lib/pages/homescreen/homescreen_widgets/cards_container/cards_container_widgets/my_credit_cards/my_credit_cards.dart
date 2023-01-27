import 'package:flutter/material.dart';

class MyCreditCards extends StatefulWidget {
  const MyCreditCards({super.key});

  @override
  State<MyCreditCards> createState() => _MyCreditCardsState();
}

class _MyCreditCardsState extends State<MyCreditCards> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Meus Cartões'),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.add,
              ),
              onPressed:(){}
          ),
        ],
      ),
    );
  }
}
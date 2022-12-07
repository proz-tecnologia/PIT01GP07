import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Fab extends StatelessWidget {

  final Icon icon;

  const Fab({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
  return SpeedDial(
      animatedIcon: AnimatedIcons.list_view,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.secondary,     
      buttonSize: const Size (56,56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      children:[
        SpeedDialChild(
          child: const Icon (Icons.arrow_downward, color: Colors.red),
          label:'Adicionar despesa',
          labelStyle:Theme.of(context).textTheme.caption,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        SpeedDialChild(
          child: const Icon (Icons.arrow_upward, color: Colors.green),
          label:'Nova receita',
          labelStyle:Theme.of(context).textTheme.caption,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        SpeedDialChild(
          child: const Icon (Icons.compare_arrows, color: Colors.blue),
          label:'Nova transferência',

          labelStyle:Theme.of(context).textTheme.caption,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ]
  );
}}

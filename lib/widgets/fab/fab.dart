import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

Widget fab({
  required Icon icon,
}) {
  return SpeedDial(
      animatedIcon: AnimatedIcons.list_view,
      backgroundColor:  Colors.green,
      buttonSize: const Size (56,56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      children:[
        SpeedDialChild(
          child: const Icon (Icons.arrow_downward, color: Colors.red),
          label:'Adicionar despesa',
          labelStyle: const TextStyle (color:  Colors.green),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        SpeedDialChild(
          child: const Icon (Icons.arrow_upward, color: Colors.green),
          label:'Nova receita',
          labelStyle: const TextStyle (color:  Colors.green),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        SpeedDialChild(
          child: const Icon (Icons.compare_arrows, color: Colors.blue),
          label:'Nova transferência',
          labelStyle: const TextStyle (color: Colors.green),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ]
  );
}

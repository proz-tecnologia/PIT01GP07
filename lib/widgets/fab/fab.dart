import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

Widget fab({
  required Icon icon,
}) {
  return SpeedDial(
      animatedIcon: AnimatedIcons.list_view,
      backgroundColor: AppColors.secondtextColor,
      buttonSize: const Size (56,56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      children:[
        SpeedDialChild(
          child: const Icon (Icons.arrow_downward, color: Colors.red),
          label:'Adicionar despesa',
          labelStyle: const TextStyle (color:AppColors.secondtextColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        SpeedDialChild(
          child: const Icon (Icons.arrow_upward, color: Colors.green),
          label:'Nova receita',
          labelStyle: const TextStyle (color:AppColors.secondtextColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        SpeedDialChild(
          child: const Icon (Icons.compare_arrows, color: Colors.blue),
          label:'Nova transferência',
          labelStyle: const TextStyle (color:AppColors.secondtextColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ]
  );
}

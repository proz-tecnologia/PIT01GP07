import 'package:flutter/material.dart';
import 'package:teste/design_system/colors.dart';
import 'package:teste/design_system/styleapp.dart';

// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  late String title;

  Function func;

  DefaultButton({Key? key, required this.title, required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        onPressed: () {
          func();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 50),
          backgroundColor: AppColors.backgroudColor,
          shape:
              RoundedRectangleBorder(borderRadius: StyleApp.buttonBorderRadius),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.primarytextColor,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

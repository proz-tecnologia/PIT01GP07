import 'package:flutter/material.dart';
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
          backgroundColor: Theme.of(context).colorScheme.primary,
        shape:
              RoundedRectangleBorder(borderRadius: StyleApp.buttonBorderRadius),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}

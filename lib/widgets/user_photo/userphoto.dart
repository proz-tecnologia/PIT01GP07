import 'package:flutter/widgets.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xfff39004),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../user_photo/userphoto.dart';

// ignore: must_be_immutable
class ProfileBar extends StatelessWidget {
  String name;
  ProfileBar({
    Key? key,
    this.name = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const UserPhoto(),
              Column(
                children: [
                  Text(
                    getTime(),
                    style: const TextStyle(color: AppColors.primarytextColor),
                  ),
                  Text(
                    name,
                    style: const TextStyle(color: AppColors.primarytextColor),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: AppColors.primarytextColor,
                ),
                onPressed: (() {}),
              ),
            ],
          ),
          Container(
            color: AppColors.secondtextColor,
            height: 1.5,
            width: MediaQuery.of(context).size.width * 0.92,
          ),
        ],
      ),
    );
  }
}

String getTime() {
  final now = DateTime.now().hour;
  if (now < 12) {
    return 'Bom dia';
  }
  if (now < 17) {
    return 'Boa tarde';
  }
  return 'Boa noite';
}

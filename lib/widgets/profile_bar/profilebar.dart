import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../user_photo/userphoto.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key});

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
                children: const [
                  Text(
                    'Bom dia, ',
                    style: TextStyle(color: AppColors.primarytextColor),
                  ),
                  Text(
                    'Usuário',
                    style: TextStyle(color: AppColors.primarytextColor),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Color(0xfff6f6f6),
                ),
                onPressed: (() {}),
              ),
            ],
          ),
          Container(
            color: const Color(0xff2f595b),
            height: 1.5,
            width: MediaQuery.of(context).size.width * 0.92,
          ),
        ],
      ),
    );
  }
}

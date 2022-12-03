import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../pages/homescreen/homescreen_controller.dart';
import '../user_photo/userphoto.dart';

class ProfileBar extends StatefulWidget {
  const ProfileBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  HomeScreenController controller = HomeScreenController();

  @override
  void initState() {
    super.initState();
    controller.getUserName();
  }

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
                  ValueListenableBuilder(
                    valueListenable: controller.userName,
                    builder: (context, value, child) {
                      return Text(
                        controller.userName.value,
                        style:
                            const TextStyle(color: AppColors.primarytextColor),
                      );
                    },
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

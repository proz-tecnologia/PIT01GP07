import 'package:flutter/material.dart';
import '../profilebar_controller.dart';
import 'userphoto.dart';

class ProfileBar extends StatefulWidget {
  const ProfileBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  ProfileBarController controller = ProfileBarController();

  @override
  void initState() {
    super.initState();
    controller.getUserName();
  }

  @override
  void dispose() {
    super.dispose();
    controller.userName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const UserPhoto(),//TODO Alterar foto profile
              ),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getTime(),
                    style: const TextStyle(
                      color: Color(0xfff6f6f6),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: controller.userName,
                    builder: (context, value, child) {
                      return Text(
                        controller.userName.value,
                        style: const TextStyle(
                          color: Color(0xfff6f6f6),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
              // IconButton(
              //   icon: Icon(
              //     Icons.notifications,
              //     color: Theme.of(context).colorScheme.secondary,
              //   ),
              //   onPressed: (() {}),
              // ),
            ],
          ),
          Container(
            color: Theme.of(context).colorScheme.tertiary,
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
    return 'Bom dia,';
  }
  if (now < 17) {
    return 'Boa tarde,';
  }
  return 'Boa noite,';
}

import 'package:flutter/material.dart';
import '../profilebar_controller.dart';


class ProfileBar extends StatefulWidget {
  const ProfileBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  ProfileBarController controller = ProfileBarController();

  Future<void> logout() async {
    bool? logout = await controller.logout();
    if (logout!) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed('/login');
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          behavior: SnackBarBehavior.floating,
          content: Text("Não é possivel fazer logout. Erro no Servidor!"),
        ),
      );
    }
  }

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
              const SizedBox(width: 16.0),
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
              IconButton(
                onPressed: logout,
                icon: Icon(
                  Icons.logout,
                  size: 32,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
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

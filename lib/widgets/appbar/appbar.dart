import 'package:flutter/material.dart';

import '../user_photo/userphoto.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          color: const Color(0xff2f595b),
          height: 1.5,
          width: MediaQuery.of(context).size.width * 0.92,
        ),
      ),
      leading: const UserPhoto(),
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const [
                Text('Bom dia, '),
                Text('Usuário'),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Color(0xfff6f6f6),
            ),
            onPressed: (() {}),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

import 'package:flutter/material.dart';
import '../../../design_system/styleapp.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: MediaQuery.of(context).size.height * .1,
      notchMargin: 4,
      shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: StyleApp.borderRadius,
                  topRight: StyleApp.borderRadius)),
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: StyleApp.borderRadius,
            bottomRight: StyleApp.borderRadius,
          ))),
      color: Theme.of(context).colorScheme.secondary,
      child: Row(
        children: [
          tabItem(
            icon: Icons.home,
            text: 'Início',
            route: '/home',
            active: true,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * .10),
          tabItem(
            icon: Icons.pix,
            text: 'Chaves pix',
            route: '/pix',
            active: false,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * .10),
          tabItem(
            icon: Icons.task_alt_outlined,
            text: 'Metas',
            route: '/metas',
            active: false,
          ),
        ],
      ),
    );
  }

  Widget tabItem({
    required String text,
    required IconData icon,
    required String route,
    required bool active,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 32,
              child: Icon(
                icon,
              ),
            ),
            Text(text,
                style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

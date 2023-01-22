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
            icon: const Icon(Icons.home),
            text: 'Início',
            route: '/home',
            active: true,
          ),
          tabItem(
            icon: const Icon(Icons.pix),
            text: 'Chaves pix',
            route: '/pix',
            active: false,
          ),
          tabItem(
            icon: const Icon(Icons.task_alt_outlined),
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
    required Icon icon,
    required String route,
    required bool active,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 32,
            child: IconButton(
              icon: icon,
              color: active
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
              onPressed: () {
                Navigator.of(context).pushNamed(route);
              },
            ),
          ),
          Text(text,
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: active
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
                  fontSize: 14)),
        ],
      ),
    );
  }
}

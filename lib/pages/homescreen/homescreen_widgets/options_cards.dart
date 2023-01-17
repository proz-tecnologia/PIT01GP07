import 'package:flutter/material.dart';

class OptionsCards extends StatefulWidget {
  const OptionsCards({super.key});

  @override
  State<OptionsCards> createState() => _OptionsCardsState();
}

class _OptionsCardsState extends State<OptionsCards> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Cards(
          icon: ImageIcon(
            AssetImage('assets/images/option_icons/pix.png'),
          ),
          text: 'CHAVES PIX',
          route: '/pix',
        ),
        SizedBox(width: 4),
        Cards(
          icon: ImageIcon(
            AssetImage('assets/images/option_icons/receipt.png'),
          ),
          text: 'COMPROVANTES',
          route: '/home',
        ),
        SizedBox(width: 4),
        Cards(
            icon: ImageIcon(
              AssetImage('assets/images/option_icons/target.png'),
            ),
            text: 'METAS',
            route: '/metas'),
        SizedBox(width: 4),
        Cards(
          icon: ImageIcon(
            AssetImage('assets/images/option_icons/calendar.png'),
          ),
          text: 'CALENDÁRIO',
          route: '/home',
        ),
      ],
    );
  }
}

class Cards extends StatelessWidget {
  final String text;
  final ImageIcon icon;
  final String? route;

  const Cards({super.key, required this.text, required this.icon, this.route});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(70, 70),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Theme.of(context).colorScheme.tertiary,
            ),
            child: icon,
            onPressed: () {
              Navigator.of(context).pushNamed(route!);
            },
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: 10),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SeeMoreButton extends StatelessWidget{
  final String text;
  Function page;
  const SeeMoreButton({super.key, required this.text, required this.page});
  @override
  Widget build (BuildContext context){

    return Container(
    alignment: Alignment.bottomRight,
    color: Colors.transparent,
    child: TextButton(
      onPressed: () {
        page();
      },
      child: Row(
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.overline,
          ),
           Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Theme.of(context).colorScheme.tertiary,
          )
        ],
      ),
    ),
  );
}}

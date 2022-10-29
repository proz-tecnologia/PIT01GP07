import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget{
   final int index;
   final ValueChanged<int> onChangedTab;

  const TabBarWidget({super.key, required this.index, required this.onChangedTab});

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
  }

class _TabBarWidgetState extends State<TabBarWidget>{
  @override
Widget build (BuildContext context){
    return  BottomAppBar(
        notchMargin:4,
        shape: const AutomaticNotchedShape(
               RoundedRectangleBorder(
                 borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(5),
                 topRight: Radius.circular(5))),
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                )
            )
        ),
        color:  const Color (0XFFF6F6F6),
        child: Row(
          children:  [
             tabItem(
              icon: const Icon(Icons.home),
              index: 0,
              text:'Início'
            ),
            tabItem(
                icon: const Icon(Icons.sync_alt),
                index: 1,
                text:'Transações'
            ),
            tabItem(
                icon: const Icon(Icons.analytics),
                index: 2,
                text:'Relatório'
            ),
          ],
        ),
    );
}

  Widget tabItem ({
    required String text,
    required Icon icon,
    required int index,
}) {
    final isSelected = index == widget.index;
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 32,

              child: IconButton(
                icon: icon,
                color: isSelected? const Color(0xFF2F595B):const Color(0xFF2F595B).withOpacity(0.5),
                onPressed: () => widget.onChangedTab(index),
                ),
            ),
          Text(text, style: TextStyle (
              fontFamily:'Inter',
              fontWeight:FontWeight.w500,
              color: isSelected? const Color(0xFF2F595B): const Color(0xFF2F595B).withOpacity(0.5),
              //const Color(0XFF92A7A8),
              fontSize: 14)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:teste/widgets/raisedButton_see_more/raisedbutton_see_more.dart';
import '../../design_system/styleapp.dart';

class TabView extends StatelessWidget {
  final String firstTabtitle;
  final String secondTabTitle;
  final Widget firstTabContent;
  final Widget secondTabContent;
  final double cardHeight;

  const TabView({
    super.key,
    required this.firstTabtitle,
    required this.secondTabTitle,
    required this.cardHeight,
    required this.firstTabContent,
    required this.secondTabContent,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.all(
            StyleApp.borderRadius,
          ),
          boxShadow: [
            StyleApp.boxShadow,
          ],
        ),
        child: Column(children: [
          TabBar(
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              labelColor: Theme.of(context).colorScheme.tertiary,
              unselectedLabelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelColor: Theme.of(context).colorScheme.surface,
              indicator: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Theme.of(context).colorScheme.surface),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(firstTabtitle),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(secondTabTitle),
                  ),
                ),
              ]),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            height: cardHeight,
            child: TabBarView(children: [
              firstTabContent,
              secondTabContent,
            ]),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: const SeeMoreButton(text: "Ver tudo"),
          ),
        ]),
      ),
    );
  }
}

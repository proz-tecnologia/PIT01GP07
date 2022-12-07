import 'package:flutter/material.dart';
import 'package:teste/widgets/raisedButton_see_more/raisedbutton_see_more.dart';
import '../../design_system/styleapp.dart';

class TabView extends StatelessWidget {
  final String title1;
  final String title2;
  final Widget  content1;
  final Widget content2;
  final double cardHeight;

  const TabView(
      {super.key, required this.title1, required this.title2, required this.cardHeight,required this.content1, required this.content2});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.all(StyleApp.borderRadius,
          ),
          boxShadow: [
            StyleApp.boxShadow,
          ],
          ),
        child: Column(
            children: [
              TabBar(
                  labelStyle: const TextStyle (
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  labelColor: Theme.of(context).colorScheme.tertiary,
                  unselectedLabelStyle: const TextStyle (
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
                        child: Text(title1),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(title2),
                      ),
                    ),
                  ]
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                height:cardHeight,
                child: TabBarView(
                        children: [
                          content1,
                          content2,
                        ]
                    ),
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
            ]
        ),
      ),
    );
  }}

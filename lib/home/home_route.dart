import 'package:flutter/material.dart';

import '../movable_widget.dart';
import '../test_widget.dart';
import 'home_title_bar.dart';
import '../resource_widget.dart';
import '../fancy_layout/fancy_layout.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  final Map<String, MovableWidget> movableWidgets = <String, MovableWidget>{
    '1': TestWidget(),
    '2': ResourceWidget(),
    '3': ResourceWidget(),
    '4': ResourceWidget(),
    '5': ResourceWidget(),
    '6': TestWidget(),
    '7': TestWidget(),
    '8': TestWidget(),
    '9': TestWidget(),
    '10': TestWidget(),
    '11': TestWidget(),
    '12': TestWidget(),
    '13': TestWidget(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const HomeTitleBar(),
      ),
      body: Center(
        child: LayoutBuilder(
            builder: (context, constraints) => ScrollableFancyLayout(
                widgets: movableWidgets,
                offsetBetweenWidgets: const Offset(10, 10),
                constraints: const BoxConstraints(
                  maxHeight: 2000,
                ))),
      ),
    );
  }
}

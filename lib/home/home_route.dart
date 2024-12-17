import 'package:flutter/material.dart';

import '../fancy_layout/fancy_layout.dart';
import '../resource_widget.dart';
import '../test_widget.dart';
import 'home_title_bar.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  late List<(String, Widget)> movableWidgets = [
    ('1', const TestWidget()),
    ('2', const ResourceWidget()),
    ('3', const ResourceWidget()),
    ('4', const ResourceWidget()),
    ('5', const ResourceWidget()),
    ('6', const TestWidget()),
    ('7', const TestWidget()),
    ('8', const TestWidget()),
    ('9', const TestWidget()),
    ('10', const TestWidget()),
    ('11', const TestWidget()),
    ('12', const TestWidget()),
    ('13', const TestWidget()),
  ];

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
            ),
          ),
        ),
      ),
    );
  }
}

class _WidgetKey extends StatelessWidget {
  final Widget child;
  final GlobalKey globalKey = GlobalKey();

  _WidgetKey({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      child: child,
    );
  }
}

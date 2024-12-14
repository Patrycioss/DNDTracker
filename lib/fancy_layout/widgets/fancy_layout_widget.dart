import 'package:flutter/cupertino.dart';

import '../delegates/fancy_layout_delegate.dart';

class FancyLayout extends StatefulWidget {
  final Map<String, Widget> widgets;
  final Offset? offsetBetweenWidgets;
  final Offset? padding;

  const FancyLayout({
    super.key,
    required this.widgets,
    this.offsetBetweenWidgets,
    this.padding,
  });

  @override
  State<FancyLayout> createState() => _ScrollableFancyLayoutState();
}

class _ScrollableFancyLayoutState extends State<FancyLayout> {
  double height = 2000;

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: FancyLayoutDelegate(
          widget.widgets.keys.toList(),
          widget.offsetBetweenWidgets ?? Offset.zero,
          widget.padding ?? Offset.zero,
              (height) => this.height = height),
      children: <Widget>[
        // Create all of the colored boxes in the colors map.
        for (final entry in widget.widgets.entries)
        // The "id" can be any Object, not just a String.
          LayoutId(
            id: entry.key,
            child: entry.value,
          ),
      ],
    );
  }
}
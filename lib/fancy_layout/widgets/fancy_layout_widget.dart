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
  State<FancyLayout> createState() => _FancyLayoutState();
}

class _FancyLayoutState extends State<FancyLayout> {
  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: FancyLayoutDelegate(
          widget.widgets.keys.toList(),
          widget.offsetBetweenWidgets ?? Offset.zero,
          widget.padding ?? Offset.zero),
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

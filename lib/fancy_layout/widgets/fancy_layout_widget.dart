import 'package:flutter/cupertino.dart';

import '../delegates/fancy_layout_delegate.dart';

class FancyLayout extends StatefulWidget {
  final List<(String, Widget)> widgets;
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
        widget.widgets.map((e) => e.$1),
        widget.offsetBetweenWidgets ?? Offset.zero,
        widget.padding ?? Offset.zero,
      ),
      children: <Widget>[
        for (final entry in widget.widgets)
          LayoutId(
            id: entry.$1,
            child: entry.$2,
          ),
      ],
    );
  }
}

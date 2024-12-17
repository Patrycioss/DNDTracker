import 'package:flutter/cupertino.dart';

import 'fancy_layout_widget.dart';

class ScrollableFancyLayout extends StatelessWidget {
  final BoxConstraints constraints;
  final List<(String, Widget)> widgets;
  final Offset? offsetBetweenWidgets;
  final Offset? padding;

  const ScrollableFancyLayout({
    super.key,
    required this.constraints,
    required this.widgets,
    this.offsetBetweenWidgets,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints,
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: constraints,
          child: FancyLayout(
            widgets: widgets,
            offsetBetweenWidgets: offsetBetweenWidgets,
            padding: padding,
          ),
        ),
      ),
    );
  }
}

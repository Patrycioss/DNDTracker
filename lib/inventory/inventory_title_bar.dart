import 'package:flutter/material.dart';

import '../stat_display.dart';

class InventoryTitleBar extends StatefulWidget {
  const InventoryTitleBar({super.key});

  @override
  State<InventoryTitleBar> createState() => _InventoryTitleBarState();
}

class _InventoryTitleBarState extends State<InventoryTitleBar> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Wrap(
          spacing: 5,
          children: [
            StatDisplay(
                icon: Icon(
                  Icons.savings,
                  color: Colors.yellow,
                  size: 40.0,
                  semanticLabel: "Gold",
                ),
                initialValue: 27,
                textStyle: TextStyle(
                  color: Colors.white,
                )),
          ],
        ),
      ],
    );
  }
}

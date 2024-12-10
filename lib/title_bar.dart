import 'package:flutter/material.dart';

import 'package:deez_nassive_duts/stat_display.dart';

class TitleBar extends StatefulWidget {
  const TitleBar({super.key});

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Wrap(
          spacing: 5,
          children: [
            StatDisplay(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black,
                  size: 40.0,
                  semanticLabel: "MaxHealth",
                ),
                initialValue: 27,
                textStyle: TextStyle(
                  color: Colors.white,
                )),
            StatDisplay(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 40.0,
                  semanticLabel: "CurrentHealth",
                ),
                initialValue: 27),
            StatDisplay(
                icon: Icon(
                  Icons.shield,
                  color: Colors.blue,
                  size: 40.0,
                  semanticLabel: "Armor",
                ),
                initialValue: 21)
          ],
        ),
      ],
    );
  }
}

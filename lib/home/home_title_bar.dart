import 'package:dnd_tracker/inventory/inventory_route.dart';
import 'package:flutter/material.dart';

import 'package:dnd_tracker/stat_display.dart';

class HomeTitleBar extends StatefulWidget {
  const HomeTitleBar({super.key});

  @override
  State<HomeTitleBar> createState() => _HomeTitleBarState();
}

class _HomeTitleBarState extends State<HomeTitleBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          spacing: 5,
          children: [
            const StatDisplay(
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
            const StatDisplay(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 40.0,
                  semanticLabel: "CurrentHealth",
                ),
                initialValue: 27),
            const StatDisplay(
                icon: Icon(
                  Icons.shield,
                  color: Colors.blue,
                  size: 40.0,
                  semanticLabel: "Armor",
                ),
                initialValue: 21),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const InventoryRoute()));
              },
              child: const Icon(Icons.backpack, color: Colors.brown,),
            )
          ],
        ),
      ],
    );
  }
}
import 'package:dnd_tracker/inventory/inventory_title_bar.dart';
import 'package:flutter/material.dart';


class InventoryRoute extends StatelessWidget {
  const InventoryRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const InventoryTitleBar(),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}

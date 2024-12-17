import 'package:dnd_tracker/stat_board.dart';
import 'package:dnd_tracker/title_bar.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TitleBar(),
      ),
      body: const Center(
        child: StatBoard(),
      ),
    );
  }
}

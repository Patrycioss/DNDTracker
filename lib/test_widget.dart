import 'package:dnd_tracker/base_stat_card.dart';
import 'package:flutter/cupertino.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseStatCard(
      name: "Test",
      width: 150,
      height: 100,
      child: Text("Testing stuff hahaha :D"),
    );
  }
}

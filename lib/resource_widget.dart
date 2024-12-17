import 'package:dnd_tracker/base_stat_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResourceWidget extends StatelessWidget {
  const ResourceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseStatCard(
      name: "Resources",
      width: 250,
      height: 200,
      child: Text("Resources of course"),
    );
  }
}

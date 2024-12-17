import 'dart:math';

import 'package:dnd_tracker/app_state.dart';
import 'package:dnd_tracker/resource_widget.dart';
import 'package:dnd_tracker/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TitleBar extends StatelessWidget {
  final Random random = Random(10);

  TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Row(
          children: [
            ElevatedButton(
              onPressed: () {
                final int index = random.nextInt(2);
                final Widget widget =
                    index == 0 ? const TestWidget() : const ResourceWidget();
                ref.read(statWidgetsProvider.notifier).addWidget(widget);
              },
              child: const ColoredBox(color: Colors.red),
            )
          ],
        );
      },
    );
  }
}

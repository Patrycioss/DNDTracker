import 'package:dnd_tracker/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fancy_layout/widgets/scrollable_fancy_layout_widget.dart';

class StatBoard extends ConsumerWidget {
  const StatBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widgets = ref.watch(statWidgetsProvider);

    return LayoutBuilder(
      builder: (context, constraints) => ScrollableFancyLayout(
        widgets: widgets,
        offsetBetweenWidgets: const Offset(10, 10),
        constraints: const BoxConstraints(
          maxHeight: 2000,
        ),
      ),
    );
  }
}

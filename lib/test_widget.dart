import 'package:dnd_tracker/movable_widget.dart';
import 'package:flutter/cupertino.dart';

class TestWidget extends MovableWidget {
  TestWidget({super.key})
      : super(
          name: "Test",
          childWidget: _TestChildWidget(),
          width: 250,
          height: 200,
        );
}

class _TestChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text("Testing stuff hahaha :D");
  }
}

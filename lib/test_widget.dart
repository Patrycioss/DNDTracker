import 'package:dnd_tracker/movable_widget.dart';
import 'package:flutter/cupertino.dart';

class TestWidget extends MovableWidget {
  TestWidget({super.key}) : super(width: 250,height: 200);

  @override
  Widget buildChild() {
    return const Text("Test");
  }

  @override
  Widget buildTitle() {
    return const Text("Test");
  }
}
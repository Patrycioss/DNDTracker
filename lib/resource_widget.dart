import 'package:dnd_tracker/movable_widget.dart';
import 'package:flutter/cupertino.dart';

class ResourceWidget extends MovableWidget {
  ResourceWidget({super.key});

  @override
  Widget buildChild() {
    return const Text("Hi");
  }

  @override
  Widget buildTitle() {
    return const Text("Resources");
  }
}

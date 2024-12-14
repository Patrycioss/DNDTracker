import 'package:dnd_tracker/movable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResourceWidget extends MovableWidget {
  const ResourceWidget({super.key});

  @override
  Widget buildChild() {
    return const Text("Resource!");
  }

  @override
  Widget buildTitle() {
    return const Text("Resources");
  }
}

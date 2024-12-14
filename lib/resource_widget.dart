import 'package:dnd_tracker/movable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResourceWidget extends MovableWidget {
  ResourceWidget({super.key})
      : super(
          name: "Resources",
          childWidget: _ResourceChildWidget(),
          width: 250,
          height: 200,
        );
}

class _ResourceChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text("Resources of course");
  }
}

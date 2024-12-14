import 'package:flutter/material.dart';

abstract class MovableWidget extends StatelessWidget {
  late final double? width;
  late final double? height;

  final ExpansionTileController _controller = ExpansionTileController();

  MovableWidget({super.key, double? width, double? height})
      : width = width ?? 300, height = height ?? 100;

  Widget buildChild();

  Widget buildTitle();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      child: ExpansionTile(
        backgroundColor: Colors.red,
        title: buildTitle(),
        controller: _controller,
        children: [
          SizedBox(
            height: this.height,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: buildChild(),
            ),
          )
        ],
      ),
    );
  }
}

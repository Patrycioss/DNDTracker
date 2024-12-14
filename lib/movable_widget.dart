import 'package:flutter/material.dart';

abstract class MovableWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const MovableWidget({super.key, double? width, double? height})
      : width = width ?? 300,
        height = height ?? 100;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ExpansionTile(
        backgroundColor: Colors.red,
        title: buildTitle(),
        children: [
          SizedBox(
            height: height,
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

  Widget buildChild();

  Widget buildTitle();
}

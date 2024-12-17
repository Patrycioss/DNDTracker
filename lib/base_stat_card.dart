import 'package:flutter/material.dart';

class BaseStatCard extends StatelessWidget {
  final String name;
  final Widget? title;
  final Widget? child;
  final double? width;
  final double? height;

  const BaseStatCard({
    super.key,
    required this.name,
    this.title,
    this.child,
    double? width,
    double? height,
  })  : width = width ?? 300,
        height = height ?? 100;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ExpansionTile(
        backgroundColor: Colors.red,
        title: title ?? Text(name),
        children: [
          SizedBox(
            height: height,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: child,
            ),
          )
        ],
      ),
    );
  }
}

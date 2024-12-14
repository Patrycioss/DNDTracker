import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatDisplay extends StatefulWidget {
  final Icon icon;
  final int initialValue;
  final TextStyle? textStyle;

  const StatDisplay(
      {super.key,
      required this.icon,
      required this.initialValue,
      this.textStyle = const TextStyle(color: Colors.white)});

  @override
  State<StatDisplay> createState() => _StatDisplayState();
}

class _StatDisplayState extends State<StatDisplay> {
  final TextEditingController _textEditingController = TextEditingController();
  late int currentValue;
  late int size;
  late double iconSize = 40.0;

  @override
  void initState() {
    currentValue = widget.initialValue;
    setValue(widget.initialValue);
    super.initState();
  }

  void setValue(int value) {
    currentValue = value;
    _textEditingController.text = currentValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 80,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(5),
        child: Stack(alignment: Alignment.center, children: [
          Container(
            alignment: Alignment.centerRight,
            child: widget.icon,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onSubmitted: (value) => currentValue = int.parse(value),
                controller: _textEditingController,
                decoration: null,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
          ),
        ]),
      ),
    ));
  }
}

import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double size;

  const NormalText({
    Key? key,
    required this.text,
    this.textColor = Colors.black,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, height: 1.8, color: textColor),
    );
  }
}

import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Color? colors;
  final double size;

  const TitleText({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.colors,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: firstText,
          style: TextStyle(
            fontSize: 20,
            color: colors,
          ),
          children: [
            TextSpan(
              text: secondText,
              style: TextStyle(
                  fontSize: 20, color: colors, fontWeight: FontWeight.bold),
            ),
          ]),
    );
  }
}

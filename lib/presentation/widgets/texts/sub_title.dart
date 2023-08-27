import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Color? colors;
  final double size;

  const SubTitleText({
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
              fontSize: 24, color: colors, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: secondText,
              style: TextStyle(
                  fontSize: 24, color: colors, fontWeight: FontWeight.w400),
            ),
          ]),
    );
  }
}

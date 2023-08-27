import 'package:flutter/material.dart';
import 'package:test_/presentation/constants/app_colors.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.backGroundColor,
          title: const Text("Ticket Screen")),
    );
  }
}

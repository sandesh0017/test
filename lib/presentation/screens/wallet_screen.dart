import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.backGroundColor,
          title: const Text("Wallet Screen")),
    );
  }
}

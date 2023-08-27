import 'package:flutter/material.dart';
import 'package:test_/presentation/constants/app_colors.dart';
import 'package:test_/presentation/widgets/texts/normal_text.dart';
import 'package:test_/presentation/widgets/texts/title_text.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, right: 0, bottom: 10, left: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                  height: 50,
                  width: 50,
                  image: AssetImage("assets/images/profile.png")),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(
                    firstText: "Hello",
                    secondText: " Admin",
                    colors: AppColor.whiteColor,
                  ),
                  NormalText(
                    text: "Book your favorite movie",
                    textColor: AppColor.whiteColor,
                    size: 14,
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColor.containerColor),
            child: const Icon(
              Icons.notifications,
              size: 25,
              color: AppColor.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

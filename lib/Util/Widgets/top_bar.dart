import 'package:get/get.dart';
import '../../Animations/FadeAnimation.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../size_config.dart';
import 'intro.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.img,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  final String img, text1, text2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 100, left: 0, right: 0, bottom: 80),
        child: Center(
          child: Column(
            children: [
              FadeAnimation(
                1.1,
                Image.asset(
                  img,
                  height: getProportionateScreenHeight(200),
                  width: getProportionateScreenWidth(200),
                ),
              ),
              FadeAnimation(
                1.2,
                BodyText(
                  text: text1.tr,
                  fontSize: getProportionateScreenWidth(32),
                  color: AppColors.kPrimary2Color,
                  weight: FontWeight.bold,
                ),
              ),
              FadeAnimation2(
                1.3,
                BodyText(
                  text: text2.tr,
                  fontSize: getProportionateScreenWidth(25),
                  color: AppColors.kPrimary2Color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

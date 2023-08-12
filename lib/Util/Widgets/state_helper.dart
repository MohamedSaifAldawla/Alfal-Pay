import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../Animations/FadeAnimation.dart';
import '../size_config.dart';
import 'intro.dart';

class StateHelper extends StatelessWidget {
  StateHelper({
    super.key,
    required this.icon,
    required this.title,
  });
  String icon, title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeAnimation(
            1,
            Lottie.asset(
              icon,
              width: getProportionateScreenWidth(250),
              height: getProportionateScreenHeight(250),
            ),
          ),
          Gap(getProportionateScreenHeight(20)),
          FadeAnimation(
            1,
            BodyText(
              text: title,
              weight: FontWeight.bold,
              fontSize: getProportionateScreenHeight(25),
            ),
          ),
        ],
      ),
    );
  }
}

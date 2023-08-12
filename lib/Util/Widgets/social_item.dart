import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';
import '../size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function(),
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: const EdgeInsets.all(9),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.kPrimaryLightColor
              : AppColors.kPrimaryDarkColor,
          //color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.shadow
                  : AppColors.shadow2,
              blurRadius: 20.0,
              offset: const Offset(0, 8),
              blurStyle: BlurStyle.normal,
            )
          ],
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}

class SmallButtons extends StatelessWidget {
  const SmallButtons({
    Key? key,
    required this.icon,
    required this.press,
    this.color,
  }) : super(key: key);

  final String icon;
  final Function press;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function(),
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(10)),
        padding: EdgeInsets.all(getProportionateScreenHeight(9)),
        height: getProportionateScreenHeight(45),
        width: getProportionateScreenWidth(45),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.kPrimaryLightColor
              : AppColors.kPrimaryDarkColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.shadow
                  : AppColors.shadow2,
              blurRadius: 20.0,
              offset: const Offset(0, 8),
              blurStyle: BlurStyle.normal,
            )
          ],
        ),
        child: SvgPicture.asset(
          icon,
          color: color,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../Globals/globals.dart';
import '../colors.dart';
import '../size_config.dart';
import 'intro.dart';

class ProfileItem extends StatelessWidget {
  ProfileItem({
    Key? key,
    required this.firstIcon,
    required this.title,
    this.onTap,
  }) : super(key: key);
  String firstIcon, title;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(15),
          vertical: getProportionateScreenHeight(10),
        ),
        margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
        width: double.infinity,
        height: getProportionateScreenHeight(50),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.kPrimaryLightColor
              : AppColors.kPrimaryDark3Color,
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.shadow
                  : AppColors.shadow2,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              firstIcon,
              width: getProportionateScreenWidth(30),
              height: getProportionateScreenHeight(30),
            ),
            Gap(getProportionateScreenHeight(15)),
            Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(6)),
              child: BodyText(
                text: title,
                weight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(8)),
              child: SvgPicture.asset(
                lang == "en"
                    ? "assets/icons/right.svg"
                    : "assets/icons/Back.svg",
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.kTextColor
                    : AppColors.kPrimaryLightColor,
                width: getProportionateScreenWidth(10),
                height: getProportionateScreenHeight(10),
              ),
            )
          ],
        ),
      ),
    );
  }
}

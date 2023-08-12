import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../colors.dart';
import '../size_config.dart';
import 'intro.dart';

class TransCard extends StatelessWidget {
  TransCard({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.title,
    required this.amount,
    required this.color,
  });

  String icon1, icon2, title, amount;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getProportionateScreenHeight(10),
      ),
      padding: EdgeInsets.only(
          left: getProportionateScreenHeight(13),
          right: getProportionateScreenHeight(15),
          top: getProportionateScreenHeight(10),
          bottom: getProportionateScreenHeight(12)),
      width: double.infinity,
      //height: getProportionateScreenHeight(90),
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
      child: InkWell(
        onTap: () {
          Get.toNamed('ticket');
        },
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenHeight(5)),
              child: SvgPicture.asset(
                icon1,
                width: getProportionateScreenWidth(45),
                height: getProportionateScreenHeight(45),
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.kPrimary2Color
                    : Colors.white,
              ),
            ),
            Gap(getProportionateScreenHeight(10)),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BodyText(
                        text: title,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Gap(getProportionateScreenHeight(10)),
                  Row(
                    children: [
                      BodyText(
                        text: "08 Mar 2023",
                        fontSize: getProportionateScreenHeight(13),
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.kSecondaryColor
                            : Colors.white70,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: BodyText(
                          text: amount + ' ' + 'SDG'.tr,
                          weight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                      SvgPicture.asset(icon2,
                          width: getProportionateScreenWidth(15),
                          height: getProportionateScreenHeight(15),
                          color: color),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

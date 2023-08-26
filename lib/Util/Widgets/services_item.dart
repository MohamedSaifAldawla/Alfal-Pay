import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../colors.dart';
import '../size_config.dart';
import 'intro.dart';

class ServicesItem extends StatelessWidget {
  const ServicesItem({
    required this.icon,
    this.iconcolor,
    required this.service,
    this.onTap,
    this.size,
    this.cWidth,
    this.cHeight,
    Key? key,
  }) : super(key: key);
  final String icon;
  final Color? iconcolor;
  final String service;
  final double? size, cWidth, cHeight;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenHeight(5)),
        width: cWidth ?? getProportionateScreenWidth(110),
        height: cHeight ?? getProportionateScreenHeight(110),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.kPrimaryLightColor
              : AppColors.kPrimaryDark3Color,
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(10)),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              color: iconcolor ?? AppColors.kPrimaryColor,
              width: size ?? getProportionateScreenWidth(40),
              height: size ?? getProportionateScreenHeight(40),
            ),
            Gap(getProportionateScreenHeight(15)),
            BodyText(
              text: service,
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesItem2 extends StatelessWidget {
  const ServicesItem2({
    required this.icon,
    this.iconcolor,
    required this.service,
    this.onTap,
    this.size,
    this.cWidth,
    this.cHeight,
    Key? key,
  }) : super(key: key);
  final String icon;
  final Color? iconcolor;
  final String service;
  final double? size, cWidth, cHeight;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: cWidth ?? getProportionateScreenWidth(70),
                height: cHeight ?? (70),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.kPrimaryLightColor
                      : AppColors.kPrimaryDark3Color,
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenHeight(20)),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      icon,
                      color: iconcolor ?? AppColors.kPrimaryColor,
                      width: size ?? getProportionateScreenWidth(40),
                      height: size ?? getProportionateScreenHeight(40),
                    ),
                  ],
                ),
              ),
            ),
            Gap(getProportionateScreenHeight(10)),
            BodyText(
              text: service,
            ),
          ],
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ServicesItem3 extends StatelessWidget {
  ServicesItem3({
    required this.icon,
    required this.containercolor,
    required this.iconcolor,
    required this.service,
    this.onTap,
    Key? key,
  }) : super(key: key);
  String icon;
  Color containercolor;
  Color iconcolor;
  String service;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: getProportionateScreenWidth(90),
              height: getProportionateScreenHeight(90),
              decoration: BoxDecoration(
                color: AppColors.kPrimaryLightColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [AppColors.boxShadow],
              ),
              child: InkWell(
                onTap: onTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: containercolor,
                            borderRadius: BorderRadius.circular(25)),
                        child: SvgPicture.asset(
                          icon,
                          color: iconcolor,
                          width: 35,
                          height: 35,
                        )),
                  ],
                ),
              ),
            ),
            const Gap(5),
            BodyText(
              text: service,
            ),
            const Gap(5),
          ],
        ),
      ],
    );
  }
}

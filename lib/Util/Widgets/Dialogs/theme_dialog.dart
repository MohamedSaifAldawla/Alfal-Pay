import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../Globals/globals.dart';
import '../../colors.dart';
import '../../size_config.dart';
import '../intro.dart';

themeDialog(
    {required context,
    required Function()? onTap1,
    required Function()? onTap2}) {
  return Get.dialog(
    FadeAnimation(
      0,
      Dialog(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.kPrimaryLightColor
            : AppColors.kPrimaryDarkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)),
        ),
        child: Container(
          padding: EdgeInsets.only(
              left: getProportionateScreenHeight(5),
              right: getProportionateScreenHeight(5),
              bottom: getProportionateScreenHeight(10)),
          width: double.infinity,
          height: getProportionateScreenHeight(180),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/Close.svg",
                      color: AppColors.error,
                      width: getProportionateScreenWidth(20),
                      height: getProportionateScreenHeight(20),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onTap1,
                    child: Container(
                      width: getProportionateScreenWidth(100),
                      height: getProportionateScreenHeight(100),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.kPrimaryLightColor
                            : AppColors.kPrimaryDark3Color,
                        border: Border.all(
                          color: mainController.darkMode == true
                              ? AppColors.kPrimaryColor
                              : Theme.of(context).brightness == Brightness.light
                                  ? AppColors.kPrimaryLightColor
                                  : AppColors.kPrimaryDark3Color,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenHeight(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.shadow
                                    : AppColors.shadow2,
                            blurRadius: 20.0,
                            offset: const Offset(0, 8),
                            blurStyle: BlurStyle.normal,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/dark.svg",
                            width: getProportionateScreenWidth(50),
                            height: getProportionateScreenHeight(50),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.kPrimaryDarkColor
                                    : AppColors.kPrimaryLightColor,
                          ),
                          Gap(getProportionateScreenHeight(10)),
                          BodyText(
                            text: "Dark".tr.toUpperCase(),
                            weight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.kTextColor
                                    : AppColors.kPrimaryLightColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(getProportionateScreenHeight(40)),
                  GestureDetector(
                    onTap: onTap2,
                    child: Container(
                      width: getProportionateScreenWidth(100),
                      height: getProportionateScreenHeight(100),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.kPrimaryLightColor
                            : AppColors.kPrimaryDark3Color,
                        border: Border.all(
                          color: mainController.darkMode == false
                              ? AppColors.kPrimaryColor
                              : Theme.of(context).brightness == Brightness.light
                                  ? AppColors.kPrimaryLightColor
                                  : AppColors.kPrimaryDark3Color,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenHeight(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.shadow
                                    : AppColors.shadow2,
                            blurRadius: 20.0,
                            offset: const Offset(0, 8),
                            blurStyle: BlurStyle.normal,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Sun.svg",
                            width: getProportionateScreenWidth(50),
                            height: getProportionateScreenHeight(50),
                            color: Colors.orange,
                          ),
                          Gap(getProportionateScreenHeight(10)),
                          BodyText(
                            text: "Light".tr.toUpperCase(),
                            weight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.kTextColor
                                    : AppColors.kPrimaryLightColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

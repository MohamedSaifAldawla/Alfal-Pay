import 'package:alfalPay/Models/hewalas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../colors.dart';
import '../size_config.dart';
import 'intro.dart';

// ignore: must_be_immutable
class HewalaCard extends StatelessWidget {
  HewalaCard({
    super.key,
    required this.hewalas,
  });

  Hewalas hewalas;
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
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenHeight(5)),
            child: SvgPicture.asset(
              'assets/icons/bag-dollar.svg',
              width: getProportionateScreenWidth(40),
              height: getProportionateScreenHeight(40),
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
                      text: hewalas.hasBeenDelivered
                          ? "Delivered".tr
                          : "Not Delivered".tr,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                Gap(getProportionateScreenHeight(5)),
                Row(
                  children: [
                    BodyText(
                      text: hewalas.comment,
                      fontSize: getProportionateScreenHeight(13),
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.kSecondaryColor
                          : Colors.white70,
                    ),
                  ],
                ),
                Gap(getProportionateScreenHeight(5)),
                Row(
                  children: [
                    BodyText(
                      text: hewalas.createdAt,
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
            flex: 3,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: BodyText(
                        text: '${hewalas.amount} ${'SDG'.tr}',
                        weight: FontWeight.bold,
                        color: AppColors.error,
                      ),
                    ),
                    SvgPicture.asset('assets/icons/Arrow_Up_MD.svg',
                        width: getProportionateScreenWidth(15),
                        height: getProportionateScreenHeight(15),
                        color: AppColors.error),
                  ],
                ),
                Gap(getProportionateScreenHeight(5)),
                BodyText(
                  text: hewalas.serialNumber,
                  fontSize: getProportionateScreenHeight(13),
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.kSecondaryColor
                      : Colors.white70,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

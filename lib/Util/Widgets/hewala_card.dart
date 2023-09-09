import 'package:alfalPay/Models/hewalas.dart';
import 'package:alfalPay/Util/Globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: getProportionateScreenHeight(13),
          vertical: getProportionateScreenHeight(10)),
      width: double.infinity,
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
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                child: SvgPicture.asset(
                  'assets/icons/cashflow.svg',
                  width: getProportionateScreenWidth(35),
                  height: getProportionateScreenHeight(35),
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
                        Expanded(
                          child: BodyText(
                            text: hewalas.receiverName,
                            fontSize: getProportionateScreenHeight(13),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.kSecondaryColor
                                    : Colors.white70,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    Gap(getProportionateScreenHeight(5)),
                    Row(
                      children: [
                        BodyText(
                          text: hewalas.receiverPhone,
                          fontSize: getProportionateScreenHeight(13),
                          color:
                              Theme.of(context).brightness == Brightness.light
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
                          color:
                              Theme.of(context).brightness == Brightness.light
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
                  ],
                ),
              ),
            ],
          ),
          Gap(getProportionateScreenHeight(10)),
          const Divider(
            color: AppColors.kSecondaryColor,
            thickness: 0.1,
          ),
          Gap(getProportionateScreenHeight(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BodyText(
                text: "${"Serial".tr}: ",
              ),
              SelectableText(
                hewalas.serialNumber,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(15),
                ),
              ),
              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: hewalas.serialNumber));
                  mainController.snackBar(
                      "Success".tr,
                      "Copied".tr,
                      SvgPicture.asset(
                        "assets/icons/Success2.svg",
                        color: Colors.white,
                      ),
                      AppColors.success,
                      SnackPosition.TOP,
                      3);
                },
                child: SvgPicture.asset(
                  'assets/icons/Copy.svg',
                  width: getProportionateScreenWidth(20),
                  height: getProportionateScreenHeight(20),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

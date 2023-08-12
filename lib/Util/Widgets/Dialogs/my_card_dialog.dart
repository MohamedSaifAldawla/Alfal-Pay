import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../colors.dart';
import '../../size_config.dart';
import '../intro.dart';

cardDialog({
  required context,
}) {
  return Get.dialog(
    FadeAnimation2(
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
          height: getProportionateScreenHeight(300),
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
              Center(
                child: QrImage(
                  data: GetStorage().read('id'),
                  backgroundColor: AppColors.kPrimaryLightColor,
                  version: QrVersions.auto,
                  size: getProportionateScreenHeight(200),
                ),
              ),
              Gap(getProportionateScreenHeight(10)),
              BodyText(
                text: 'Account number :'.tr + ' ' + GetStorage().read('id'),
                fontSize: getProportionateScreenHeight(14),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

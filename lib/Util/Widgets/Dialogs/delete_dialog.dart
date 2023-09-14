import 'package:alfalPay/Models/beneficiaries.dart';
import 'package:alfalPay/Util/Globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../colors.dart';
import '../../size_config.dart';
import '../intro.dart';

deleteDialog({required context, required Beneficiaries beneficiary}) {
  return Get.dialog(
    FadeAnimation(
      0,
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)),
        ),
        child: Container(
          padding: EdgeInsets.only(
              top: getProportionateScreenHeight(25),
              left: getProportionateScreenHeight(16),
              right: getProportionateScreenHeight(16)),
          width: double.infinity,
          height: getProportionateScreenHeight(190),
          child: Column(
            children: [
              Gap(getProportionateScreenHeight(15)),
              BodyText(
                text: "Confirm delete beneficiary".tr,
                fontSize: getProportionateScreenHeight(16),
                weight: FontWeight.bold,
              ),
              const Gap(40),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: getProportionateScreenWidth(30),
                        height: getProportionateScreenHeight(50),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.kTextColor),
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.kPrimaryLightColor
                                  : AppColors.kPrimaryDarkColor,
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(20)),
                        ),
                        child: Center(
                          child: BodyText(
                            text: "No".tr,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(getProportionateScreenHeight(10)),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();

                        beneficiaryController.deleteBeneficiary(
                            beneficiaryId: beneficiary.id);
                      },
                      child: Container(
                        width: getProportionateScreenWidth(30),
                        height: getProportionateScreenHeight(50),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.kPrimaryColor),
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(20)),
                        ),
                        child: Center(
                          child: BodyText(
                            text: "Yes".tr,
                            color: AppColors.kPrimaryLightColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

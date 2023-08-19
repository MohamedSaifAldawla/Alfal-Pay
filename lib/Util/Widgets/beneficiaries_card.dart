import 'package:alfalPay/Models/beneficiaries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../Globals/globals.dart';
import '../colors.dart';
import '../size_config.dart';
import 'intro.dart';

class BeneficiariesCard extends StatelessWidget {
  const BeneficiariesCard({
    super.key,
    required this.beneficiary,
    required this.transfer,
    required this.delete,
  });
  final Beneficiaries beneficiary;
  final void Function()? transfer, delete;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getProportionateScreenHeight(10),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(10),
          vertical: getProportionateScreenHeight(10)),
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
      width: double.infinity,
      height: getProportionateScreenHeight(90),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            logo,
            height: getProportionateScreenHeight(60),
            width: getProportionateScreenHeight(60),
          ),
          Gap(getProportionateScreenHeight(10)),
          Expanded(
            flex: 115,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText(
                  text: beneficiary.name,
                  weight: FontWeight.bold,
                ),
                Gap(getProportionateScreenHeight(5)),
                BodyText(
                  text: beneficiary.nickName,
                  fontSize: getProportionateScreenHeight(14),
                  weight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.kSecondaryColor
                      : Colors.white70,
                ),
                Gap(getProportionateScreenHeight(5)),
                BodyText(
                  text: beneficiary.accountNumber,
                  fontSize: getProportionateScreenHeight(14),
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.kSecondaryColor
                      : Colors.white70,
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: transfer,
                icon: SvgPicture.asset(
                  "assets/icons/Transfer.svg",
                  height: getProportionateScreenHeight(30),
                  width: getProportionateScreenHeight(30),
                  color: AppColors.error,
                ),
              ),
              IconButton(
                onPressed: delete,
                icon: SvgPicture.asset(
                  "assets/icons/Trash.svg",
                  height: getProportionateScreenHeight(30),
                  width: getProportionateScreenHeight(30),
                  color: AppColors.error,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:alfalPay/Models/transactions.dart';
import 'package:alfalPay/Views/Client/History/ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../colors.dart';
import '../size_config.dart';
import 'intro.dart';

class TransCard extends StatelessWidget {
  TransCard({
    super.key,
    required this.transactions,
    required this.icon1,
  });

  String icon1;
  TransactionList transactions;
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
          Get.to(
              () => TicketScreen(
                    transactions: transactions,
                  ),
              transition: Transition.fadeIn);
        },
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenHeight(5)),
              child: (() {
                if (transactions.type == "money_transfer") {
                  return SvgPicture.asset(
                    'assets/icons/Wallet.svg',
                    width: getProportionateScreenWidth(45),
                    height: getProportionateScreenHeight(45),
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.kPrimary2Color
                        : Colors.white,
                  );
                }
                if (transactions.type == "scratch_recharge") {
                  return SvgPicture.asset(
                    'assets/icons/Wad-Of-Money.svg',
                    width: getProportionateScreenWidth(45),
                    height: getProportionateScreenHeight(45),
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.kPrimary2Color
                        : Colors.white,
                  );
                } else {
                  return SvgPicture.asset(
                    'assets/icons/Wallet.svg',
                    width: getProportionateScreenWidth(45),
                    height: getProportionateScreenHeight(45),
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.kPrimary2Color
                        : Colors.white,
                  );
                }
              }()),
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
                        text: transactions.typeLabel,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Gap(getProportionateScreenHeight(10)),
                  Row(
                    children: [
                      BodyText(
                        text: transactions.createdAt,
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
                          text: '${transactions.amount} ${'SDG'.tr}',
                          weight: FontWeight.bold,
                          color: transactions.isPositive == true
                              ? AppColors.success
                              : AppColors.error,
                        ),
                      ),
                      SvgPicture.asset(
                          transactions.isPositive == true
                              ? 'assets/icons/Arrow_Down_MD.svg'
                              : 'assets/icons/Arrow_Up_MD.svg',
                          width: getProportionateScreenWidth(15),
                          height: getProportionateScreenHeight(15),
                          color: transactions.isPositive == true
                              ? AppColors.success
                              : AppColors.error),
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

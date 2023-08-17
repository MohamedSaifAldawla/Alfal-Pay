import 'package:alfalPay/Models/agents.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Globals/globals.dart';
import '../colors.dart';
import '../size_config.dart';
import 'intro.dart';

// ignore: must_be_immutable
class agentsCard extends StatelessWidget {
  agentsCard({super.key, required this.agent});
  Datum agent;
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
        children: [
          Image.asset(
            logo,
            height: getProportionateScreenHeight(60),
            width: getProportionateScreenHeight(60),
          ),
          Gap(getProportionateScreenHeight(10)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText(
                text: agent.name,
                weight: FontWeight.bold,
              ),
              Gap(getProportionateScreenHeight(6)),
              BodyText(
                text: agent.phone,
                fontSize: getProportionateScreenHeight(13),
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.kSecondaryColor
                    : Colors.white70,
              ),
              BodyText(
                text: agent.address,
                fontSize: getProportionateScreenHeight(13),
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.kSecondaryColor
                    : Colors.white70,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

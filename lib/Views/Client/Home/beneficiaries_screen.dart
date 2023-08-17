import 'package:alfalPay/Util/Globals/globals.dart';
import 'package:alfalPay/Util/Widgets/agents_card.dart';
import 'package:alfalPay/Util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Animations/FadeAnimation.dart';
import '../../../Util/colors.dart';

class BeneficiariesScreen extends StatelessWidget {
  const BeneficiariesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beneficiaries".tr),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(15)),
              child: SvgPicture.asset(
                "assets/icons/UserPlus.svg",
                height: getProportionateScreenHeight(25),
                width: getProportionateScreenHeight(25),
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.kPrimaryDark3Color
                    : AppColors.kPrimaryLightColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(20),
        ),
        child: Column(
          children: [
            // Expanded(
            //   child: ListView.separated(
            //     physics: const BouncingScrollPhysics(),
            //     itemBuilder: (context, index) => FadeAnimation(
            //       1,
            //       agentsCard(agent: agentsController.agents[index]),
            //     ),
            //     itemCount: agentsController.agents.length,
            //     separatorBuilder: (context, index) => SizedBox(
            //       height: getProportionateScreenHeight(10),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

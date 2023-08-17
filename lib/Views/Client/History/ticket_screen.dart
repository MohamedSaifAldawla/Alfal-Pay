import 'package:alfalPay/routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';
import '../../../Models/transactions.dart';
import '../../../Util/Globals/globals.dart';
import '../../../Util/Widgets/intro.dart';
import '../../../Util/Widgets/social_item.dart';
import '../../../Util/colors.dart';
import '../../../Util/size_config.dart';

class TicketScreen extends StatelessWidget {
  TicketScreen({
    super.key,
    required this.transactions,
  });
  final TransactionList transactions;
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(15),
          ),
          child: Screenshot(
            controller: screenshotController,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.kPrimaryLightColor
                      : AppColors.kPrimaryDark3Color,
                  image: DecorationImage(
                      image: Theme.of(context).brightness == Brightness.light
                          ? const AssetImage("assets/images/ticket2.png")
                          : const AssetImage("assets/images/ticket.png"),
                      fit: BoxFit.cover),
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
                  ]),
              child: Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenHeight(15),
                    right: getProportionateScreenHeight(15),
                    bottom: getProportionateScreenHeight(30)),
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/icons/transfer.json',
                      width: getProportionateScreenWidth(250),
                      height: getProportionateScreenHeight(250),
                    ),
                    BodyText(
                      text: "Amount Successfully".tr,
                      weight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(20),
                      color: AppColors.success,
                      maxLines: 2,
                    ),
                    Gap(getProportionateScreenHeight(20)),
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(15)),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.06),
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenHeight(20)),
                      ),
                      child: Column(
                        children: [
                          BodyText(
                            text: "${transactions.amount} ${"SDG".tr}",
                            weight: FontWeight.bold,
                            fontSize: getProportionateScreenHeight(20),
                          ),
                          Gap(getProportionateScreenHeight(10)),
                          BodyText(
                            text: "Transferred amount".tr,
                          ),
                        ],
                      ),
                    ),
                    Gap(getProportionateScreenHeight(20)),
                    Row(
                      children: [
                        BodyText(
                          text: "Transaction id".tr,
                          weight: FontWeight.bold,
                        ),
                        const Spacer(),
                        BodyText(
                          text: transactions.refNumber.toString(),
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Gap(getProportionateScreenHeight(10)),
                    Row(
                      children: [
                        BodyText(
                          text: "Type".tr,
                          weight: FontWeight.bold,
                        ),
                        const Spacer(),
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
                          text: "From".tr,
                          weight: FontWeight.bold,
                        ),
                        const Spacer(),
                        BodyText(
                          text: transactions.accountFromNumber,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Gap(getProportionateScreenHeight(10)),
                    Row(
                      children: [
                        BodyText(
                          text: "To".tr,
                          weight: FontWeight.bold,
                        ),
                        const Spacer(),
                        BodyText(
                          text: transactions.accountToNumber,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Gap(getProportionateScreenHeight(10)),
                    Row(
                      children: [
                        BodyText(
                          text: "Comment".tr,
                          weight: FontWeight.bold,
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 3,
                          child: BodyText(
                            text: transactions.comment,
                            weight: FontWeight.w500,
                            textAlign: TextAlign.end,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    Gap(getProportionateScreenHeight(10)),
                    Row(
                      children: [
                        BodyText(
                          text: "Date".tr,
                          weight: FontWeight.bold,
                        ),
                        const Spacer(),
                        BodyText(
                          text: transactions.createdAt,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Gap(getProportionateScreenHeight(10)),
                    const Divider(
                      color: AppColors.kSecondaryColor,
                      thickness: 0.1,
                    ),
                    Gap(getProportionateScreenHeight(30)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SmallButtons(
                          title: "Save ticket".tr,
                          icon: "assets/icons/Save2.svg",
                          color: AppColors.kPrimaryColor,
                          press: () async {
                            final image = await screenshotController.capture();
                            if (image == null) return;
                            mainController.saveImage(image);
                          },
                        ),
                        SmallButtons(
                          title: "Home".tr,
                          icon: "assets/icons/home.svg",
                          color: AppColors.kPrimaryColor,
                          press: () {
                            Get.offAllNamed(Routes.home);
                          },
                        ),
                        SmallButtons(
                          title: "Share".tr,
                          icon: "assets/icons/Share.svg",
                          color: AppColors.kPrimaryColor,
                          press: () async {
                            final image = await screenshotController.capture();
                            if (image == null) return;
                            mainController.saveAndShare(image);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

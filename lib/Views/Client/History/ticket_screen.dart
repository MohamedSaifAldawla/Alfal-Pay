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

// ignore: must_be_immutable
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
                    left: getProportionateScreenHeight(5),
                    right: getProportionateScreenHeight(5),
                    bottom: getProportionateScreenHeight(30)),
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/icons/transfer.json',
                      width: getProportionateScreenWidth(200),
                      height: getProportionateScreenHeight(200),
                    ),
                    BodyText(
                      text: "Amount Successfully".tr,
                      weight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(20),
                      color: AppColors.success,
                      maxLines: 2,
                    ),
                    Gap(getProportionateScreenHeight(10)),
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
                    TransactionField(
                        title: "Transaction id".tr,
                        info: transactions.refNumber.toString()),
                    TransactionField(
                        title: "Type".tr, info: transactions.typeLabel),
                    TransactionField(
                        title: "From".tr, info: transactions.accountFromNumber),
                    TransactionField(
                        title: "To".tr, info: transactions.accountToNumber),
                    TransactionField(
                        title: "Receiver name".tr,
                        info: transactions.receiverName),
                    TransactionField(
                        title: "Comment".tr, info: transactions.comment),
                    TransactionField(
                        title: "Date".tr, info: transactions.createdAt),
                    // Gap(getProportionateScreenHeight(10)),
                    // const Divider(
                    //   color: AppColors.kSecondaryColor,
                    //   thickness: 0.1,
                    // ),
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
                        // SmallButtons(
                        //   title: "Share".tr,
                        //   icon: "assets/icons/Share.svg",
                        //   color: AppColors.kPrimaryColor,
                        //   press: () async {
                        //     final image = await screenshotController.capture();
                        //     if (image == null) return;
                        //     mainController.saveAndShare(image);
                        //   },
                        // ),
                      ],
                    ),
                    Gap(getProportionateScreenHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          logo,
                          height: getProportionateScreenHeight(20),
                          width: getProportionateScreenHeight(20),
                        ),
                        Gap(getProportionateScreenHeight(10)),
                        NormalBodyText(
                          text: "Alfal Payments".tr,
                          fontSize: 15,
                          color: AppColors.kSecondaryColor,
                        ),
                      ],
                    )
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

class TransactionField extends StatelessWidget {
  const TransactionField({
    super.key,
    required this.title,
    required this.info,
  });

  final String title, info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(0)),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(65, 158, 158, 158))),
      child: Row(
        children: [
          BodyText(
            text: title,
            weight: FontWeight.bold,
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: BodyText(
              text: info,
              textAlign: TextAlign.end,
              weight: FontWeight.w500,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

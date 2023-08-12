import 'package:alfalPay/Util/Globals/globals.dart';
import 'package:alfalPay/Util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../Animations/FadeAnimation.dart';
import '../../../Util/Widgets/inputField.dart';
import '../../../Util/Widgets/primary_button.dart';
import '../../../Util/colors.dart';
import '../../../Util/size_config.dart';

class TransferScreen extends StatelessWidget {
  TransferScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer".tr),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(horizontalPadding)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimation2(
              1,
              InputField(
                controller: walletController.accountNumber,
                label: "Account number".tr,
                hint: "Enter account number".tr,
                type: "Account",
                icon: "assets/icons/Person.svg",
                obscureText: false,
                keyboardType: TextInputType.number,
                enabled: true,
              ),
            ),
            Gap(getProportionateScreenHeight(30)),
            FadeAnimation2(
              1,
              InputField(
                controller: walletController.receiverName,
                label: "Receiver name".tr,
                hint: "Enter receiver number".tr,
                type: "Account",
                icon: "assets/icons/Person.svg",
                obscureText: false,
                keyboardType: TextInputType.number,
                enabled: true,
              ),
            ),
            Gap(getProportionateScreenHeight(30)),
            FadeAnimation2(
              1.1,
              InputField(
                controller: walletController.amount,
                label: "Enter your Amount".tr,
                hint: "Ex:".tr,
                type: "Amount",
                icon: "assets/icons/top-up.svg",
                obscureText: false,
                keyboardType: TextInputType.number,
              ),
            ),
            Gap(getProportionateScreenHeight(40)),
            FadeAnimation(
              1.2,
              PrimaryButton(
                text: "Continue".tr,
                press: () {
                  if (walletController.accountNumber.text.isEmpty) {
                    mainController.SnackBar(
                        "Error".tr,
                        'Please Enter account'.tr,
                        SvgPicture.asset(
                          "assets/icons/Close.svg",
                          color: Colors.white,
                        ),
                        AppColors.error,
                        SnackPosition.TOP,
                        2);
                  }
                  if (walletController.amount.text.isEmpty) {
                    mainController.SnackBar(
                        "Error".tr,
                        'Please Enter amount'.tr,
                        SvgPicture.asset(
                          "assets/icons/Close.svg",
                          color: Colors.white,
                        ),
                        AppColors.error,
                        SnackPosition.TOP,
                        2);
                  }

                  if (walletController.accountNumber.text.isNotEmpty &&
                      walletController.amount.text.isNotEmpty) {
                    walletController
                        .transfer(
                            accountNumber: walletController.accountNumber.text,
                            amount: walletController.amount.text)
                        .then((value) => walletController.amount.text = "");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                hint: "Enter receiver name".tr,
                type: "Account",
                icon: "assets/icons/Person.svg",
                obscureText: false,
                keyboardType: TextInputType.text,
                enabled: true,
              ),
            ),
            Gap(getProportionateScreenHeight(30)),
            FadeAnimation2(
              1,
              InputField(
                controller: walletController.comment,
                label: "Comment".tr,
                hint: "Enter your comment".tr,
                type: "Comment",
                icon: "assets/icons/comment.svg",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
            ),
            Gap(getProportionateScreenHeight(30)),
            FadeAnimation2(
              1.1,
              InputField(
                controller: walletController.amount,
                label: "Enter your Amount".tr,
                hint: "",
                type: "Amount",
                icon: "assets/icons/bag-dollar.svg",
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
                  if (walletController.amount.text.isEmpty) {
                    mainController.snackBar(
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

                  if (walletController.amount.text.isNotEmpty) {
                    walletController.transferData['account_number'] =
                        walletController.accountNumber.text;
                    walletController.transferData['amount'] =
                        walletController.amount.text;
                    walletController.transferData['comment'] =
                        walletController.comment.text;
                    walletController
                        .transfer(transferData: walletController.transferData)
                        .then((value) => {
                              walletController.amount.text = "",
                              walletController.comment.text = "",
                            });
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

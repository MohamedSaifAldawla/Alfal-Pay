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

class AddBeneficiaryScreen extends StatelessWidget {
  AddBeneficiaryScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> addBeneficiariesData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Beneficiary".tr),
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
                controller: beneficiaryController.accountNumber,
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
                controller: beneficiaryController.name,
                label: "Receiver name".tr,
                hint: "Enter receiver number".tr,
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
                controller: beneficiaryController.nickName,
                label: "Nick name".tr,
                hint: "Enter nick name".tr,
                type: "Nick",
                icon: "assets/icons/Person.svg",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
            ),
            Gap(getProportionateScreenHeight(40)),
            FadeAnimation(
              1.2,
              PrimaryButton(
                text: "Continue".tr,
                press: () {
                  if (beneficiaryController.nickName.text.isEmpty) {
                    mainController.snackBar(
                        "Error".tr,
                        'Please Enter nick name'.tr,
                        SvgPicture.asset(
                          "assets/icons/Close.svg",
                          color: Colors.white,
                        ),
                        AppColors.error,
                        SnackPosition.TOP,
                        2);
                  }
                  if (beneficiaryController.nickName.text.isNotEmpty) {
                    addBeneficiariesData['account_number'] =
                        beneficiaryController.accountNumber.text;
                    addBeneficiariesData['name'] =
                        beneficiaryController.name.text;
                    addBeneficiariesData['nick_name'] =
                        beneficiaryController.nickName.text;
                    beneficiaryController
                        .addBeneficiary(
                            addBeneficiariesData: addBeneficiariesData)
                        .then((value) => {
                              beneficiaryController.nickName.text = "",
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

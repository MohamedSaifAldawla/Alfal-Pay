import 'package:alfalPay/Animations/FadeAnimation.dart';
import 'package:alfalPay/Util/Globals/globals.dart';
import 'package:alfalPay/Util/Widgets/Dialogs/delete_dialog.dart';
import 'package:alfalPay/Util/Widgets/beneficiaries_card.dart';
import 'package:alfalPay/Util/Widgets/inputField.dart';
import 'package:alfalPay/Util/Widgets/intro.dart';
import 'package:alfalPay/Util/Widgets/primary_button.dart';
import 'package:alfalPay/Util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../Util/colors.dart';

class BeneficiariesScreen extends StatelessWidget {
  BeneficiariesScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController _accountNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beneficiaries".tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          checkAccountDialog(context);
        },
        backgroundColor: AppColors.kPrimaryColor,
        child: SvgPicture.asset(
          "assets/icons/UserPlus.svg",
          height: getProportionateScreenHeight(30),
          width: getProportionateScreenHeight(30),
          color: AppColors.kPrimaryLightColor,
        ),
      ),
      body: Obx(
        () => Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: beneficiaryController.beneficiaries.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/icons/empty_history.json',
                        width: 350,
                        height: 350,
                        fit: BoxFit.fill,
                      ),
                      BodyText(
                        text: "No Beneficiaries yet".tr,
                        weight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenWidth(25),
                            horizontal: getProportionateScreenWidth(5)),
                        physics: const BouncingScrollPhysics(),
                        itemCount: beneficiaryController.beneficiaries.length,
                        itemBuilder: (context, index) => FadeAnimation(
                          1,
                          BeneficiariesCard(
                            beneficiary:
                                beneficiaryController.beneficiaries[index],
                            transfer: (() {
                              walletController.accountData['account_number'] =
                                  beneficiaryController
                                      .beneficiaries[index].accountNumber;
                              walletController.getAccount(
                                  accountData: walletController.accountData);
                            }),
                            delete: (() {
                              deleteDialog(
                                  context: context,
                                  beneficiary: beneficiaryController
                                      .beneficiaries[index]);
                            }),
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future checkAccountDialog(context) {
    return Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: FadeAnimation2(
          0,
          Dialog(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(getProportionateScreenHeight(20)),
            ),
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.kPrimaryLightColor
                : AppColors.kPrimaryDarkColor,
            child: SizedBox(
              width: double.infinity,
              height: getProportionateScreenHeight(300),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                            _accountNumber.text = '';
                          },
                          icon: SvgPicture.asset(
                            "assets/icons/Close.svg",
                            color: AppColors.error,
                            width: getProportionateScreenWidth(20),
                            height: getProportionateScreenHeight(20),
                          ),
                        ),
                      ],
                    ),
                    BodyText(
                      text: "Add Beneficiary".tr,
                      weight: FontWeight.bold,
                    ),
                    Gap(getProportionateScreenHeight(30)),
                    Container(
                      padding: EdgeInsets.only(
                        left: getProportionateScreenHeight(15),
                        right: getProportionateScreenHeight(15),
                        bottom: getProportionateScreenHeight(10),
                      ),
                      child: Column(
                        children: [
                          FadeAnimation2(
                            1,
                            InputField(
                              controller: _accountNumber,
                              label: "Account number".tr,
                              hint: "Enter account number".tr,
                              type: "Account",
                              icon: "assets/icons/Person.svg",
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
                                if (_accountNumber.text.isEmpty) {
                                  mainController.snackBar(
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

                                if (_accountNumber.text.isNotEmpty) {
                                  beneficiaryController
                                          .accountData['account_number'] =
                                      _accountNumber.text;
                                  beneficiaryController.checkBeneficiary(
                                      accountData:
                                          beneficiaryController.accountData);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
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

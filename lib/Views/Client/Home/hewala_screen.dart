import 'package:alfalPay/Animations/FadeAnimation.dart';
import 'package:alfalPay/Util/Globals/globals.dart';
import 'package:alfalPay/Util/Widgets/inputField.dart';
import 'package:alfalPay/Util/Widgets/intro.dart';
import 'package:alfalPay/Util/Widgets/primary_button.dart';
import 'package:alfalPay/Util/Widgets/services_item.dart';
import 'package:alfalPay/Util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../Util/colors.dart';

class HewalaScreen extends StatelessWidget {
  HewalaScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> hewalaData = {};
  final Map<String, dynamic> receiveData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hewala".tr),
      ),
      body: FadeAnimation2(
        1.7,
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ServicesItem(
                icon: "assets/icons/UserPlus.svg",
                service: "Add Hewala".tr,
                onTap: () {
                  createHewalaDialog(context);
                },
              ),
              ServicesItem(
                icon: "assets/icons/DebitCard.svg",
                service: "Show Hewala".tr,
                size: getProportionateScreenHeight(35),
                onTap: () {
                  hewalaController.getHewala();
                },
              ),
              ServicesItem(
                icon: "assets/icons/DebitCard.svg",
                service: "Receive Hewala".tr,
                size: getProportionateScreenHeight(35),
                onTap: () {
                  receiveHewalaDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createHewalaDialog(context) {
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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                          hewalaController.amount.text = '';
                          hewalaController.comment.text = '';
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
                    text: "Add Hewala".tr,
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
                            controller: hewalaController.amount,
                            label: "Enter your Amount".tr,
                            hint: "Please Enter amount",
                            type: "Amount",
                            icon: "assets/icons/bag-dollar.svg",
                            obscureText: false,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Gap(getProportionateScreenHeight(25)),
                        FadeAnimation2(
                          1.1,
                          InputField(
                            controller: hewalaController.comment,
                            label: "Comment".tr,
                            hint: "Enter your comment".tr,
                            type: "Comment",
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
                              if (hewalaController.amount.text.isEmpty) {
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

                              if (hewalaController.amount.text.isNotEmpty) {
                                hewalaData['amount'] =
                                    hewalaController.amount.text;
                                hewalaData['comment'] =
                                    hewalaController.comment.text;
                                hewalaController.createHewala(
                                    hewalaData: hewalaData);
                              }
                            },
                          ),
                        ),
                        Gap(getProportionateScreenHeight(30)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future receiveHewalaDialog(context) {
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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                          hewalaController.amount.text = '';
                          hewalaController.comment.text = '';
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
                    text: "Receive Hewala".tr,
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
                            controller: hewalaController.serial,
                            label: "Enter Serial".tr,
                            hint: "",
                            type: "Serial",
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
                              if (hewalaController.serial.text.isEmpty) {
                                mainController.snackBar(
                                    "Error".tr,
                                    'Please Enter Serial'.tr,
                                    SvgPicture.asset(
                                      "assets/icons/Close.svg",
                                      color: Colors.white,
                                    ),
                                    AppColors.error,
                                    SnackPosition.TOP,
                                    2);
                              }

                              if (hewalaController.serial.text.isNotEmpty) {
                                receiveData['serial_number'] =
                                    hewalaController.serial.text;
                                hewalaController.receiveHewala(
                                    receiveData: receiveData);
                              }
                            },
                          ),
                        ),
                        Gap(getProportionateScreenHeight(30)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

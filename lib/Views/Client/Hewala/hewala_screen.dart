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
        1,
        Row(
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
              icon: "assets/icons/cashflow.svg",
              service: "Show Hewala".tr,
              size: getProportionateScreenHeight(31),
              onTap: () {
                hewalaController.getHewala();
              },
            ),
            ServicesItem(
              icon: "assets/icons/Receive.svg",
              service: "Receive Hewala".tr,
              onTap: () {
                receiveHewalaDialog(context);
              },
            ),
          ],
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
                          hewalaController.receiverName.text = '';
                          hewalaController.receiverPhone.text = '';
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
                            hint: "",
                            type: "Amount",
                            icon: "assets/icons/bag-dollar.svg",
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Gap(getProportionateScreenHeight(20)),
                        FadeAnimation2(
                          1.1,
                          InputField(
                            controller: hewalaController.comment,
                            label: "Comment".tr,
                            hint: "",
                            type: "Comment",
                            icon: "assets/icons/comment.svg",
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Gap(getProportionateScreenHeight(20)),
                        FadeAnimation2(
                          1.2,
                          InputField(
                            controller: hewalaController.receiverName,
                            label: "Receiver name".tr,
                            hint: "",
                            type: "Account",
                            icon: "assets/icons/Person.svg",
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Gap(getProportionateScreenHeight(20)),
                        FadeAnimation2(
                          1.3,
                          InputField(
                            controller: hewalaController.receiverPhone,
                            label: "Phone".tr,
                            hint: "",
                            icon: "assets/icons/Phone.svg",
                            maxLength: 9,
                            keyboardType: TextInputType.number,
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
                              if (hewalaController.receiverName.text.isEmpty) {
                                mainController.snackBar(
                                    "Error".tr,
                                    "Please Enter receiver name".tr,
                                    SvgPicture.asset(
                                      "assets/icons/Close.svg",
                                      color: Colors.white,
                                    ),
                                    AppColors.error,
                                    SnackPosition.TOP,
                                    2);
                              }
                              if (hewalaController.receiverPhone.text.isEmpty) {
                                mainController.snackBar(
                                    "Error".tr,
                                    "Please Enter receiver phone".tr,
                                    SvgPicture.asset(
                                      "assets/icons/Close.svg",
                                      color: Colors.white,
                                    ),
                                    AppColors.error,
                                    SnackPosition.TOP,
                                    2);
                              }

                              if (hewalaController.amount.text.isNotEmpty &&
                                  hewalaController
                                      .receiverName.text.isNotEmpty &&
                                  hewalaController
                                      .receiverPhone.text.isNotEmpty) {
                                hewalaData['amount'] =
                                    hewalaController.amount.text;
                                hewalaData['comment'] =
                                    hewalaController.comment.text;
                                hewalaData['receiver_name'] =
                                    hewalaController.receiverName.text;
                                hewalaData['receiver_phone'] =
                                    hewalaController.receiverPhone.text;
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
                          hewalaController.serial.text = '';
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

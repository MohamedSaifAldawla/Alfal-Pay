import 'package:alfalPay/Controllers/User/agents_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Controllers/User/main_controller.dart';
import '../../Controllers/User/wallet_controller.dart';
import '../colors.dart';
import '../size_config.dart';

//-------------------------- Controllers -------------------//
final mainController = Get.find<MainController>();
WalletController walletController = Get.find<WalletController>();
AgentsController agentsController = Get.find<AgentsController>();

//-------------------------- Variables -------------------//
String logo = "assets/images/logo.png";
var passLength = 8;
var lang = GetStorage().read("lang");
var isDark = GetStorage().read('isDark');

Future<void> init() async {
  lang = await GetStorage().read("lang");
}

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)),
    borderSide: const BorderSide(color: AppColors.kTextColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)),
    borderSide: const BorderSide(color: AppColors.kTextColor),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)),
    borderSide: const BorderSide(color: AppColors.kTextColor),
  ),
  errorStyle: const TextStyle(height: 0.0),
);

void getThemeMode() async {
  if (isDark == true) {
    Get.changeThemeMode(ThemeMode.dark);
  }
  if (isDark == false) {
    Get.changeThemeMode(ThemeMode.light);
  }
}

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
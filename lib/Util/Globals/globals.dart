import 'package:alfalPay/Controllers/User/agents_controller.dart';
import 'package:alfalPay/Controllers/User/beneficiaries_controller.dart';
import 'package:alfalPay/Controllers/User/hewalas_controller.dart';
import 'package:alfalPay/Controllers/User/transactions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../Controllers/User/main_controller.dart';
import '../../Controllers/User/wallet_controller.dart';
import '../colors.dart';
import '../size_config.dart';

//-------------------------- Controllers -------------------//
final mainController = Get.find<MainController>();
WalletController walletController = Get.find<WalletController>();
AgentsController agentsController = Get.find<AgentsController>();
TransactionsController transController = Get.find<TransactionsController>();
BeneficiariesController beneficiaryController =
    Get.find<BeneficiariesController>();
HewalasController hewalaController = Get.find<HewalasController>();

//-------------------------- Variables -------------------//
String logo = "assets/images/logo.png";
var passLength = 8;
var lang = GetStorage().read("lang");
var isDark = GetStorage().read('isDark');
String appName = '';
String version = '';

Future<void> init() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  appName = packageInfo.appName;
  version = packageInfo.version;
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

import 'package:alfalPay/Controllers/User/base_controller.dart';
import 'package:alfalPay/Util/Globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Services/api.dart';
import '../../Util/colors.dart';
import '../../Views/Client/Home/home_screen.dart';

class WalletController extends GetxController with BaseController {
  bool showDialog = false;
  bool successShowDialog = false;

  //--------------------- Recharge --------------------------//

  Future<void> Recharge({required String serialNumber}) async {
    showLoading();
    var response = await Api.recharge(serialNumber: serialNumber);
    debugPrint("${response.data['status_code']}");
    if (response.data['status_code'] == 0) {
      hideLoading();
      debugPrint("${response.data}");
      Get.offAll(() => const HomeScreen(), transition: Transition.fadeIn);
      mainController.SnackBar(
          "Success".tr,
          "${response.data['message']}",
          SvgPicture.asset(
            "assets/icons/Success2.svg",
            color: Colors.white,
          ),
          AppColors.success,
          SnackPosition.TOP,
          3);
      await GetStorage()
          .write('balance', response.data['current_balance'].toString());
      debugPrint("Balance : ${GetStorage().read("balance")}");
    } else if (response.data['status_code'] == 1) {
      hideLoading();
      debugPrint("${response.data}");
      mainController.SnackBar(
          "Error".tr,
          "${response.data['message']}",
          SvgPicture.asset(
            "assets/icons/Close.svg",
            color: Colors.white,
          ),
          AppColors.error,
          SnackPosition.TOP,
          3);
    }
  } //end of Recharge

  Future<void> Transfer(
      {required String accountNumber, required String amount}) async {
    debugPrint('AccountNumber :$accountNumber');
    debugPrint('Amount :$amount');
    showLoading();
    var response =
        await Api.transfer(accountNumber: accountNumber, amount: amount);
    debugPrint("${response.data['status_code']}");
    if (response.data['status_code'] == 0) {
      hideLoading();
      debugPrint("${response.data}");
      Get.offAll(() => const HomeScreen(), transition: Transition.fadeIn);
      mainController.SnackBar(
          "Success".tr,
          "${response.data['message']}",
          SvgPicture.asset(
            "assets/icons/Success2.svg",
            color: Colors.white,
          ),
          AppColors.success,
          SnackPosition.TOP,
          3);
      successShowDialog = true;
      await GetStorage()
          .write('balance', response.data['current_balance'].toString());
      debugPrint("Balance : ${GetStorage().read("balance")}");
    } else if (response.data['status_code'] == 1) {
      hideLoading();
      debugPrint("${response.data}");
      mainController.SnackBar(
          "Error".tr,
          "${response.data['message']}",
          SvgPicture.asset(
            "assets/icons/Close.svg",
            color: Colors.white,
          ),
          AppColors.error,
          SnackPosition.TOP,
          3);
      successShowDialog = false;
    }
  } //end of Transfer

  //--------------------- showBalance --------------------------//
  Future<void> showBalance() async {
    if (await GetStorage().read("walletIsShow") == true) {
      GetStorage().write("walletIsShow", false);
      debugPrint('${GetStorage().read("walletIsShow")}');
    } else if (await GetStorage().read("walletIsShow") == false) {
      GetStorage().write("walletIsShow", true);
      debugPrint('${GetStorage().read("walletIsShow")}');
    } else {
      GetStorage().write("walletIsShow", true);
      debugPrint('${GetStorage().read("walletIsShow")}');
    }
  }
}
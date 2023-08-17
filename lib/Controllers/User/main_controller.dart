import 'dart:io';
import 'dart:typed_data';
import 'package:alfalPay/Controllers/User/agents_controller.dart';
import 'package:alfalPay/Controllers/User/transactions_controller.dart';
import 'package:alfalPay/Controllers/User/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import '../../Util/Globals/globals.dart';
import '../../Util/colors.dart';

class MainController extends GetxController {
  WalletController walletController = Get.put(WalletController());
  AgentsController agentsController = Get.put(AgentsController());
  TransactionsController transController = Get.put(TransactionsController());

  Locale? language;
  bool darkMode = false;

  //--------------------- Change Lang --------------------------//

  changeLang(String code) async {
    Locale locale = Locale(code);
    GetStorage().write("lang", code);
    Get.updateLocale(locale);
    init();
  }

  //--------------------- Change Theme --------------------------//
  void changeTheme(value) {
    if (value == true) {
      darkMode = true;
      Get.changeThemeMode(ThemeMode.dark);
      GetStorage().write("isDark", true);
    } else if (value == false) {
      darkMode = false;
      Get.changeThemeMode(ThemeMode.light);
      GetStorage().write("isDark", false);
    }
  }

  //--------------------- Save Image --------------------------//
  Future<void> saveImage(Uint8List image) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '_')
        .replaceAll(':', '_');
    final name = "screenshot_$time";
    final result =
        await ImageGallerySaver.saveImage(image, name: name, quality: 100);
    //debugPrint(result['isSuccess'].toString());
    if (result['isSuccess'] == true) {
      debugPrint(result['isSuccess'].toString());
      SnackBar(
          "Success".tr,
          "Saved successfully".tr,
          SvgPicture.asset(
            "assets/icons/Success2.svg",
            color: Colors.white,
          ),
          AppColors.success,
          SnackPosition.TOP,
          3);
    } else {
      SnackBar(
          "Error".tr,
          '$result',
          SvgPicture.asset(
            "assets/icons/Close.svg",
            color: Colors.white,
          ),
          AppColors.error,
          SnackPosition.TOP,
          3);
    }
  }

  //--------------------- Share Image --------------------------//
  Future saveAndShare(Uint8List image) async {
    await [Permission.storage].request().then((value) => {});
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '_')
        .replaceAll(':', '_');
    final name = "screenshot_$time";
    final result =
        await ImageGallerySaver.saveImage(image, name: name, quality: 100);
    if (result['isSuccess'] == true) {
      debugPrint(result['isSuccess'].toString());
      SnackBar(
          "Success".tr,
          "Saved successfully".tr,
          SvgPicture.asset(
            "assets/icons/Success2.svg",
            color: Colors.white,
          ),
          AppColors.success,
          SnackPosition.TOP,
          3);
      final directory = await getApplicationDocumentsDirectory();
      final sharedImage = File('${directory.path}/flutter.png');
      sharedImage.writeAsBytesSync(image);
      await Share.shareXFiles([XFile(sharedImage.path)]);
    } else {
      SnackBar(
          "Error".tr,
          '$result',
          SvgPicture.asset(
            "assets/icons/Close.svg",
            color: Colors.white,
          ),
          AppColors.error,
          SnackPosition.TOP,
          3);
    }
  }

  @override
  void onInit() async {
    debugPrint(lang);
    debugPrint("isDark:$isDark");
    if (isDark == true) {
      darkMode = true;
    }
    if (isDark == false || isDark == null) {
      darkMode = false;
    }
    if (lang == "ar") {
      language = const Locale("ar");
    } else if (lang == "en") {
      language = const Locale("en");
    } else {
      GetStorage().write("walletIsShow", true);
      language = Locale(Get.deviceLocale!.languageCode);
      Get.changeThemeMode(ThemeMode.light);
    }

    super.onInit();
  }

  //--------------------- Snack Bar --------------------------//
  // ignore: non_constant_identifier_names
  SnackbarController SnackBar(String title, String message, Widget icon,
      Color backgroundColor, SnackPosition? snackPosition, int duration) {
    return Get.snackbar(
      title,
      message,
      icon: icon,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      borderRadius: 20,
      duration: Duration(seconds: duration),
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      dismissDirection: DismissDirection.vertical,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}

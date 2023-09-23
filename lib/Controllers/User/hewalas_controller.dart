import 'package:alfalPay/Controllers/User/base_controller.dart';
import 'package:alfalPay/Models/hewalas.dart';
import 'package:alfalPay/Util/Globals/globals.dart';
import 'package:alfalPay/Views/Client/Hewala/show_hewala_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Services/api.dart';
import '../../Util/colors.dart';

class HewalasController extends GetxController with BaseController {
  List<Hewalas> hewala = <Hewalas>[].obs;
  final TextEditingController comment = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController receiverName = TextEditingController();
  final TextEditingController receiverPhone = TextEditingController();
  final TextEditingController serial = TextEditingController();
  final TextEditingController phone = TextEditingController();

  //--------------------- Get Hewala --------------------------//
  Future<void> getHewala() async {
    showLoading();
    var response = await Api.getHewala();
    debugPrint("${response.data}");
    if (response.data['status_code'] == 0) {
      if (response.data['data'].isNotEmpty) {
        hideLoading();
        final res = HewalaList.fromJson(response.data);
        debugPrint("$res");
        hewala.clear();
        hewala.addAll(res.data.data);
        debugPrint("$hewala");
        Get.to(() => const ShowHewalaScreen(), transition: Transition.fadeIn);
      }
      if (response.data['data'].isEmpty) {
        hideLoading();
        hewala.clear();
        Get.to(() => const ShowHewalaScreen(), transition: Transition.fadeIn);
      }
    } else if (response.data['status_code'] == 1) {
      hideLoading();
      debugPrint("${response.data}");
      mainController.snackBar(
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
  } //end of Get Hewala

  //--------------------- Create Hewala --------------------------//
  Future<void> createHewala({required Map<String, dynamic> hewalaData}) async {
    showLoading();
    debugPrint('$hewalaData');
    var response = await Api.createHewala(hewalaData: hewalaData);
    debugPrint("${response.data}");
    if (response.data['status_code'] == 0) {
      hideLoading();
      mainController.snackBar(
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
      amount.text = '';
      comment.text = '';
      receiverName.text = '';
      receiverPhone.text = '';
    } else if (response.data['status_code'] == 1) {
      hideLoading();
      mainController.snackBar(
          "Error".tr,
          '${response.data['message']}',
          SvgPicture.asset(
            "assets/icons/Close.svg",
            color: Colors.white,
          ),
          AppColors.error,
          SnackPosition.TOP,
          3);
    }
  } //end of Create Hewala

  //--------------------- Receive Hewala --------------------------//
  Future<void> receiveHewala(
      {required Map<String, dynamic> receiveData}) async {
    showLoading();
    debugPrint('$receiveData');
    var response = await Api.receiveHewala(receiveData: receiveData);
    debugPrint("${response.data}");
    if (response.data['status_code'] == 0) {
      hideLoading();
      mainController.snackBar(
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

      hewalaController.serial.text = '';
      hewalaController.phone.text = '';
    } else if (response.data['status_code'] == 1) {
      hideLoading();
      mainController.snackBar(
          "Error".tr,
          '${response.data['message']}',
          SvgPicture.asset(
            "assets/icons/Close.svg",
            color: Colors.white,
          ),
          AppColors.error,
          SnackPosition.TOP,
          3);
    }
  } //end of Receive Hewala
}

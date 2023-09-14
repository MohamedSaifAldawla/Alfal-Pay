import 'package:alfalPay/Controllers/User/base_controller.dart';
import 'package:alfalPay/Models/beneficiaries.dart';
import 'package:alfalPay/Util/Globals/globals.dart';
import 'package:alfalPay/Views/Client/Home/add_beneficiary_screen.dart';
import 'package:alfalPay/Views/Client/Home/beneficiaries_screen.dart';
import 'package:alfalPay/Views/Client/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Services/api.dart';
import '../../Util/colors.dart';

class BeneficiariesController extends GetxController with BaseController {
  List<Beneficiaries> beneficiaries = <Beneficiaries>[].obs;
  final TextEditingController accountNumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController nickName = TextEditingController();
  final Map<String, dynamic> accountData = {};

  //--------------------- Get Beneficiaries --------------------------//
  Future<void> getBeneficiaries() async {
    showLoading();
    var response = await Api.getBeneficiaries();
    debugPrint("${response.data}");
    if (response.data['status_code'] == 0) {
      if (response.data['data'].isNotEmpty) {
        hideLoading();
        final res = BeneficiariesList.fromJson(response.data);
        debugPrint("$res");
        beneficiaries.clear();
        beneficiaries.addAll(res.data!.data);
        debugPrint("$beneficiaries");
        Get.to(() => BeneficiariesScreen(), transition: Transition.fadeIn);
      }
      if (response.data['data'].isEmpty) {
        hideLoading();
        beneficiaries.clear();
        Get.to(() => BeneficiariesScreen(), transition: Transition.fadeIn);
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
  } //end of Get Beneficiaries

  //--------------------- Get Beneficiaries --------------------------//
  Future<void> getBeneficiaries2() async {
    showLoading();
    var response = await Api.getBeneficiaries();
    //debugPrint("${response.data}");
    if (response.data['status_code'] == 0) {
      if (response.data['data'].isNotEmpty) {
        final res = BeneficiariesList.fromJson(response.data);
        debugPrint("$res");
        hideLoading();
        beneficiaries.clear();
        beneficiaries.addAll(res.data!.data);
        debugPrint("$beneficiaries");
      }
      if (response.data['data'].isEmpty) {
        hideLoading();
        beneficiaries.clear();
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
  } //end of Get Beneficiaries

  //--------------------- Get Account --------------------------//
  Future<void> checkBeneficiary(
      {required Map<String, dynamic> accountData}) async {
    showLoading();
    debugPrint('$accountData');
    var response = await Api.getAccount(accountData: accountData);
    debugPrint("${response.data}");
    if (response.data['status_code'] == 0) {
      hideLoading();
      accountNumber.text = response.data['account_number'];
      name.text = response.data['receiver_name'];
      Get.to(() => AddBeneficiaryScreen(), transition: Transition.fadeIn);
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
  } //end of Get Account

  //--------------------- Add Beneficiary --------------------------//
  Future<void> addBeneficiary(
      {required Map<String, dynamic> addBeneficiariesData}) async {
    showLoading();
    debugPrint('$addBeneficiariesData');
    var response =
        await Api.addBeneficiary(addBeneficiariesData: addBeneficiariesData);
    debugPrint("${response.data}");
    if (response.data['status_code'] == 0) {
      hideLoading();
      Get.to(() => const HomeScreen(), transition: Transition.fadeIn);
      mainController.snackBar(
          "Success".tr,
          "${response.data['nick_name']}",
          SvgPicture.asset(
            "assets/icons/Success2.svg",
            color: Colors.white,
          ),
          AppColors.success,
          SnackPosition.TOP,
          3);
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
  } //end of Add Beneficiary

  //---------------------  Delete Beneficiary --------------------------//
  Future<void> deleteBeneficiary({required int beneficiaryId}) async {
    showLoading();
    debugPrint("$beneficiaryId");
    var response = await Api.deleteBeneficiary(beneficiaryId: beneficiaryId);
    debugPrint("${response.data}");
    if (response.data['status_code'] == 0) {
      hideLoading();
      getBeneficiaries2();
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
  } //end of Delete Beneficiary
}

import 'package:alfalPay/Controllers/User/base_controller.dart';
import 'package:alfalPay/Models/transactions.dart';
import 'package:alfalPay/Util/Globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Services/api.dart';
import '../../Util/colors.dart';
import '../../Views/Client/History/history_screen.dart';

class TransactionsController extends GetxController with BaseController {
  List<TransactionList> transactions = <TransactionList>[].obs;
  var isLoading = false.obs;

  //--------------------- Get Transactions --------------------------//
  Future<void> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    showLoading();
    var response =
        await Api.getTransactions(startDate: startDate, endDate: endDate);
    final res = Transactions.fromJson(response.data);
    // debugPrint("${res.data.data}");
    //debugPrint("${response.data['data']['data']}");
    if (response.data['status_code'] == 0) {
      hideLoading();
      transactions.clear();
      transactions.addAll(res.data.data);
      debugPrint("$transactions");
      Get.to(() => HistoryScreen(), transition: Transition.fadeIn);
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
  } //end of Get Transactions

  //--------------------- Get Transactions --------------------------//
  Future<void> getTransactions2({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    isLoading.value = true;
    var response =
        await Api.getTransactions(startDate: startDate, endDate: endDate);
    final res = Transactions.fromJson(response.data);
    if (response.data['status_code'] == 0) {
      transactions.clear();
      transactions.addAll(res.data.data);
      debugPrint("$transactions");
      isLoading.value = false;
    } else if (response.data['status_code'] == 1) {
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
  } //end of Get Transactions
}

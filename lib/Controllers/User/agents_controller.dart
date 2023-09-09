import 'package:alfalPay/Controllers/User/base_controller.dart';
import 'package:alfalPay/Models/agents.dart';
import 'package:alfalPay/Util/Globals/globals.dart';
import 'package:alfalPay/Views/Client/Agents/agents_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Services/api.dart';
import '../../Util/colors.dart';

class AgentsController extends GetxController with BaseController {
  List<Datum> agents = <Datum>[].obs;

  //--------------------- Get Agents --------------------------//
  Future<void> getAgents() async {
    showLoading();
    var response = await Api.getAgents();
    final res = Agents.fromJson(response.data);
    // debugPrint("${res.data.data}");
    //debugPrint("${response.data['data']['data']}");
    if (response.data['status_code'] == 0) {
      hideLoading();
      agents.clear();
      agents.addAll(res.data.data);
      debugPrint("$agents");
      Get.to(() => const AgentsScreen(), transition: Transition.fadeIn);
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
  } //end of Get Agents
}

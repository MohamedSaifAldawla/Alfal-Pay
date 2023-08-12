import 'package:alfalPay/Util/colors.dart';
import 'package:alfalPay/Views/Client/Profile/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Models/user.dart';
import '../../Services/api.dart';
import '../../Views/Auth/login_screen.dart';
import '../../Views/Client/Home/home_screen.dart';
import '../../routes.dart';
import 'base_controller.dart';

class AuthController extends GetxController with BaseController {
  final user = User().obs;
  var isLoggedIn = false.obs;
  var passLength = 8;
  var otpPhone = "";

  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  DateTime selectedDate = DateTime.now();

//--------------------- Login --------------------------//
  Future<void> login({required Map<String, dynamic> loginData}) async {
    showLoading();
    debugPrint('$loginData');
    var response = await Api.login(loginData: loginData);
    user.value = User.fromJson(response.data);
    debugPrint(user.value.customerName);
    if (user.value.statusCode == 0) {
      await SaveUserData(user);
      isLoggedIn.value = true;
      hideLoading();
      Get.off(() => const HomeScreen(), transition: Transition.fadeIn);
    } else if (user.value.statusCode == 1) {
      hideLoading();
      SnackBar(
          "Error".tr,
          '${user.value.error}',
          SvgPicture.asset(
            "assets/icons/Close.svg",
            color: Colors.white,
          ),
          AppColors.error,
          SnackPosition.TOP);
    }
  } //end of login

  //--------------------- Register --------------------------//
  Future<void> register({required Map<String, dynamic> registerData}) async {
    showLoading();
    debugPrint('$registerData');
    var response = await Api.register(registerData: registerData);
    user.value = User.fromJson(response.data);
    if (user.value.statusCode == 0) {
      hideLoading();
      SnackBar(
          "Success".tr,
          "${user.value.message}",
          SvgPicture.asset(
            "assets/icons/Success2.svg",
            color: Colors.white,
          ),
          AppColors.success,
          SnackPosition.TOP);
      await SaveUserData(user);
      isLoggedIn.value = true;
    }
    if (user.value.statusCode == 1) {
      hideLoading();
      SnackBar(
          "Error".tr,
          '${user.value.error}',
          SvgPicture.asset(
            "assets/icons/Close.svg",
            color: Colors.white,
          ),
          AppColors.error,
          SnackPosition.TOP);
    }
  } //end of register

  //--------------------- Profile Show --------------------------//
  Future<void> profileShow() async {
    showLoading();
    try {
      var response = await Api.profileShow();
      debugPrint("${response.data['data']['id']}");
      if (response.data['data']['id'] != null) {
        hideLoading();
        usernameController.text = response.data['data']['name'].toString();
        phoneController.text = response.data['data']['phone'].toString();
        addressController.text = response.data['data']['address'].toString();
        emailController.text = response.data['data']['email'].toString();
        if (response.data['data']['date_of_birth'] != null) {
          selectedDate =
              DateTime.tryParse(response.data['data']['date_of_birth'])!;
        }
        Get.to(() => const EditScreen(), transition: Transition.fadeIn);
      }
    } catch (e) {
      hideLoading();
      debugPrint("$e");
      SnackBar(
          "Error".tr,
          '$e',
          SvgPicture.asset(
            "assets/icons/Close.svg",
            color: Colors.white,
          ),
          AppColors.error,
          SnackPosition.TOP);
    }
  } //end of Profile Show

  //--------------------- Profile Update --------------------------//
  Future<void> profileUpdate(
      {required Map<String, dynamic> profileUpdateData}) async {
    showLoading();
    debugPrint('$profileUpdateData');
    var response =
        await Api.profileUpdate(profileUpdateData: profileUpdateData);
    debugPrint("${response.data['status_code']}");
    if (response.data['status_code'] == 0) {
      hideLoading();
      SnackBar(
          "Success".tr,
          "${response.data['message']}",
          SvgPicture.asset(
            "assets/icons/Success2.svg",
            color: Colors.white,
          ),
          AppColors.success,
          SnackPosition.TOP);
    }
    if (response.data['status_code'] == 1) {
      hideLoading();
      SnackBar(
          "Error".tr,
          '${response.data['message']}',
          SvgPicture.asset(
            "assets/icons/Close.svg",
            color: Colors.white,
          ),
          AppColors.error,
          SnackPosition.TOP);
    }
  } //end of Profile Update

  //--------------------- Password Update --------------------------//
  Future<void> passwordUpdate(
      {required Map<String, dynamic> passwordUpdateData}) async {
    showLoading();
    debugPrint('$passwordUpdateData');
    var response =
        await Api.passwordUpdate(passwordUpdateData: passwordUpdateData);
    debugPrint("${response.data['status_code']}");
    if (response.data['status_code'] == 0) {
      hideLoading();
      SnackBar(
          "Success".tr,
          "${response.data['message']}",
          SvgPicture.asset(
            "assets/icons/Success2.svg",
            color: Colors.white,
          ),
          AppColors.success,
          SnackPosition.TOP);
    }
    if (response.data['status_code'] == 1) {
      hideLoading();
      SnackBar(
          "Error".tr,
          '${response.data['message']}',
          SvgPicture.asset(
            "assets/icons/Close.svg",
            color: Colors.white,
          ),
          AppColors.error,
          SnackPosition.TOP);
    }
  } //end of Password Update

//--------------------- Check Token --------------------------//

  // Future<void> CheckToken2() async {
  //   if (await GetStorage().read('login_token') == null) {
  //     print("No Token");
  //   } else if (await GetStorage().read('login_token') != null) {
  //     var response = await Api.ValidToken(uid: GetStorage().read("id"));
  //     print("Token : $response");
  //     final res = json.decode(response.data);
  //     if (res['message'] == 'invalid token') {
  //       await GetStorage().remove('login_token');
  //     }
  //   }
  //}

//--------------------- LogOut --------------------------//
  Future<void> logout() async {
    Future.wait(
      [
        GetStorage().remove('id'),
        GetStorage().remove('name'),
        GetStorage().remove('balance'),
        GetStorage().remove('login_token'),
        GetStorage().write("walletIsShow", true),
      ],
    );
    isLoggedIn.value = false;
    debugPrint("Token : ${GetStorage().read("login_token")}");
    Get.offAll(() => const LoginScreen(), transition: Transition.fadeIn);
  } //end of logout

//--------------------- User Local Storage Saving --------------------------//

  SaveUserData(Rx<User> user) async {
    Future.wait(
      [
        GetStorage().write('id', user.value.accountNumber),
        GetStorage().write('name', user.value.customerName),
        GetStorage().write('balance', user.value.balance),
        GetStorage().write('profilePic', user.value.profilePic),
        GetStorage().write('login_token', user.value.token),
      ],
    );
  }

//--------------------- Snack Bar --------------------------//
  SnackbarController SnackBar(String title, String message, Widget icon,
      Color backgroundColor, SnackPosition? snackPosition) {
    return Get.snackbar(
      title,
      message,
      icon: icon,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      borderRadius: 20,
      duration: const Duration(seconds: 5),
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      dismissDirection: DismissDirection.startToEnd,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
} //end of controller

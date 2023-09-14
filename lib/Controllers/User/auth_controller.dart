import 'package:alfalPay/Util/Globals/globals.dart';
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
import 'base_controller.dart';

class AuthController extends GetxController with BaseController {
  final user = User().obs;
  var isLoggedIn = false.obs;
  var passLength = 8;
  var otpPhone = "";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController thirdNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  DateTime selectedDate = DateTime.now();

//--------------------- Login --------------------------//
  Future<void> login({required Map<String, dynamic> loginData}) async {
    showLoading();
    debugPrint('$loginData');
    var response = await Api.login(loginData: loginData);
    debugPrint('LoginData :$response');
    user.value = User.fromJson(response.data);
    debugPrint(user.value.fullName);
    if (user.value.statusCode == 0) {
      await saveUserData(user);
      isLoggedIn.value = true;
      hideLoading();
      Get.off(() => const HomeScreen(), transition: Transition.fadeIn);
    } else if (user.value.statusCode == 1) {
      hideLoading();
      snackBar(
          "Error".tr,
          '${user.value.message}',
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
    debugPrint('RegisterData :$response');
    user.value = User.fromJson(response.data);
    if (user.value.statusCode == 0) {
      hideLoading();
      mainController.snackBar(
          "Success".tr,
          "${user.value.message}",
          SvgPicture.asset(
            "assets/icons/Success2.svg",
            color: Colors.white,
          ),
          AppColors.success,
          SnackPosition.TOP,
          20);
      await saveUserData(user);
      isLoggedIn.value = true;
      Get.offAll(() => const LoginScreen(), transition: Transition.fadeIn);
    }
    if (user.value.statusCode == 1) {
      hideLoading();
      snackBar(
          "Error".tr,
          '${user.value.message}',
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
      debugPrint("${response.data['data']}");
      if (response.data['data']['id'] != null) {
        hideLoading();
        firstNameController.text =
            response.data['data']['first_name'].toString();
        secondNameController.text =
            response.data['data']['second_name'].toString();
        thirdNameController.text =
            response.data['data']['third_name'].toString();
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
      snackBar(
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
      snackBar(
          "Success".tr,
          "${response.data['message']}",
          SvgPicture.asset(
            "assets/icons/Success2.svg",
            color: Colors.white,
          ),
          AppColors.success,
          SnackPosition.TOP);
      Get.offAll(() => const LoginScreen(), transition: Transition.fadeIn);
    }
    if (response.data['status_code'] == 1) {
      hideLoading();
      snackBar(
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
      snackBar(
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
      snackBar(
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
        GetStorage().remove('full_name'),
        GetStorage().remove('first_name'),
        GetStorage().remove('second_name'),
        GetStorage().remove('phone_number'),
        GetStorage().remove('balance'),
        GetStorage().remove('login_token'),
        GetStorage().remove('type'),
        GetStorage().remove('referralCode'),
        GetStorage().write("walletIsShow", true),
      ],
    );
    isLoggedIn.value = false;
    debugPrint("Token : ${GetStorage().read("login_token")}");
    Get.offAll(() => const LoginScreen(), transition: Transition.fadeIn);
  } //end of logout

//--------------------- User Local Storage Saving --------------------------//

  saveUserData(Rx<User> user) async {
    Future.wait(
      [
        GetStorage().write('id', user.value.accountNumber),
        GetStorage().write('full_name', user.value.fullName),
        GetStorage().write('first_name', user.value.firstName),
        GetStorage().write('second_name', user.value.secondName),
        GetStorage().write('phone_number', user.value.phoneNumber),
        GetStorage().write('balance', user.value.balance),
        GetStorage().write('profilePic', user.value.profilePic),
        GetStorage().write('type', user.value.type),
        GetStorage().write('referralCode', user.value.referralCode),
        GetStorage().write('login_token', user.value.token),
      ],
    );
  }

//--------------------- Snack Bar --------------------------//
  SnackbarController snackBar(String title, String message, Widget icon,
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

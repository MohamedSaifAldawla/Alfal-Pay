import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GET;
import 'package:get_storage/get_storage.dart';

class Api {
  static final dio = Dio(
    BaseOptions(
      baseUrl: 'http://fal.dev-online.net/api',
      receiveDataWhenStatusError: true,
    ),
  );

  //--------------------- initializeInterceptors --------------------------//
  static void initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          var headers = {
            'accept': 'application/json',
            'content-Type': 'application/x-www-form-urlencoded',
            'App-Language': GetStorage().read("lang"),
            'Authorization': 'Bearer ${GetStorage().read("login_token")}',
          };

          request.headers.addAll(headers);
          debugPrint('${request.method} ${request.path}');
          debugPrint('${request.headers}');

          return handler.next(request); //continue
        },
        onResponse: (response, handler) {
          //debugPrint(response.data);
          // final Map res = json.decode(response.data);
          // print(res);

          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          if (GET.Get.isDialogOpen == true) {
            GET.Get.back();
          }
          if (e.error is SocketException) {
            GET.Get.snackbar(
              'Erorr',
              'Connection lost'.tr,
              //'${e.error.message}',
              icon: SvgPicture.asset(
                "assets/icons/Close.svg",
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              borderRadius: 20,
              duration: const Duration(seconds: 5),
              snackPosition: GET.SnackPosition.TOP,
              backgroundColor: const Color(0xFFE84C5C),
              colorText: Colors.white,
              dismissDirection: DismissDirection.horizontal,
              forwardAnimationCurve: Curves.easeOutBack,
            );
          } else if (e.error is HttpException) {
            GET.Get.snackbar(
              'Erorr',
              'Bad Connection'.tr,
              //'${e.error.message}',
              icon: SvgPicture.asset(
                "assets/icons/Close.svg",
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              borderRadius: 20,
              duration: const Duration(seconds: 5),
              snackPosition: GET.SnackPosition.TOP,
              backgroundColor: const Color(0xFFE84C5C),
              colorText: Colors.white,
              dismissDirection: DismissDirection.horizontal,
              forwardAnimationCurve: Curves.easeOutBack,
            );
          } else if (e.type == DioErrorType.connectTimeout) {
            GET.Get.snackbar(
              'Erorr',
              'Connection time out'.tr,
              //'${e.error.message}',
              icon: SvgPicture.asset(
                "assets/icons/Close.svg",
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              borderRadius: 20,
              duration: const Duration(seconds: 5),
              snackPosition: GET.SnackPosition.TOP,
              backgroundColor: const Color(0xFFE84C5C),
              colorText: Colors.white,
              dismissDirection: DismissDirection.horizontal,
              forwardAnimationCurve: Curves.easeOutBack,
            );
          }

          throw e.error;
        },
      ),
    );
  } // end of initializeInterceptor

//--------------------- User Operations --------------------------//
//--------------------- Login --------------------------//
  static Future<Response> login({loginData}) async {
    FormData formData = FormData.fromMap(loginData);
    return dio.post('/login', data: formData);
  } //end of login

  //--------------------- Login --------------------------//
  static Future<Response> logOut() async {
    return dio.post('/logout');
  } //end of logOut

//--------------------- Register --------------------------//
  static Future<Response> register({registerData}) async {
    FormData formData = FormData.fromMap(registerData);
    return dio.post('/register', data: formData);
  } //end of register

  //--------------------- Profile Show --------------------------//
  static Future<Response> profileShow() async {
    return dio.get('/profile');
  } //end of Profile Show

  //--------------------- Profile Update --------------------------//
  static Future<Response> profileUpdate({profileUpdateData}) async {
    FormData formData = FormData.fromMap(profileUpdateData);
    return dio.post('/profile/update', data: formData);
  } //end of Profile Update

  //--------------------- Password Update --------------------------//
  static Future<Response> passwordUpdate({passwordUpdateData}) async {
    FormData formData = FormData.fromMap(passwordUpdateData);
    return dio.post('/profile/password-update', data: formData);
  } //end of Password Update

//-------------------------- Wallet Operations --------------------------//

  //--------------------- Get Account --------------------------//
  static Future<Response> getAccount({accountData}) async {
    FormData formData = FormData.fromMap(accountData);
    return dio.post('/balance-transfer-check', data: formData);
  } //end of Get Account

  //--------------------- Recharge --------------------------//
  static Future<Response> recharge({
    required String serialNumber,
  }) async {
    FormData formData = FormData.fromMap(
      {
        'serial_number': serialNumber,
      },
    );
    return dio.post('/recharge', data: formData);
  } //end of Recharge

  //--------------------- Transfer --------------------------//
  static Future<Response> transfer({required transferData}) async {
    FormData formData = FormData.fromMap(transferData);
    return dio.post('/balance-transfer-confirm', data: formData);
  } //end of Transfer

  //--------------------- Get Agents --------------------------//
  static Future<Response> getAgents() async {
    return dio.get('/agent-list');
  } //end of Get Agents

  //-------------------------- Transactions Operations --------------------------//

  //--------------------- Get Transactions --------------------------//
  static Future<Response> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    return dio.get('/my-transactions', queryParameters: {
      'start_date': startDate,
      'end_date': endDate,
    });
  } //end of Get Transactions
} //end of api

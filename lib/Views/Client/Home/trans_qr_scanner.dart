import 'dart:io';
import 'package:alfalPay/Util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../Animations/FadeAnimation.dart';
import '../../../Util/Globals/globals.dart';
import '../../../Util/Widgets/form_error.dart';
import '../../../Util/Widgets/inputField.dart';
import '../../../Util/Widgets/intro.dart';
import '../../../Util/Widgets/primary_button.dart';
import '../../../Util/size_config.dart';
import 'home_screen.dart';

class TransferQR extends StatefulWidget {
  const TransferQR({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransferQRState();
}

class _TransferQRState extends State<TransferQR> {
  final formKey = GlobalKey<FormState>();
  final _accountNumber = TextEditingController();
  final _amount = TextEditingController();
  String? accountNumber;
  String? scannedQR;
  String? amount;
  Barcode? barcode;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(color: AppColors.kPrimaryLightColor),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildQrView(context),
          ),
        ],
      ),
    );
  }

  Future transferDialog(context) {
    return Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: FadeAnimation(
          1,
          Dialog(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(getProportionateScreenHeight(20)),
            ),
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.kPrimaryLightColor
                : AppColors.kPrimaryDarkColor,
            child: SizedBox(
              width: double.infinity,
              height: getProportionateScreenHeight(390),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                            reassemble();
                          },
                          icon: SvgPicture.asset(
                            "assets/icons/Close.svg",
                            color: AppColors.error,
                            width: getProportionateScreenWidth(20),
                            height: getProportionateScreenHeight(20),
                          ),
                        ),
                      ],
                    ),
                    BodyText(
                      text: "Transfer".tr,
                      weight: FontWeight.bold,
                    ),
                    Gap(getProportionateScreenHeight(30)),
                    Container(
                      padding: EdgeInsets.only(
                        left: getProportionateScreenHeight(15),
                        right: getProportionateScreenHeight(15),
                        bottom: getProportionateScreenHeight(10),
                      ),
                      child: Column(
                        children: [
                          FadeAnimation(
                            1,
                            InputField(
                              controller: _accountNumber,
                              label: "Account number".tr,
                              hint: "Enter account number".tr,
                              type: "Account",
                              icon: "assets/icons/Person.svg",
                              obscureText: false,
                              enabled: true,
                              keyboardType: TextInputType.number,
                              onSaved: (newValue) => accountNumber = newValue,
                            ),
                          ),
                          Gap(getProportionateScreenHeight(30)),
                          FadeAnimation2(
                            1.1,
                            InputField(
                              controller: _amount,
                              label: "Enter your Amount".tr,
                              hint: "Ex:".tr,
                              type: "Amount",
                              icon: "assets/icons/top-up.svg",
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              onSaved: (newValue) => amount = newValue,
                            ),
                          ),
                          Gap(getProportionateScreenHeight(40)),
                          FadeAnimation(
                            1.2,
                            PrimaryButton(
                              text: "Continue".tr,
                              press: () {
                                if (_accountNumber.text.isEmpty) {
                                  mainController.SnackBar(
                                      "Error".tr,
                                      'Please Enter account'.tr,
                                      SvgPicture.asset(
                                        "assets/icons/Close.svg",
                                        color: Colors.white,
                                      ),
                                      AppColors.error,
                                      SnackPosition.TOP,
                                      2);
                                }
                                if (_amount.text.isEmpty) {
                                  mainController.SnackBar(
                                      "Error".tr,
                                      'Please Enter amount'.tr,
                                      SvgPicture.asset(
                                        "assets/icons/Close.svg",
                                        color: Colors.white,
                                      ),
                                      AppColors.error,
                                      SnackPosition.TOP,
                                      2);
                                }

                                if (_accountNumber.text.isNotEmpty &&
                                    _amount.text.isNotEmpty) {
                                  walletController.Transfer(
                                          accountNumber: _accountNumber.text,
                                          amount: _amount.text)
                                      .then(
                                    (value) {
                                      if (walletController.successShowDialog ==
                                          true) {
                                        debugPrint("true");
                                      } else if (walletController
                                              .successShowDialog ==
                                          false) {
                                        debugPrint("false");
                                        reassemble();
                                      }
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: AppColors.kPrimaryColor,
        borderLength: 20,
        borderWidth: 10,
        borderRadius: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
      reassemble();
    });
    controller.scannedDataStream.listen(
      (scanData) {
        barcode = scanData;
        scannedQR = barcode!.code;
        controller.pauseCamera();
        debugPrint(scannedQR);
        transferDialog(context);
        _accountNumber.text = scannedQR!;
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    _accountNumber.dispose();
    _amount.dispose();
    super.dispose();
  }
}

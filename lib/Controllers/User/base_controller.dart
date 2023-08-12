import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Util/Widgets/loader.dart';

mixin BaseController {
  void showLoading() {
    Get.dialog(
      //barrierColor: Colors.white70,
      const Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.symmetric(horizontal: 150),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(100),
        //   ),
        // ),
        child: SizedBox(
          child: Loader(),
        ),
      ),
      barrierDismissible: false,
    );
  } //end of showLoading

  void hideLoading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  } //end of closeLoading
}

 //end of controller

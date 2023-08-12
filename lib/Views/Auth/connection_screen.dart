import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restart_app/restart_app.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../Util/Widgets/intro.dart';
import '../../Util/Widgets/primary_button.dart';

class ConnectionScreen extends StatelessWidget {
  const ConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeAnimation(
                1,
                Lottie.asset(
                  'assets/icons/no-connection.json',
                  width: 350,
                  height: 350,
                  fit: BoxFit.fill,
                ),
              ),
              const Gap(30),
              FadeAnimation(
                1.1,
                BodyText(
                  text: "No connection".tr,
                  weight: FontWeight.bold,
                  fontSize: 18,
                  maxLines: 3,
                ),
              ),
              const Gap(30),
              FadeAnimation(
                1.2,
                PrimaryButton(
                  text: "Restart app".tr,
                  press: () {
                    Restart.restartApp();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

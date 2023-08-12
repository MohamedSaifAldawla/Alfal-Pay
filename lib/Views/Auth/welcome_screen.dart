import 'package:alfalPay/Views/Auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';
import '../../Util/Globals/globals.dart';
import '../../Util/Widgets/WaveClipper.dart';
import '../../Util/Widgets/primary_button.dart';
import '../../Util/colors.dart';
import '../../routes.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            waveClipper(),
            Container(
              padding: EdgeInsets.only(
                right: horizontalPadding,
                left: horizontalPadding,
                top: 100,
                bottom: 100,
              ),
              child: Center(
                child: Column(
                  children: [
                    FadeAnimation(
                      1.1,
                      Hero(
                        tag: "image",
                        child: Image.asset(
                          logo,
                          height: getProportionateScreenHeight(200),
                          width: getProportionateScreenWidth(200),
                        ),
                      ),
                    ),
                    //Gap(getProportionateScreenWidth(250)),
                    const Spacer(),
                    FadeAnimation2(
                      1.4,
                      PrimaryButton(
                        text: "Login".tr,
                        press: (() => Get.toNamed(Routes.login)),
                      ),
                    ),
                    Gap(getProportionateScreenHeight(15)),
                    FadeAnimation(
                      1.5,
                      PrimaryButton(
                        text: "Register".tr,
                        color: Colors.white,
                        textcolor: AppColors.kPrimaryColor,
                        press: (() => Get.to(() => const RegisterScreen(),
                            transition: Transition.fadeIn)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
        // const TopBar(
        //     img: "assets/images/logo.png",
        //     text1: "Onboarding1",
        //     text2: "Onboarding2"),

        );
  }
}

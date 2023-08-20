import 'package:alfalPay/Views/Auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';
import '../../Util/Globals/globals.dart';
import '../../Util/Widgets/Dialogs/lang_dialog.dart';
import '../../Util/Widgets/WaveClipper.dart';
import '../../Util/Widgets/services_item.dart';
import '../../Util/colors.dart';
import '../Client/Home/currency_screen.dart';
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
        actions: [
          InkWell(
            onTap: () {
              langDialog(
                context: context,
                onTap1: () {
                  mainController.changeLang("en");
                  Get.back();
                },
                onTap2: () {
                  mainController.changeLang("ar");
                  Get.back();
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(15)),
              child: SvgPicture.asset(
                "assets/icons/lang.svg",
                height: getProportionateScreenHeight(20),
                width: getProportionateScreenHeight(20),
                color: AppColors.kPrimaryLightColor,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          waveClipper(),
          Center(
            child: Container(
              padding: EdgeInsets.only(
                right: horizontalPadding,
                left: horizontalPadding,
                top: getProportionateScreenHeight(100),
                bottom: getProportionateScreenHeight(60),
              ),
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
                  const Spacer(),
                  FadeAnimation(
                    1.2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ServicesItem(
                          icon: "assets/icons/Login.svg",
                          service: "Login".tr,
                          cWidth: getProportionateScreenWidth(90),
                          cHeight: getProportionateScreenHeight(90),
                          onTap: () {
                            Get.to(() => const LoginScreen(),
                                transition: Transition.fadeIn);
                          },
                        ),
                        ServicesItem(
                          icon: "assets/icons/UserPlus.svg",
                          service: "Register".tr,
                          cWidth: getProportionateScreenWidth(90),
                          cHeight: getProportionateScreenHeight(90),
                          onTap: () {
                            Get.to(() => const RegisterScreen(),
                                transition: Transition.fadeIn);
                          },
                        ),
                      ],
                    ),
                  ),
                  Gap(getProportionateScreenHeight(20)),
                  FadeAnimation(
                    1.3,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ServicesItem(
                          icon: "assets/icons/Map.svg",
                          service: "Agents".tr,
                          cWidth: getProportionateScreenWidth(90),
                          cHeight: getProportionateScreenHeight(90),
                          onTap: () {
                            agentsController.getAgents();
                          },
                        ),
                        ServicesItem(
                          icon: "assets/icons/Money-Bag.svg",
                          service: "Currency".tr,
                          cWidth: getProportionateScreenWidth(90),
                          cHeight: getProportionateScreenHeight(90),
                          onTap: () {
                            Get.to(() => const CurrencyRates(),
                                transition: Transition.fadeIn);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

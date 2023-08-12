import 'package:alfalPay/Util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';
import '../../Controllers/User/main_controller.dart';
import '../../Util/Globals/globals.dart';
import '../../Util/Widgets/WaveClipper.dart';
import '../../Util/Widgets/image_button.dart';
import '../../Util/Widgets/intro.dart';
import '../../routes.dart';

class IntroScreen extends GetView<MainController> {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Select Language".tr,
          style: const TextStyle(
            color: AppColors.kPrimaryLightColor,
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          waveClipper2(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: getProportionateScreenHeight(50)),
            child: Column(
              children: [
                const Spacer(),
                FadeAnimation2(
                  1,
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
                FadeAnimation2(
                  1.1,
                  ScreenTitle(text: "AppName".tr),
                ),
                FadeAnimation(
                  1.2,
                  BodyText(text: "WelcomeText".tr),
                ),
                const Spacer(),
                FadeAnimation(
                  1.3,
                  ImageButton(
                    text: "العربيه       ",
                    image: "assets/images/saudi.png",
                    press: () {
                      GetStorage().write("intro", "1");
                      controller.changeLang("ar");
                      Get.offAllNamed(Routes.welcome);
                      //Get.offAllNamed(Routes.obBoarding);
                    },
                  ),
                ),
                Gap(getProportionateScreenWidth(20)),
                FadeAnimation(
                  1.4,
                  ImageButton(
                    text: "English",
                    image: "assets/images/english.png",
                    press: () {
                      GetStorage().write("intro", '1');
                      controller.changeLang("en");
                      Get.offAllNamed(Routes.welcome);
                      //Get.offAllNamed(Routes.obBoarding);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

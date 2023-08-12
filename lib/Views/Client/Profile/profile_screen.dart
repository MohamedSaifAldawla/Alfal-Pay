import 'package:alfalPay/Controllers/User/auth_controller.dart';
import 'package:alfalPay/Util/Widgets/Dialogs/lang_dialog.dart';
import 'package:alfalPay/Util/Widgets/Dialogs/log_out.dart';
import 'package:alfalPay/Util/Widgets/Dialogs/theme_dialog.dart';
import 'package:alfalPay/Views/Client/Profile/password_update_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Util/Globals/globals.dart';
import '../../../Util/Widgets/intro.dart';
import '../../../Util/Widgets/loader.dart';
import '../../../Util/Widgets/profile_item.dart';
import '../../../Util/colors.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings".tr),
        actions: [
          InkWell(
            onTap: () {
              authController.profileShow();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(15)),
              child: SvgPicture.asset(
                "assets/icons/user-edit.svg",
                height: getProportionateScreenHeight(20),
                width: getProportionateScreenHeight(20),
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.kPrimaryDark3Color
                    : AppColors.kPrimaryLightColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              Gap(getProportionateScreenHeight(30)),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(150),
                      child: FadeAnimation(
                        1,
                        CachedNetworkImage(
                          imageUrl: "${GetStorage().read("profilePic")}",
                          placeholder: (context, url) => const Loader(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            size: 60,
                          ),
                          imageBuilder: (context, imageProvider) => Container(
                            width: getProportionateScreenWidth(100.0),
                            height: getProportionateScreenHeight(100.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(getProportionateScreenHeight(20)),
                    FadeAnimation(
                      1.1,
                      BodyText(
                        text: GetStorage().read('name'),
                        weight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(20),
                      ),
                    ),
                    FadeAnimation(
                      1.2,
                      BodyText(
                        text: '+249${GetStorage().read('phone')}',
                        fontSize: getProportionateScreenHeight(14),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(getProportionateScreenHeight(80)),
              FadeAnimation(
                1.3,
                ProfileItem(
                  firstIcon: "assets/icons/Reset.svg",
                  title: "Password Update".tr,
                  onTap: () {
                    Get.to(() => const PasswordUpdateScreen(),
                        transition: Transition.fadeIn);
                  },
                ),
              ),
              FadeAnimation(
                1.4,
                ProfileItem(
                  firstIcon: "assets/icons/lang3.svg",
                  title: "Language".tr,
                  onTap: (() => langDialog(
                        context: context,
                        onTap1: () {
                          mainController.changeLang("en");
                          Get.back();
                        },
                        onTap2: () {
                          mainController.changeLang("ar");
                          Get.back();
                        },
                      )),
                ),
              ),
              FadeAnimation(
                1.5,
                ProfileItem(
                  firstIcon: "assets/icons/night.svg",
                  title: "Night mode".tr,
                  onTap: (() => themeDialog(
                        context: context,
                        onTap1: () {
                          mainController.changeTheme(true);
                          Get.back();
                        },
                        onTap2: () {
                          mainController.changeTheme(false);
                          Get.back();
                        },
                      )),
                ),
              ),
              FadeAnimation(
                1.6,
                ProfileItem(
                  firstIcon: "assets/icons/Info.svg",
                  title: "Help center".tr,
                ),
              ),
              FadeAnimation(
                1.7,
                ProfileItem(
                  firstIcon: "assets/icons/delete.svg",
                  title: "Delete account".tr,
                ),
              ),
              FadeAnimation(
                1.8,
                ProfileItem(
                  firstIcon: lang == "en"
                      ? "assets/icons/log.svg"
                      : "assets/icons/logar.svg",
                  title: "Log out".tr,
                  onTap: () {
                    logOutDialog(context: context);
                  },
                ),
              ),
              Gap(getProportionateScreenHeight(50)),
            ],
          ),
        ),
      ),
    );
  }
}

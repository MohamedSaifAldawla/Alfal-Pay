import 'package:alfalPay/Util/Widgets/intro.dart';
import 'package:alfalPay/Util/Widgets/Dialogs/my_card_dialog.dart';
import 'package:alfalPay/Util/theme.dart';
import 'package:alfalPay/Views/Client/Bills/bills_screen.dart';
import 'package:alfalPay/Views/Client/History/history_screen.dart';
import 'package:alfalPay/Views/Client/Home/currency_screen.dart';
import 'package:alfalPay/Views/Client/Profile/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Util/Globals/globals.dart';
import '../../../Util/Widgets/inputField.dart';
import '../../../Util/Widgets/loader.dart';
import '../../../Util/Widgets/primary_button.dart';
import '../../../Util/Widgets/sections.title.dart';
import '../../../Util/Widgets/services_item.dart';
import '../../../Util/Widgets/wallet.dart';
import '../../../Util/colors.dart';
import '../../../Util/size_config.dart';
import '../../../routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _serialNumber = TextEditingController();
  String? accountNumber;
  String? amount;
  String? serialNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(25),
              vertical: horizontalPadding,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // FadeAnimation(
                        //   1,
                        //   BodyText(text: "Greeting".tr),
                        // ),
                        FadeAnimation(
                          1,
                          BodyText(
                            text: GetStorage().read('name'),
                            weight: FontWeight.bold,
                            fontSize: getProportionateScreenHeight(25),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          width: getProportionateScreenWidth(30),
                          height: getProportionateScreenHeight(30),
                          child: FadeAnimation(
                            1.3,
                            GestureDetector(
                              child: CachedNetworkImage(
                                imageUrl: "${GetStorage().read("profilePic")}",
                                placeholder: (context, url) => const Loader(),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                  size: 60,
                                ),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: getProportionateScreenWidth(100.0),
                                  height: getProportionateScreenHeight(100.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              onTap: () => cardDialog(context: context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(getProportionateScreenHeight(20)),
                FadeAnimation(
                  1.4,
                  Wallet(
                    onTap: () {
                      rechargeDialog(context);
                    },
                  ),
                ),
                Gap(getProportionateScreenHeight(50)),
                FadeAnimation(
                  1.5,
                  SectionsTitle(
                    title: "All services".tr,
                    title2: ''.tr,
                  ),
                ),
                Gap(getProportionateScreenHeight(10)),
                FadeAnimation2(
                  1.6,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServicesItem(
                        icon: "assets/icons/Wallet.svg",
                        service: "Balance".tr,
                        onTap: () {
                          setState(() {
                            walletController.showBalance();
                          });
                        },
                      ),
                      ServicesItem(
                        icon: "assets/icons/Transfer.svg",
                        service: "Transfer".tr,
                        onTap: () {
                          transferDialog(context);
                        },
                      ),
                      ServicesItem(
                        icon: "assets/icons/Devices.svg",
                        service: "Bills".tr,
                        onTap: () {
                          Get.to(() => const BillsScreen(),
                              transition: Transition.fadeIn);
                        },
                      ),
                    ],
                  ),
                ),
                Gap(getProportionateScreenHeight(20)),
                FadeAnimation2(
                  1.7,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServicesItem(
                        icon: "assets/icons/qr-code-scan.svg",
                        service: "QR".tr,
                        onTap: () {
                          Get.toNamed(Routes.qrScanner);
                        },
                      ),
                      ServicesItem(
                        icon: "assets/icons/Clipboard.svg",
                        service: "History".tr,
                        onTap: () {
                          Get.to(() => const HistoryScreen(),
                              transition: Transition.fadeIn);
                        },
                      ),
                      ServicesItem(
                        icon: "assets/icons/Map.svg",
                        service: "Agents".tr,
                        onTap: () {
                          // Get.toNamed(Routes.history);
                          agentsController.getAgents();
                        },
                      ),

                      // ServicesItem(
                      //   icon: "assets/icons/Buildings.svg",
                      //   service: "E-government".tr,
                      //   onTap: () {},
                      // ),
                    ],
                  ),
                ),
                Gap(getProportionateScreenHeight(20)),
                FadeAnimation2(
                  1.8,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServicesItem(
                        icon: "assets/icons/Money-Bag.svg",
                        service: "Currency".tr,
                        onTap: () {
                          Get.to(() => const CurrencyRates(),
                              transition: Transition.fadeIn);
                        },
                      ),
                      // ServicesItem(
                      //   icon: "assets/icons/DebitCard.svg",
                      //   iconcolor: AppColors.kPrimaryColor,
                      //   service: "Cards".tr,
                      //   onTap: () {},
                      // ),
                      // ServicesItem(
                      //   icon: "assets/icons/More.svg",
                      //   service: "Other".tr,
                      //   onTap: () {},
                      // ),
                      Gap(getProportionateScreenHeight(35)),
                      ServicesItem(
                        icon: "assets/icons/Settings.svg",
                        service: "Settings".tr,
                        onTap: () {
                          Get.to(() => const ProfileScreen(),
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
      ),
    );
  }

  Future rechargeDialog(context) {
    return Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: FadeAnimation2(
          0,
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
              height: getProportionateScreenHeight(300),
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
                            _serialNumber.text = '';
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
                    FadeAnimation(
                      0.5,
                      BodyText(
                        text: "Charge Wallet".tr,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Gap(getProportionateScreenHeight(10)),
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
                            BodyText(
                              text: "Enter card".tr,
                              maxLines: 2,
                            ),
                          ),
                          Gap(getProportionateScreenHeight(20)),
                          FadeAnimation(
                            1.1,
                            InputField(
                              controller: _serialNumber,
                              label: "Enter card number".tr,
                              hint: "Ex:".tr,
                              type: "Amount",
                              icon: "assets/icons/top-up.svg",
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              onSaved: (newValue) => serialNumber = newValue,
                            ),
                          ),
                          Gap(getProportionateScreenHeight(30)),
                          FadeAnimation(
                            1.2,
                            PrimaryButton(
                              text: "Continue".tr,
                              press: () {
                                if (_serialNumber.text.isEmpty) {
                                  mainController.SnackBar(
                                      "Error".tr,
                                      'Please Enter card'.tr,
                                      SvgPicture.asset(
                                        "assets/icons/Close.svg",
                                        color: Colors.white,
                                      ),
                                      AppColors.error,
                                      SnackPosition.TOP,
                                      5);
                                }
                                if (_serialNumber.text.isNotEmpty) {
                                  walletController.Recharge(
                                      serialNumber: _serialNumber.text);

                                  debugPrint(_serialNumber.text);
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

  Future transferDialog(context) {
    return Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: FadeAnimation2(
          0,
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
              height: getProportionateScreenHeight(350),
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
                            _accountNumber.text = '';
                            _amount.text = '';
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
                          FadeAnimation2(
                            1,
                            InputField(
                              controller: _accountNumber,
                              label: "Account number".tr,
                              hint: "Enter account number".tr,
                              type: "Account",
                              icon: "assets/icons/Person.svg",
                              obscureText: false,
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
                                      amount: _amount.text);
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
}
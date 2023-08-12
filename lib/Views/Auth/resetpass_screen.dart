import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';
import '../../Util/Globals/globals.dart';
import '../../Util/Widgets/WaveClipper.dart';
import '../../Util/Widgets/form_error.dart';
import '../../Util/Widgets/inputField.dart';
import '../../Util/Widgets/intro.dart';
import '../../Util/Widgets/primary_button.dart';
import '../../Util/colors.dart';
import 'otp_screen.dart';

// ignore: must_be_immutable
class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({Key? key}) : super(key: key);

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  String? phone;

  final List<String> errors = [];
  Map<String, dynamic> _resetData = {};

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // title: Text("Login".tr),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          iconTheme: const IconThemeData(color: AppColors.kPrimaryLightColor),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              waveClipper3(),
              Container(
                padding: EdgeInsets.only(
                    right: horizontalPadding,
                    left: horizontalPadding,
                    top: 110,
                    bottom: 20),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          1.1,
                          Hero(
                            tag: "image",
                            child: Center(
                              child: Image.asset(
                                logo,
                                height: getProportionateScreenHeight(100),
                                width: getProportionateScreenWidth(100),
                              ),
                            ),
                          ),
                        ),
                        Gap(getProportionateScreenWidth(150)),
                        FadeAnimation2(
                          1.4,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: BodyText(
                              text: "Reset Password".tr,
                              fontSize: getProportionateScreenWidth(32),
                              color: AppColors.kPrimaryColor,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Gap(getProportionateScreenWidth(5)),
                        FadeAnimation2(
                          1.5,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: BodyText(
                              text: "Reset Pass Body".tr,
                              textAlign: TextAlign.start,
                              maxLines: 2,
                            ),
                          ),
                        ),
                        Gap(getProportionateScreenWidth(30)),
                        FadeAnimation(
                          1.6,
                          InputField(
                            controller: _phoneController,
                            hint: "Phone".tr,
                            icon: "assets/icons/Phone.svg",
                            obscureText: false,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) => phone = newValue,
                            onChanged: (value) {
                              if (value == null || value.isNotEmpty) {
                                removeError(
                                    error: "Please Enter your Phone".tr);
                              }
                              if (value!.length >= 10) {
                                removeError(
                                    error: "Phone number is too short".tr);
                              }
                              if (value.isEmpty) {
                                addError(error: "Please Enter your Phone".tr);
                              }

                              if (value.length < 10) {
                                addError(error: "Phone number is too short".tr);
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                addError(error: "Please Enter your Phone".tr);
                                return "";
                              } else if (value.length < 10) {
                                addError(error: "Phone number is too short".tr);
                                return "";
                              }
                              return null;
                            },
                          ),
                        ),
                        FadeAnimation(
                          1.7,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: FormError(errors: errors),
                          ),
                        ),
                        Gap(getProportionateScreenWidth(20)),
                        FadeAnimation(
                          1.8,
                          PrimaryButton(
                            text: "Continue".tr,
                            press: (() {
                              Get.to(() => const OTPScreen(),
                                  transition: Transition.fadeIn);
                              // if (_formKey.currentState!.validate()) {}
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

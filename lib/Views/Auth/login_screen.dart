import 'package:alfalPay/Views/Auth/register_screen.dart';
import 'package:alfalPay/Views/Auth/resetpass_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';
import '../../Controllers/User/auth_controller.dart';
import '../../Util/Globals/globals.dart';
import '../../Util/Widgets/WaveClipper.dart';
import '../../Util/Widgets/form_error.dart';
import '../../Util/Widgets/inputField.dart';
import '../../Util/Widgets/intro.dart';
import '../../Util/Widgets/Dialogs/lang_dialog.dart';
import '../../Util/Widgets/primary_button.dart';
import '../../Util/colors.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  String? phone;
  String? password;
  bool remember = false;
  bool _hidePassword = true;
  final List<String> errors = [];
  final Map<String, dynamic> _loginData = {};

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
    loadUserEmailPassword();
    // Future.delayed(Duration(seconds: 1), () async {
    //   Login();
    // });
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
        body: SingleChildScrollView(
          child: Stack(
            children: [
              waveClipper2(),
              Container(
                padding: EdgeInsets.only(
                  right: horizontalPadding,
                  left: horizontalPadding,
                  top: 110,
                  bottom: 20,
                ),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Gap(getProportionateScreenHeight(50)),
                        FadeAnimation(
                          1.1,
                          Hero(
                            tag: "image",
                            child: Image.asset(
                              logo,
                              height: getProportionateScreenHeight(100),
                              width: getProportionateScreenHeight(100),
                            ),
                          ),
                        ),
                        Gap(getProportionateScreenHeight(50)),
                        Row(
                          children: [
                            FadeAnimation2(
                              1.4,
                              InkWell(
                                onTap: () {
                                  _phoneController.text = "123588984";
                                  _passwordController.text = "12345678";
                                },
                                child: BodyText(
                                  text: "Login2".tr,
                                  fontSize: getProportionateScreenHeight(32),
                                  color: AppColors.kPrimaryColor,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(getProportionateScreenHeight(5)),
                        FadeAnimation2(
                          1.5,
                          BodyText(
                            text: "Log in to your account".tr,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                        ),
                        Gap(getProportionateScreenHeight(30)),
                        FadeAnimation(
                          1.6,
                          InputField(
                            controller: _phoneController,
                            hint: "Phone".tr,
                            icon: "assets/icons/Phone.svg",
                            obscureText: false,
                            maxLength: 9,
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) => phone = newValue,
                            onChanged: (value) {
                              if (value == null || value.isNotEmpty) {
                                removeError(
                                    error: "Please Enter your Phone".tr);
                              }
                              if (value!.length >= 9) {
                                removeError(
                                    error: "Phone number is too short".tr);
                              }
                              if (value.isEmpty) {
                                addError(error: "Please Enter your Phone".tr);
                              }

                              if (value.length < 9) {
                                addError(error: "Phone number is too short".tr);
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                addError(error: "Please Enter your Phone".tr);
                                return "";
                              } else if (value.length < 9) {
                                addError(error: "Phone number is too short".tr);
                                return "";
                              }
                              return null;
                            },
                          ),
                        ),
                        Gap(getProportionateScreenHeight(5)),
                        FadeAnimation(
                          1.6,
                          SuffixInputField(
                            controller: _passwordController,
                            hint: "Password".tr,
                            icon: "assets/icons/Lock.svg",
                            suffixIcon: _hidePassword == true
                                ? "assets/icons/Eye.svg"
                                : "assets/icons/Invisible.svg",
                            onTap: () {
                              setState(
                                () {
                                  _hidePassword = !_hidePassword;
                                },
                              );
                            },
                            obscureText: _hidePassword,
                            keyboardType: TextInputType.text,
                            onSaved: (newValue) => password = newValue,
                            onChanged: (value) {
                              if (value == null || value.isNotEmpty) {
                                removeError(
                                    error: "Please Enter your password".tr);
                              }
                              if (value!.length >= passLength) {
                                removeError(error: "Password is too short".tr);
                              }
                              if (value.isEmpty) {
                                addError(
                                    error: "Please Enter your password".tr);
                              }
                              if (value.length < passLength) {
                                addError(error: "Password is too short".tr);
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                addError(
                                    error: "Please Enter your password".tr);
                                return "";
                              } else if (value.length < passLength) {
                                addError(error: "Password is too short".tr);
                                return "";
                              }
                              return null;
                            },
                          ),
                        ),
                        Gap(getProportionateScreenHeight(10)),
                        FadeAnimation(
                          1.8,
                          Row(
                            children: [
                              Checkbox(
                                value: remember,
                                activeColor: AppColors.kPrimaryColor,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      remember = value!;
                                      if (remember == true) {
                                        GetStorage()
                                            .write('remember', remember);
                                        GetStorage().write(
                                            'phone', _phoneController.text);
                                        GetStorage().write('password',
                                            _passwordController.text);

                                        debugPrint("$remember");
                                        debugPrint(GetStorage().read("phone"));
                                        debugPrint(
                                            GetStorage().read("password"));
                                      } else if (remember == false) {
                                        GetStorage().remove("phone");
                                        GetStorage().remove("password");
                                        GetStorage().remove("remember");
                                        debugPrint("$remember");
                                      }
                                    },
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: BodyText(
                                  text: "Remember me".tr,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: (() => Get.to(
                                    () => const ResetPassScreen(),
                                    transition: Transition.fadeIn)),
                                child: BodyText(
                                  text: "Forgot Password".tr,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        FadeAnimation(
                          1.8,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: FormError(errors: errors),
                          ),
                        ),
                        Gap(getProportionateScreenHeight(10)),
                        FadeAnimation(
                          1.9,
                          PrimaryButton(
                            text: "Login2".tr,
                            press: (() {
                              // Get.to(() => const HomeScreen(),
                              //     transition: Transition.fadeIn);

                              if (_formKey.currentState!.validate()) {
                                _loginData['phone'] = _phoneController.text;
                                _loginData['password'] =
                                    _passwordController.text;
                                authController.login(loginData: _loginData);
                                if (remember == true) {
                                  GetStorage().write('remember', remember);
                                  GetStorage()
                                      .write('phone', _phoneController.text);
                                  GetStorage().write(
                                      'password', _passwordController.text);

                                  debugPrint('$remember');
                                  debugPrint(GetStorage().read("phone"));
                                  debugPrint(GetStorage().read("password"));
                                }
                              }
                            }),
                          ),
                        ),
                        Gap(getProportionateScreenHeight(50)),
                        GestureDetector(
                          onTap: (() => Get.to(() => const RegisterScreen(),
                              transition: Transition.fadeIn)),
                          child: BodyText(
                            text: "Register".tr,
                            color: AppColors.kPrimaryColor,
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

  void loadUserEmailPassword() async {
    try {
      if (await GetStorage().read("remember")) {
        debugPrint("${GetStorage().read("remember")}");
        _phoneController.text = await GetStorage().read("phone");
        _passwordController.text = await GetStorage().read("password");
        setState(() {
          remember = true;
        });
      }
    } catch (e) {
      debugPrint("$e");
    }
  }
}

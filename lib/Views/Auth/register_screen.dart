import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
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
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final authController = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _thirdNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String? username;
  String? phone;
  String? address;
  String? password;
  String? confirm;
  bool remember = false;
  bool _hidePassword = true;
  final List<String> errors = [];
  final Map<String, dynamic> _registerData = {};

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
                  bottom: 20),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Gap(getProportionateScreenHeight(100)),
                      Row(
                        children: [
                          FadeAnimation2(
                            1,
                            InkWell(
                              onTap: () {
                                _firstNameController.text = "moesaif";
                                _secondNameController.text = "moesaif";
                                _thirdNameController.text = "moesaif";
                                _phoneController.text = "989876546";
                                _addressController.text = "Khartoum";
                                _passwordController.text = "12345678";
                                _confirmPasswordController.text = "12345678";
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: BodyText(
                                  text: "Register2".tr,
                                  fontSize: getProportionateScreenWidth(32),
                                  color: AppColors.kPrimaryColor,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(getProportionateScreenHeight(5)),
                      FadeAnimation2(
                        1.1,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: BodyText(
                            text: "Enter the data below".tr,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      Gap(getProportionateScreenHeight(30)),
                      FadeAnimation(
                        1.2,
                        InputField(
                          controller: _firstNameController,
                          hint: "First name".tr,
                          icon: "assets/icons/Person.svg",
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          onSaved: (newValue) => username = newValue,
                          onChanged: (value) {
                            if (value == null || value.isNotEmpty) {
                              removeError(
                                  error:
                                      "Please Enter your user First name".tr);
                            }
                            if (value == null || value.isEmpty) {
                              addError(
                                  error:
                                      "Please Enter your user First name".tr);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              addError(
                                  error:
                                      "Please Enter your user First name".tr);
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      Gap(getProportionateScreenHeight(20)),
                      FadeAnimation(
                        1.3,
                        InputField(
                          controller: _secondNameController,
                          hint: "Second name".tr,
                          icon: "assets/icons/Person.svg",
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          onSaved: (newValue) => username = newValue,
                          onChanged: (value) {
                            if (value == null || value.isNotEmpty) {
                              removeError(
                                  error:
                                      "Please Enter your user Second name".tr);
                            }
                            if (value == null || value.isEmpty) {
                              addError(
                                  error:
                                      "Please Enter your user Second name".tr);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              addError(
                                  error:
                                      "Please Enter your user Second name".tr);
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      Gap(getProportionateScreenHeight(20)),
                      FadeAnimation(
                        1.4,
                        InputField(
                          controller: _thirdNameController,
                          hint: "Third name".tr,
                          icon: "assets/icons/Person.svg",
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          onSaved: (newValue) => username = newValue,
                          onChanged: (value) {
                            if (value == null || value.isNotEmpty) {
                              removeError(
                                  error:
                                      "Please Enter your user Third name".tr);
                            }
                            if (value == null || value.isEmpty) {
                              addError(
                                  error:
                                      "Please Enter your user Third name".tr);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              addError(
                                  error:
                                      "Please Enter your user Third name".tr);
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      Gap(getProportionateScreenHeight(20)),
                      FadeAnimation(
                        1.5,
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
                              removeError(error: "Please Enter your Phone".tr);
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
                        InputField(
                          controller: _addressController,
                          hint: "Address".tr,
                          icon: "assets/icons/Location.svg",
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          onSaved: (newValue) => address = newValue,
                          onChanged: (value) {
                            if (value == null || value.isNotEmpty) {
                              removeError(
                                  error: "Please Enter your address".tr);
                            }
                            if (value == null || value.isEmpty) {
                              addError(error: "Please Enter your address".tr);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              addError(error: "Please Enter your address".tr);
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      Gap(getProportionateScreenHeight(20)),
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: FadeAnimation(
                          1.7,
                          Container(
                            padding:
                                EdgeInsets.all(getProportionateScreenHeight(5)),
                            height: getProportionateScreenHeight(52),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.kSecondaryColor,
                                width: getProportionateScreenWidth(1.0),
                              ),
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(25)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: getProportionateScreenHeight(13),
                                  right: getProportionateScreenHeight(13)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/Calendar.svg",
                                    height: getProportionateScreenHeight(30),
                                    color: AppColors.kSecondaryColor,
                                  ),
                                  Gap(getProportionateScreenHeight(10)),
                                  BodyText(
                                    text: "Date of birth".tr,
                                    color: AppColors.kSecondaryColor,
                                  ),
                                  const Spacer(),
                                  BodyText(
                                    text:
                                        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                    color: AppColors.kSecondaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(getProportionateScreenHeight(20)),
                      FadeAnimation(
                        1.8,
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
                              addError(error: "Please Enter your password".tr);
                            }
                            if (value.length < passLength) {
                              addError(error: "Password is too short".tr);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              addError(error: "Please Enter your password".tr);
                              return "";
                            } else if (value.length < passLength) {
                              addError(error: "Password is too short".tr);
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      Gap(getProportionateScreenHeight(20)),
                      FadeAnimation(
                        1.9,
                        SuffixInputField(
                          controller: _confirmPasswordController,
                          hint: "Re-Enter password".tr,
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
                          onSaved: (newValue) => confirm = newValue,
                          onChanged: (value) {
                            if (value == null || value.isNotEmpty) {
                              removeError(
                                  error: "Please Re-Enter your password".tr);
                            }
                            if (value!.length >= passLength) {
                              removeError(
                                  error:
                                      "Confirmation Password is too short".tr);
                            }
                            if (_passwordController.value ==
                                _confirmPasswordController.value) {
                              removeError(error: "Password did not matched".tr);
                            }
                            if (value.isEmpty) {
                              addError(
                                  error: "Please Re-Enter your password".tr);
                            }
                            if (value.length < 8) {
                              addError(
                                  error:
                                      "Confirmation Password is too short".tr);
                            }
                            if (_passwordController.value !=
                                _confirmPasswordController.value) {
                              addError(error: "Password did not matched".tr);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              addError(
                                  error: "Please Re-Enter your password".tr);
                              return "";
                            } else if (value.length < passLength) {
                              addError(
                                  error:
                                      "Confirmation Password is too short".tr);
                              return "";
                            } else if (_passwordController.value !=
                                _confirmPasswordController.value) {
                              addError(error: "Password did not matched".tr);
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      FadeAnimation(
                        2,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          child: FormError(errors: errors),
                        ),
                      ),
                      Gap(getProportionateScreenHeight(20)),
                      FadeAnimation(
                        2.1,
                        PrimaryButton(
                          text: "Register2".tr,
                          press: (() {
                            if (_formKey.currentState!.validate()) {
                              _registerData['first_name'] =
                                  _firstNameController.text;
                              _registerData['second_name'] =
                                  _secondNameController.text;
                              _registerData['third_name'] =
                                  _thirdNameController.text;
                              _registerData['phone'] = _phoneController.text;
                              _registerData['address'] =
                                  _addressController.text;
                              _registerData['date_of_birth'] = selectedDate;
                              _registerData['password'] =
                                  _passwordController.text;
                              authController.register(
                                  registerData: _registerData);
                              debugPrint('$_registerData');
                            }
                          }),
                        ),
                      ),
                      Gap(getProportionateScreenHeight(20)),
                      FadeAnimation(
                        2.2,
                        BodyText(
                          text: "By continuing".tr,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: selectedDate,
    );
    if (selected != null && selected != selectedDate) {
      setState(
        () {
          selectedDate = selected;
          debugPrint('$selectedDate');
        },
      );
    }
  }
}

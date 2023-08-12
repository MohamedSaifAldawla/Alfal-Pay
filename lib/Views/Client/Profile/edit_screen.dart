import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Controllers/User/auth_controller.dart';
import '../../../Util/Globals/globals.dart';
import '../../../Util/Widgets/form_error.dart';
import '../../../Util/Widgets/inputField.dart';
import '../../../Util/Widgets/intro.dart';
import '../../../Util/Widgets/primary_button.dart';
import '../../../Util/colors.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';

// ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenScreenState();
}

class _EditScreenScreenState extends State<EditScreen> {
  final authController = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();

  final List<String> errors = [];
  final Map<String, dynamic> _profileUpdateData = {};

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
      appBar: AppBar(
        title: Text("Profile edit".tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(horizontalPadding),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(getProportionateScreenHeight(50)),
                FadeAnimation(
                  1,
                  InputField(
                    controller: authController.usernameController,
                    hint: "User name".tr,
                    icon: "assets/icons/Person.svg",
                    obscureText: false,
                    maxLength: 20,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      if (value == null || value.isNotEmpty) {
                        removeError(error: "Please Enter your user name".tr);
                      }
                      if (value == null || value.isEmpty) {
                        addError(error: "Please Enter your user name".tr);
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        addError(error: "Please Enter your user name".tr);
                        return "";
                      }
                      return null;
                    },
                  ),
                ),
                Gap(getProportionateScreenHeight(5)),
                FadeAnimation(
                  1.2,
                  InputField(
                    controller: authController.phoneController,
                    hint: "Phone".tr,
                    icon: "assets/icons/Phone.svg",
                    obscureText: false,
                    maxLength: 9,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value == null || value.isNotEmpty) {
                        removeError(error: "Please Enter your Phone".tr);
                      }
                      if (value!.length >= 9) {
                        removeError(error: "Phone number is too short".tr);
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
                  1.3,
                  InputField(
                    controller: authController.addressController,
                    hint: "Address".tr,
                    icon: "assets/icons/Location.svg",
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      if (value == null || value.isNotEmpty) {
                        removeError(error: "Please Enter your address".tr);
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
                FadeAnimation(
                  1.4,
                  InputField(
                    controller: authController.emailController,
                    label: "Email".tr,
                    hint: "Enter your email".tr,
                    type: "email",
                    icon: "assets/icons/Mail.svg",
                    height: getProportionateScreenHeight(18),
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    // onChanged: (value) {
                    //   if (value == null || value.isNotEmpty) {
                    //     removeError(error: "Enter your email".tr);
                    //   }
                    //   if (emailValidatorRegExp.hasMatch(value!)) {
                    //     removeError(error: "Please Enter Valid Email".tr);
                    //   }
                    //   if (value.isEmpty) {
                    //     addError(error: "Enter your email".tr);
                    //   }
                    //   if (!emailValidatorRegExp.hasMatch(value)) {
                    //     addError(error: "Please Enter Valid Email".tr);
                    //   }
                    //   return;
                    // },
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     addError(error: "Enter your email".tr);
                    //     return "";
                    //   } else if (!emailValidatorRegExp.hasMatch(value)) {
                    //     addError(error: "Please Enter Valid Email".tr);
                    //     return "";
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                Gap(getProportionateScreenHeight(20)),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: FadeAnimation(
                    1.5,
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(5)),
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
                                  "${authController.selectedDate.day}/${authController.selectedDate.month}/${authController.selectedDate.year}",
                              color: AppColors.kSecondaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  1.6,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: FormError(errors: errors),
                  ),
                ),
                Gap(getProportionateScreenHeight(20)),
                FadeAnimation(
                  1.7,
                  PrimaryButton(
                    text: "Save".tr,
                    press: (() {
                      if (_formKey.currentState!.validate()) {
                        _profileUpdateData['name'] =
                            authController.usernameController.text;
                        _profileUpdateData['phone'] =
                            authController.phoneController.text;
                        _profileUpdateData['address'] =
                            authController.addressController.text;
                        _profileUpdateData['date_of_birth'] =
                            authController.selectedDate;
                        authController.profileUpdate(
                            profileUpdateData: _profileUpdateData);
                      }
                    }),
                  ),
                ),
                Gap(getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: authController.selectedDate,
      firstDate: DateTime(1900),
      lastDate: authController.selectedDate,
    );
    if (selected != null && selected != authController.selectedDate) {
      setState(
        () {
          authController.selectedDate = selected;
          debugPrint('$authController.selectedDate');
        },
      );
    }
  }
}

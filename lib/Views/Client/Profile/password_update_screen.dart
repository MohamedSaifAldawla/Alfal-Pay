import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Controllers/User/auth_controller.dart';
import '../../../Util/Globals/globals.dart';
import '../../../Util/Widgets/form_error.dart';
import '../../../Util/Widgets/inputField.dart';
import '../../../Util/Widgets/primary_button.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';

// ignore: must_be_immutable
class PasswordUpdateScreen extends StatefulWidget {
  const PasswordUpdateScreen({Key? key}) : super(key: key);

  @override
  State<PasswordUpdateScreen> createState() => _PasswordUpdateScreenState();
}

class _PasswordUpdateScreenState extends State<PasswordUpdateScreen> {
  final authController = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? currentPassword;
  String? newPassword;
  String? confirm;
  bool remember = false;
  bool _hidePassword = true;
  final List<String> errors = [];
  final Map<String, dynamic> _passwordUpdateData = {};

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
        title: Text("Password Update".tr),
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
                  1.8,
                  SuffixInputField(
                    controller: _currentPasswordController,
                    hint: "Current Password".tr,
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
                    onChanged: (value) {
                      if (value == null || value.isNotEmpty) {
                        removeError(
                            error: "Please Enter your Current Password".tr);
                      }
                      if (value!.length >= passLength) {
                        removeError(error: "Password is too short".tr);
                      }
                      if (value.isEmpty) {
                        addError(
                            error: "Please Enter your Current Password".tr);
                      }
                      if (value.length < passLength) {
                        addError(error: "Password is too short".tr);
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        addError(
                            error: "Please Enter your Current Password".tr);
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
                  1.8,
                  SuffixInputField(
                    controller: _newPasswordController,
                    hint: "New Password".tr,
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
                    onChanged: (value) {
                      if (value == null || value.isNotEmpty) {
                        removeError(error: "Please Enter your New Password".tr);
                      }
                      if (value!.length >= passLength) {
                        removeError(error: "Password is too short".tr);
                      }
                      if (value.isEmpty) {
                        addError(error: "Please Enter your New Password".tr);
                      }
                      if (value.length < passLength) {
                        addError(error: "Password is too short".tr);
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        addError(error: "Please Enter your New Password".tr);
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
                        removeError(error: "Please Re-Enter your password".tr);
                      }
                      if (value!.length >= passLength) {
                        removeError(
                            error: "Confirmation Password is too short".tr);
                      }
                      if (_newPasswordController.value ==
                          _confirmPasswordController.value) {
                        removeError(error: "Password did not matched".tr);
                      }
                      if (value.isEmpty) {
                        addError(error: "Please Re-Enter your password".tr);
                      }
                      if (value.length < 8) {
                        addError(
                            error: "Confirmation Password is too short".tr);
                      }
                      if (_newPasswordController.value !=
                          _confirmPasswordController.value) {
                        addError(error: "Password did not matched".tr);
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        addError(error: "Please Re-Enter your password".tr);
                        return "";
                      } else if (value.length < passLength) {
                        addError(
                            error: "Confirmation Password is too short".tr);
                        return "";
                      } else if (_newPasswordController.value !=
                          _confirmPasswordController.value) {
                        addError(error: "Password did not matched".tr);
                        return "";
                      }
                      return null;
                    },
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
                        _passwordUpdateData['current_password'] =
                            _currentPasswordController.text;
                        _passwordUpdateData['new_password'] =
                            _newPasswordController.text;
                        _passwordUpdateData['new_confirm_password'] =
                            _confirmPasswordController.text;
                        authController.passwordUpdate(
                            passwordUpdateData: _passwordUpdateData);
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
}

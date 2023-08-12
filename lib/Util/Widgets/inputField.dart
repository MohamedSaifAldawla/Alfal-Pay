import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';

import '../colors.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  InputField({
    Key? key,
    this.label,
    @required this.hint,
    this.type,
    this.maxLength,
    required this.icon,
    this.keyboardType,
    required this.obscureText,
    this.enabled = false,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.controller,
    this.height,
    this.onTap,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final String? type;
  final int? maxLength;
  final String icon;
  TextInputType? keyboardType = TextInputType.text;
  final bool obscureText;
  final bool enabled;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  double? height;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final lang = GetStorage().read("lang");
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(170, 170, 170, .05),
            blurRadius: 20.0,
            offset: Offset(0, 10),
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: TextFormField(
        readOnly: enabled,
        maxLength: maxLength,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onSaved: onSaved,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: getProportionateScreenHeight(17),
          ),
          hintText: hint,
          prefixIcon: Padding(
            padding: lang == "ar"
                ? EdgeInsets.fromLTRB(
                    getProportionateScreenHeight(10),
                    getProportionateScreenHeight(0),
                    getProportionateScreenHeight(20),
                    getProportionateScreenHeight(10),
                  )
                : EdgeInsets.fromLTRB(
                    getProportionateScreenHeight(20),
                    getProportionateScreenHeight(0),
                    getProportionateScreenHeight(10),
                    getProportionateScreenHeight(5),
                  ),
            child: SvgPicture.asset(
              icon,
              height: height ?? getProportionateScreenHeight(30),
              color: AppColors.kSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SuffixInputField extends StatelessWidget {
  SuffixInputField({
    Key? key,
    this.label,
    @required this.hint,
    this.type,
    this.maxLength,
    required this.icon,
    required this.suffixIcon,
    this.keyboardType,
    required this.obscureText,
    this.enabled = false,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.controller,
    this.height,
    this.onTap,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final String? type;
  final int? maxLength;
  final String icon;
  final String suffixIcon;
  TextInputType? keyboardType = TextInputType.text;
  final bool obscureText;
  final bool enabled;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  double? height;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final lang = GetStorage().read("lang");
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(170, 170, 170, .05),
            blurRadius: 20.0,
            offset: Offset(0, 10),
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: TextFormField(
        readOnly: enabled,
        maxLength: maxLength,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onSaved: onSaved,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: getProportionateScreenHeight(17),
          ),
          hintText: hint,
          prefixIcon: Padding(
            padding: lang == "ar"
                ? EdgeInsets.fromLTRB(
                    getProportionateScreenHeight(10),
                    getProportionateScreenHeight(0),
                    getProportionateScreenHeight(20),
                    getProportionateScreenHeight(10),
                  )
                : EdgeInsets.fromLTRB(
                    getProportionateScreenHeight(20),
                    getProportionateScreenHeight(0),
                    getProportionateScreenHeight(10),
                    getProportionateScreenHeight(5),
                  ),
            child: SvgPicture.asset(
              icon,
              height: height ?? getProportionateScreenHeight(30),
              color: AppColors.kSecondaryColor,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: lang == "ar"
                  ? EdgeInsets.fromLTRB(
                      getProportionateScreenHeight(20),
                      getProportionateScreenHeight(0),
                      getProportionateScreenHeight(10),
                      getProportionateScreenHeight(10),
                    )
                  : EdgeInsets.fromLTRB(
                      getProportionateScreenHeight(10),
                      getProportionateScreenHeight(0),
                      getProportionateScreenHeight(20),
                      getProportionateScreenHeight(5),
                    ),
              child: SvgPicture.asset(
                suffixIcon,
                height: height ?? getProportionateScreenHeight(30),
                color: AppColors.kSecondaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../colors.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    Key? key,
    required this.text,
    required this.press,
    this.gradient,
    this.color,
    this.textcolor,
  }) : super(key: key);

  final String text;
  final void Function()? press;
  final Gradient? gradient;
  Color? color;
  Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(50),
      child: InkWell(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(getProportionateScreenHeight(25)),
            color: color ?? AppColors.kPrimaryColor,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 46, 51, .2),
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: getProportionateScreenHeight(8)),
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(16),
                    color: textcolor ?? Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PrimaryButton2 extends StatelessWidget {
  PrimaryButton2({
    Key? key,
    required this.text,
    required this.press,
    this.gradient,
    this.color,
    this.textcolor,
  }) : super(key: key);

  final String text;
  final void Function()? press;
  final Gradient? gradient;
  Color? color;
  Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenWidth(50),
      child: InkWell(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: color ?? AppColors.kPrimaryColor,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 46, 51, .2),
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/cart.svg",
              ),
              const Gap(10),
              Padding(
                padding: EdgeInsets.only(top: getProportionateScreenWidth(8)),
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    color: textcolor ?? Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

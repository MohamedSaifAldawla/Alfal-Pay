import 'package:flutter/material.dart';

import '../colors.dart';
import '../size_config.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    Key? key,
    required this.text,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String text, image;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenWidth(50),
      child: InkWell(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.kPrimaryLightColor
                : AppColors.kPrimaryDark3Color,
            border: Border.all(
              color: AppColors.kPrimaryColor,
              width: 1.5,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 46, 51, .1),
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.kTextColor
                        : AppColors.kPrimaryLightColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  image,
                  height: getProportionateScreenHeight(40),
                  width: getProportionateScreenWidth(40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

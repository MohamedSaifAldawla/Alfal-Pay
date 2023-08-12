import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../colors.dart';
import '../size_config.dart';
import 'intro.dart';

// ignore: must_be_immutable
class Wallet extends StatelessWidget {
  Wallet({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final balance = GetStorage().read("balance");
    var isShow = GetStorage().read("walletIsShow");
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.shadow
              : AppColors.shadow2,
          blurRadius: 20.0,
          offset: const Offset(0, 8),
          blurStyle: BlurStyle.normal,
        )
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            getProportionateScreenHeight(20),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: getProportionateScreenHeight(200),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Card.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(25),
                vertical: getProportionateScreenHeight(30)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BodyText(
                      // ignore: prefer_interpolation_to_compose_strings
                      text: '${'Account :'.tr.toUpperCase()} ' +
                          GetStorage().read('id'),
                      weight: FontWeight.w500,
                      color: AppColors.kPrimaryLightColor,
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        isShow == true
                            ? balance != null
                                ? balance.toString()
                                : '0.00'
                            : '',
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(30),
                          fontWeight: FontWeight.w800,
                          color: AppColors.kPrimaryLightColor,
                        ),
                      ),
                    ),
                    Gap(getProportionateScreenHeight(10)),
                    Text(
                      isShow == true ? 'SDG'.tr : '',
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(20),
                          fontWeight: FontWeight.w500,
                          color: AppColors.kPrimaryLightColor),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: SvgPicture.asset("assets/icons/bag-dollar.svg",
                          width: getProportionateScreenWidth(20),
                          height: getProportionateScreenHeight(20),
                          color: AppColors.kPrimaryLightColor),
                    ),
                    const Gap(10),
                    InkWell(
                      onTap: onTap,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: getProportionateScreenHeight(5)),
                        child: BodyText(
                          text: "Charge Wallet".tr,
                          color: AppColors.kPrimaryLightColor,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

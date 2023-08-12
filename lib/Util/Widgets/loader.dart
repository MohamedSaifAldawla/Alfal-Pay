import 'package:alfalPay/Util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/icons/Loading.json',
        width: getProportionateScreenWidth(100),
        height: getProportionateScreenHeight(100),
      ),
    );
  }
}

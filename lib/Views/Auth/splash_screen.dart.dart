import 'package:alfalPay/Util/Widgets/intro.dart';
import 'package:alfalPay/Util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../Util/size_config.dart';
import '../../Util/Globals/globals.dart';
import '../../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 2;
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: splashtime),
      () async {
        Get.offAllNamed(Routes.intro);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Hero(
              tag: "image",
              child: Image.asset(
                logo,
                height: getProportionateScreenHeight(200),
                width: getProportionateScreenWidth(220),
              ),
            ),
            const Spacer(),
            Lottie.asset(
              'assets/icons/Loading.json',
              width: getProportionateScreenWidth(100),
              height: getProportionateScreenHeight(100),
              fit: BoxFit.fill,
            ),
            const Spacer(),
            NormalBodyText(
              text: version,
              fontSize: 15,
              color: AppColors.kSecondaryColor,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

@override
State<StatefulWidget> createState() {
  throw UnimplementedError();
}

import 'package:alfalPay/Animations/FadeAnimation.dart';
import 'package:alfalPay/Util/Globals/globals.dart';
import 'package:alfalPay/Util/Widgets/hewala_card.dart';
import 'package:alfalPay/Util/Widgets/intro.dart';
import 'package:alfalPay/Util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ShowHewalaScreen extends StatelessWidget {
  const ShowHewalaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hewala".tr),
      ),
      body: Obx(
        () => Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: hewalaController.hewala.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/icons/empty_history.json',
                        width: 350,
                        height: 350,
                        fit: BoxFit.fill,
                      ),
                      BodyText(
                        text: "No Hewala yet".tr,
                        weight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenWidth(25),
                            horizontal: getProportionateScreenWidth(5)),
                        physics: const BouncingScrollPhysics(),
                        itemCount: hewalaController.hewala.length,
                        itemBuilder: (context, index) => FadeAnimation(
                          1,
                          HewalaCard(
                            hewalas: hewalaController.hewala[index],
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
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

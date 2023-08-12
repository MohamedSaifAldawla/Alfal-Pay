import 'package:alfalPay/Util/colors.dart';
import 'package:alfalPay/Util/size_config.dart';
import 'package:alfalPay/Util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../Animations/FadeAnimation.dart';
import '../../../Util/Widgets/sections.title.dart';
import '../../../Util/Widgets/trans_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  //final transController = Get.find<HistoryScreen>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("History".tr),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
            ),
            child: SvgPicture.asset(
              "assets/icons/Refresh.svg",
              width: getProportionateScreenWidth(20),
              height: getProportionateScreenHeight(20),
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.kTextColor
                  : Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: Column(
            children: [
              Gap(getProportionateScreenWidth(10)),
              FadeAnimation(
                1,
                TransCard(
                  icon1: 'assets/icons/Wallet.svg',
                  title: 'Money transfer',
                  amount: '8989',
                  color: AppColors.success,
                  icon2: 'assets/icons/Arrow_Down_MD.svg',
                ),
              ),
              FadeAnimation(
                1,
                TransCard(
                  icon1: 'assets/icons/Devices.svg',
                  title: 'Phone top up',
                  amount: '454',
                  color: AppColors.error,
                  icon2: 'assets/icons/Arrow_Up_MD.svg',
                ),
              ),
              FadeAnimation(
                1,
                TransCard(
                  icon1: 'assets/icons/Wallet.svg',
                  title: 'Money transfer',
                  amount: '4445',
                  color: AppColors.error,
                  icon2: 'assets/icons/Arrow_Down_MD.svg',
                ),
              ),
              FadeAnimation(
                1,
                TransCard(
                  icon1: 'assets/icons/Devices.svg',
                  title: 'Phone top up',
                  amount: '75757',
                  color: AppColors.success,
                  icon2: 'assets/icons/Arrow_Down_MD.svg',
                ),
              ),
              FadeAnimation(
                1,
                TransCard(
                  icon1: 'assets/icons/Wallet.svg',
                  title: 'Money transfer',
                  amount: '88989',
                  color: AppColors.success,
                  icon2: 'assets/icons/Arrow_Down_MD.svg',
                ),
              ),
              FadeAnimation(
                1,
                TransCard(
                  icon1: 'assets/icons/Devices.svg',
                  title: 'Phone top up',
                  amount: '2334',
                  color: AppColors.error,
                  icon2: 'assets/icons/Arrow_Up_MD.svg',
                ),
              ),
              FadeAnimation(
                1,
                TransCard(
                  icon1: 'assets/icons/Wallet.svg',
                  title: 'Money transfer',
                  amount: '4445',
                  color: AppColors.error,
                  icon2: 'assets/icons/Arrow_Down_MD.svg',
                ),
              ),
              FadeAnimation(
                1,
                TransCard(
                  icon1: 'assets/icons/Devices.svg',
                  title: 'Phone top up',
                  amount: '75757',
                  color: AppColors.success,
                  icon2: 'assets/icons/Arrow_Down_MD.svg',
                ),
              ),
              // Expanded(
              //   child: ListView.separated(
              //     padding: EdgeInsets.symmetric(
              //         vertical: getProportionateScreenWidth(25),
              //         horizontal: getProportionateScreenWidth(5)),
              //     physics: BouncingScrollPhysics(),
              //     itemCount: transController.trans.length,
              //     itemBuilder: (context, index) => FadeAnimation(
              //       1,
              //       TransCard2(transController.trans[index], context),
              //     ),
              //     separatorBuilder: (context, index) => SizedBox(
              //       height: 20,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      // body: Obx(
      //   () => Padding(
      //     padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      //     child: transController.isLoading.value
      //         ? Center(child: Loader())
      //         : transController.trans.isEmpty == true
      //             ? Center(
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Lottie.asset(
      //                       'assets/icons/notFound.json',
      //                       width: 350,
      //                       height: 350,
      //                       fit: BoxFit.fill,
      //                     ),
      //                     BodyText(
      //                       text: "no Transaction yet".tr,
      //                       weight: FontWeight.bold,
      //                       fontSize: 18,
      //                     ),
      //                   ],
      //                 ),
      //               )
      //             : Column(
      //                 children: [
      //                   const Gap(20),
      //                   GestureDetector(
      //                     onTap: Refresh,
      //                     child: IconSectionsTitle(
      //                       title: "Latest Transactions".tr,
      //                       icon: "assets/icons/Refresh.svg",
      //                     ),
      //                   ),
      //                   const Gap(10),
      //                   Expanded(
      //                     child: ListView.separated(
      //                       padding: EdgeInsets.symmetric(
      //                           vertical: getProportionateScreenWidth(25),
      //                           horizontal: getProportionateScreenWidth(5)),
      //                       physics: BouncingScrollPhysics(),
      //                       itemCount: transController.trans.length,
      //                       itemBuilder: (context, index) => FadeAnimation(
      //                         1,
      //                         TransCard2(transController.trans[index], context),
      //                       ),
      //                       separatorBuilder: (context, index) => SizedBox(
      //                         height: 20,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //   ),
      // ),
    );
  }

  Refresh() {
    //transController.GetHistory();
  }
}

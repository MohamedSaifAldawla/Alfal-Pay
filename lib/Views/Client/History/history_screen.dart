import 'dart:io';

import 'package:alfalPay/Util/colors.dart';
import 'package:alfalPay/Util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Util/Globals/globals.dart';
import '../../../Util/Widgets/intro.dart';
import '../../../Util/Widgets/loader.dart';
import '../../../Util/Widgets/trans_card.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

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
            child: InkWell(
              onTap: refresh,
              child: SvgPicture.asset(
                "assets/icons/Refresh.svg",
                width: getProportionateScreenWidth(20),
                height: getProportionateScreenHeight(20),
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.kTextColor
                    : Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: transController.isLoading.value
              ? const Center(child: Loader())
              : transController.transactions.isEmpty
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
                            text: "no Transaction yet".tr,
                            weight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        Gap(getProportionateScreenWidth(10)),
                        FadeAnimation2(
                          1,
                          Container(
                            padding:
                                EdgeInsets.all(getProportionateScreenHeight(5)),
                            height: getProportionateScreenHeight(52),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? AppColors.kPrimaryLightColor
                                  : AppColors.kPrimaryDark3Color,
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColors.shadow
                                      : AppColors.shadow2,
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: getProportionateScreenHeight(15),
                                  right: getProportionateScreenHeight(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/Calendar.svg",
                                    height: getProportionateScreenHeight(45),
                                    color: AppColors.kPrimaryColor,
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (Platform.isIOS) {
                                            showCupertinoModalPopup(
                                              context: context,
                                              builder: (_) => SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        200),
                                                child: CupertinoDatePicker(
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .date,
                                                    initialDateTime: startDate,
                                                    onDateTimeChanged: (
                                                      DateTime newDate,
                                                    ) {
                                                      setState(() {
                                                        startDate = newDate;
                                                        debugPrint(
                                                            '$startDate');
                                                      });
                                                    }),
                                              ),
                                            );
                                          } else {
                                            _selectDate(context);
                                          }
                                        },
                                        child: BodyText(
                                          text:
                                              "${startDate.day}/${startDate.month}/${startDate.year}",
                                          color: AppColors.kSecondaryColor,
                                        ),
                                      ),
                                      Gap(getProportionateScreenHeight(10)),
                                      BodyText(
                                        text: "To2".tr,
                                        color: AppColors.kSecondaryColor,
                                      ),
                                      Gap(getProportionateScreenHeight(10)),
                                      InkWell(
                                        onTap: () {
                                          if (Platform.isIOS) {
                                            showCupertinoModalPopup(
                                              context: context,
                                              builder: (_) => SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        200),
                                                child: CupertinoDatePicker(
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .date,
                                                    initialDateTime: startDate,
                                                    onDateTimeChanged: (
                                                      DateTime newDate,
                                                    ) {
                                                      setState(() {
                                                        endDate = newDate;
                                                        debugPrint('$endDate');
                                                      });
                                                    }),
                                              ),
                                            );
                                          } else {
                                            _endDate(context);
                                          }
                                        },
                                        child: BodyText(
                                          text:
                                              "${endDate.day}/${endDate.month}/${endDate.year}",
                                          color: AppColors.kSecondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenWidth(25),
                                horizontal: getProportionateScreenWidth(5)),
                            physics: const BouncingScrollPhysics(),
                            itemCount: transController.transactions.length,
                            itemBuilder: (context, index) => FadeAnimation(
                              1,
                              TransCard(
                                icon1: 'assets/icons/Wallet.svg',
                                transactions:
                                    transController.transactions[index],
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }

  refresh() {
    startDate = DateTime.now();
    endDate = DateTime.now();
    transController.getTransactions2();
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != startDate) {
      setState(
        () {
          startDate = selected;
          debugPrint('$startDate');
        },
      );
    }
  }

  _endDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != endDate) {
      setState(
        () {
          endDate = selected;
          debugPrint('$endDate');
          transController.getTransactions2(
              startDate: startDate, endDate: endDate);
        },
      );
    }
  }
}

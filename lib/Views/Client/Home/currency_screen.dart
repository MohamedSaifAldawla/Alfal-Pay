import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Util/Widgets/state_helper.dart';

class CurrencyRates extends StatelessWidget {
  const CurrencyRates({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency".tr),
      ),
      body: StateHelper(
        icon: 'assets/icons/soon.json',
        title: 'Coming soon'.tr,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Util/Widgets/state_helper.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bills".tr),
      ),
      body: StateHelper(
        icon: 'assets/icons/soon.json',
        title: 'Coming soon'.tr,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Util/Widgets/intro.dart';
import '../../Util/Widgets/social_item.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/icons/maintenance.json',
                width: 350,
                height: 350,
                fit: BoxFit.fill,
              ),
              const Gap(30),
              BodyText(
                text: "Maintenance".tr,
                weight: FontWeight.bold,
                fontSize: 18,
              ),
              const Gap(40),
              BodyText(text: "--------  Reach us on  --------".tr),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: "assets/icons/Phone3.svg",
                    press: () {
                      // profileController
                      //     .launchInPhone("tel:${GetStorage().read("call")}");
                    },
                  ),
                  SocialCard(
                    icon: "assets/icons/WhatsApp.svg",
                    press: () {
                      // profileController.launchInBrowser(
                      //     "https://api.whatsapp.com/send?phone=${GetStorage().read("whatsapp")}");
                    },
                  ),
                  SocialCard(
                    icon: "assets/icons/Messenger.svg",
                    press: () {
                      // profileController
                      //     .launchInBrowser("${GetStorage().read("messenger")}");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

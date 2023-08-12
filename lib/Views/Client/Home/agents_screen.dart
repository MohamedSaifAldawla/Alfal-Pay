import 'package:alfalPay/Util/Globals/globals.dart';
import 'package:alfalPay/Util/Widgets/agents_card.dart';
import 'package:alfalPay/Util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Animations/FadeAnimation.dart';

class AgentsScreen extends StatelessWidget {
  const AgentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agents".tr),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => FadeAnimation(
                  1,
                  agentsCard(agent: agentsController.agents[index]),
                ),
                itemCount: agentsController.agents.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

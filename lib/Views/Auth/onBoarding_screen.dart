import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';
import '../../Util/Widgets/intro.dart';
import '../../Util/colors.dart';
import '../../routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 15),
            child: GestureDetector(
              onTap: () => Get.offAllNamed(Routes.welcome),
              child: Text(
                "Skip".tr,
                style: appBarText,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          FadeAnimation2(
            1.1,
            Image.asset(
              "assets/images/Onboarding.png",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          PageView(
            physics: const BouncingScrollPhysics(),
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: const [
              OnboardingPage(
                  img: "assets/images/logo.png",
                  title1: "Onboarding1",
                  title2: "Onboarding2",
                  body: "Onboarding3"),
              OnboardingPage(
                  img: "assets/images/logo2.png",
                  title1: "Onboarding4",
                  title2: "Onboarding5",
                  body: "Onboarding6"),
              OnboardingPage(
                  img: "assets/images/logo.png",
                  title1: "Onboarding1",
                  title2: "Onboarding2",
                  body: "Onboarding3"),
            ],
          ),
          if (GetStorage().read("lang") == "en")
            Positioned(
              bottom: 50,
              left: 30,
              child: Row(
                children: _buildIndicator(),
              ),
            ),
          if (GetStorage().read("lang") == "en")
            Positioned(
              bottom: 30,
              right: 30,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kPrimaryColor,
                ),
                child: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        if (currentIndex < 2) {
                          currentIndex++;
                          if (currentIndex < 3) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          }
                        } else {
                          Get.offAllNamed(Routes.welcome);
                        }
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          if (GetStorage().read("lang") == "ar")
            Positioned(
              bottom: 50,
              right: 30,
              child: Row(
                children: _buildIndicator(),
              ),
            ),
          if (GetStorage().read("lang") == "ar")
            Positioned(
              bottom: 30,
              left: 30,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kPrimaryColor,
                ),
                child: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        if (currentIndex < 2) {
                          currentIndex++;
                          if (currentIndex < 3) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          }
                        } else {}
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  //Create the indicator decorations widget
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: getProportionateScreenWidth(8),
      width: isActive
          ? getProportionateScreenWidth(25)
          : getProportionateScreenWidth(8),
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: isActive ? AppColors.kPrimaryColor : Colors.grey.shade500,
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(5),
        ),
      ),
    );
  }

//Create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
    required this.img,
    required this.title1,
    required this.title2,
    required this.body,
  }) : super(key: key);

  final String img, title1, title2, body;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            const EdgeInsets.only(top: 130, left: 50, right: 50, bottom: 80),
        child: Column(
          children: [
            FadeAnimation(
              1.3,
              Image.asset(
                img,
                height: getProportionateScreenHeight(200),
                width: getProportionateScreenWidth(200),
              ),
            ),
            FadeAnimation(
              1.3,
              BodyText(
                text: title1.tr,
                fontSize: getProportionateScreenWidth(32),
                color: AppColors.kPrimary2Color,
                weight: FontWeight.bold,
              ),
            ),
            FadeAnimation2(
              1.3,
              BodyText(
                text: title2.tr,
                fontSize: getProportionateScreenWidth(25),
                color: AppColors.kPrimary2Color,
              ),
            ),
            Gap(getProportionateScreenWidth(45)),
            FadeAnimation2(
              1.4,
              BodyText(
                text: body.tr,
                maxLines: 3,
                weight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

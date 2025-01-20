import 'package:first_flutter_app/features/onboarding/onbcontroller/controller.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/constants/textstring.dart';
import 'package:first_flutter_app/utils/custom_theme/button.dart';
import 'package:first_flutter_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../utils/custom_theme/text_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnController());
    return Scaffold(
      backgroundColor: AppColor.primary_color,
      body: Stack(children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatepage,
          children: [
            Onboardpage(
              img: "assets/images/png1.png",
              tlt: TextString.onTitle1,
              stlt: TextString.onSubTitle1,
            ),
            Onboardpage(
              img: "assets/images/png2.png",
              tlt: TextString.onTitle2,
              stlt: TextString.onSubTitle2,
            ),
            Onboardpage(
              img: "assets/images/png3.png",
              tlt: TextString.onTitle3,
              stlt: TextString.onSubTitle3,
            ),
          ],
        ),
        pageIndicator(),
        skipButton(),
        Positioned(
            bottom: DevUtils.bottomNavigation() + 30,
            child: SizedBox(
                width: DevUtils.getScreenWidth(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: ElevatedButton(
                    onPressed: () => OnController.instance.nextpage(),
                    child: Text("Next"),
                    style: ElivatedButton.customButtom.style,
                  ),
                ))),
      ]),
    );
  }
}

class pageIndicator extends StatelessWidget {
  const pageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnController.instance;
    return Positioned(
        bottom: DevUtils.bottomNavigation() * 4,
        left: DevUtils.getScreenWidth() * 0.42,
        child: SmoothPageIndicator(
          count: 3,
          controller: controller.pageController,
          onDotClicked: controller.dotnavigationclick,
          effect:
              SlideEffect(activeDotColor: AppColor.txt_primary, dotHeight: 5),
        ));
  }
}

class skipButton extends StatelessWidget {
  const skipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: DevUtils.appBarHeight() * 1.2,
        right: 25,
        child: TextButton(
            onPressed: () => OnController.instance.skippage(),
            child: Text("Skip",
            style: AppText.customText.bodyMedium,
            )));
  }
}

class Onboardpage extends StatelessWidget {
  const Onboardpage(
      {super.key, required this.img, required this.tlt, required this.stlt});

  final img, tlt, stlt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        SizedBox(
          height: DevUtils.appBarHeight() * 2,
        ),
        Text(
          tlt,
          style: AppText.customText.titleLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          stlt,
          style: AppText.customText.titleSmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 50,
        ),
        Image(
          image: AssetImage(img),
          width: DevUtils.getScreenWidth() * 0.7,
        ),
      ]),
    );
  }
}

import 'package:first_flutter_app/features/onboarding/screens/onboarding.dart';
import 'package:first_flutter_app/utils/constants/textstring.dart';
import 'package:first_flutter_app/utils/custom_theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      theme: LightTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FFF9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WELCOME",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 36,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "to Adventour-BD",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              TextString.wSubTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              // width: DevUtils.getScreenWidth(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 120),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const OnboardingScreen());
                  },
                  child: Text("Continue"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

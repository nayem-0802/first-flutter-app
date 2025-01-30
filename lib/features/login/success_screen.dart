import 'package:first_flutter_app/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/textstring.dart';
import '../../utils/custom_theme/text_theme.dart';
import '../../utils/device/device_utility.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: DevUtils.getScreenHeight(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: DevUtils.appBarHeight() * 3,
                ),
                Text(
                  "Email Verification Successful!",
                  style: AppText.customText.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  TextString.successful,
                  style: AppText.customText.labelSmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  "email@email.com",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  width: DevUtils.getScreenWidth(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120),
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const LoginPage()),
                      child: Text("Continue"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

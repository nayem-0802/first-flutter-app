import 'package:first_flutter_app/features/login/login_page.dart';
import 'package:first_flutter_app/features/login/success_screen.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/constants/textstring.dart';
import 'package:first_flutter_app/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_theme/text_theme.dart';

class VarifyEmailScreen extends StatelessWidget {
  const VarifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary_color,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginPage()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
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
                  height: DevUtils.appBarHeight() * 2,
                ),
                Text(
                  "Verify Your Email",
                  style: AppText.customText.titleLarge,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  TextString.varifyEmailSub,
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
                      onPressed: () => Get.to(() => const SuccessScreen()),
                      child: Text("Continue"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend request",
                    style: AppText.customText.bodySmall,
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

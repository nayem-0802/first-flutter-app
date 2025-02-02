import 'package:first_flutter_app/data/repository/auth_repository.dart';
import 'package:first_flutter_app/features/signup/verify_email_controller.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/constants/textstring.dart';
import 'package:first_flutter_app/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_theme/text_theme.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary_color,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthRepository.instance.logOut(),
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
                  email ?? 'example@gmail.com',
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
                      onPressed: () => controller.chechVerificationStatus(),
                      child: Text("Continue"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextButton(
                  onPressed: () => controller.sendEmailVerification(),
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

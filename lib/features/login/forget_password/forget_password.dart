import 'package:first_flutter_app/features/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/textstring.dart';
import '../../../utils/custom_theme/text_theme.dart';
import '../../../utils/device/device_utility.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
                  "Forget Password",
                  style: AppText.customText.titleLarge,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  TextString.forgetPassword,
                  style: AppText.customText.labelSmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "email",
                      hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: DevUtils.getScreenWidth(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120),
                    child: ElevatedButton(
                      onPressed: () => Get.offAll(() => const LoginPage()),
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

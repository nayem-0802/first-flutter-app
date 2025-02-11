import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/constants/textstring.dart';
import 'package:first_flutter_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primary_color,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Iconsax.arrow_left)),
        title: const Text(
          "Privacy Policy",
          style: TextStyle(fontSize: 22, color: AppColor.txt_primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Adventour BD",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: DevUtils.appBarHeight() * 0.85,
            ),
            Text(
              TextString.privacyPolicy,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

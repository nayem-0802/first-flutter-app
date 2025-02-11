import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/constants/textstring.dart';
import 'package:first_flutter_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
          "About us",
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
              "This app is developed by team \"Triforce\".",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Developers info:",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              TextString.name1,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              TextString.id1,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              TextString.leading,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              TextString.name2,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              TextString.id2,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              TextString.leading,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              TextString.name3,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              TextString.id3,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              TextString.leading,
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

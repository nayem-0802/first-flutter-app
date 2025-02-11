import 'package:first_flutter_app/features/login/login_page.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/custom_theme/button.dart';
import 'package:first_flutter_app/utils/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/device/device_utility.dart';

class JoinUsPage extends StatelessWidget {
  const JoinUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/images/join1.png"),
                  height: DevUtils.getScreenHeight() * 0.4,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "JOIN US NOW",
                  style: AppText.customText.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: DevUtils.getScreenWidth(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const LoginPage());
                      },
                      style: ElivatedButton.customButtom.style,
                      child: Text("Login"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: AppColor.ip_hint,
                  thickness: 1,
                  indent: 25,
                  endIndent: 25,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: DevUtils.getScreenWidth() * 0.5,
                      child: Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          "Want to become a guide?",
                          textAlign: TextAlign.center,
                          style: AppText.customText.titleMedium,
                        ),
                      ),
                    ),
                    Container(
                      width: DevUtils.getScreenWidth() * 0.4,
                      height: DevUtils.getScreenHeight() * 0.2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/join2.png'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: DevUtils.getScreenWidth(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElivatedButton.customButtom.style,
                      child: Text("Be a guide"),
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

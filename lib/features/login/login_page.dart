import 'package:first_flutter_app/features/login/forget_password/forget_password.dart';
import 'package:first_flutter_app/features/signup/signup.dart';
import 'package:first_flutter_app/utils/constants/sizes.dart';
import 'package:first_flutter_app/utils/custom_theme/loader.dart';
import 'package:first_flutter_app/utils/custom_theme/text_theme.dart';
import 'package:first_flutter_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/constants/colors.dart';
import '../../utils/custom_theme/button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: AppSizes.defaultSpace, right: AppSizes.defaultSpace),
          child: Container(
            height: DevUtils.getScreenHeight(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: AppText.customText.titleLarge,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.secondary_color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  width: DevUtils.getScreenWidth(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "email",
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "password",
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: true,
                                        onChanged: (value) {},
                                        activeColor: AppColor.txt_primary,
                                      ),
                                      const Text("Remember me"),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.to(() => ForgetPassword());
                                    },
                                    child: Text(
                                      "Forget password",
                                      style: AppText.customText.bodyLarge,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 100),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      CustomProgressIndicator.show();
                                    },
                                    child: Text("Login"),
                                    style: ElivatedButton.customButtom.style,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              Text(
                                "or",
                                style: AppText.customText.bodyLarge,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => Signup());
                                },
                                child: Text(
                                  "Create account",
                                  style: AppText.customText.bodyLarge,
                                ),
                              ),
                              SizedBox(
                                height: 125.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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

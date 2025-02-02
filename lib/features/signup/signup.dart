import 'package:first_flutter_app/features/login/login_page.dart';
import 'package:first_flutter_app/features/signup/singup_controller.dart';
import 'package:first_flutter_app/utils/validator/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/custom_theme/button.dart';
import '../../utils/custom_theme/text_theme.dart';
import '../../utils/device/device_utility.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SingupController());
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
                  "Signup",
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
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Form(
                          key: controller.signupFormKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: controller.name,
                                validator: (value) =>
                                    FormValidator.validateName(value),
                                decoration: InputDecoration(
                                  hintText: "name",
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              TextFormField(
                                controller: controller.email,
                                validator: (value) =>
                                    FormValidator.validateEmail(value),
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
                                controller: controller.phone,
                                validator: (value) =>
                                    FormValidator.validatephone(value),
                                decoration: InputDecoration(
                                  hintText: "phone",
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Obx(
                                () => TextFormField(
                                  controller: controller.password,
                                  validator: (value) =>
                                      FormValidator.validatepass(value),
                                  obscureText: controller.hidePass.value,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () => controller.hidePass
                                            .value = !controller.hidePass.value,
                                        icon: Icon(controller.hidePass.value
                                            ? Iconsax.eye_slash
                                            : Iconsax.eye)),
                                    hintText: "password",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              TextFormField(
                                controller: controller.conpass,
                                validator: (value) =>
                                    FormValidator.validateconpass(value),
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "confirm password",
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    onChanged: (value) {},
                                    activeColor: AppColor.txt_primary,
                                  ),
                                  const Text("Agree to Privacy policy"),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 100),
                                  child: ElevatedButton(
                                    onPressed: () => controller.signup(),
                                    child: Text("Submit"),
                                    style: ElivatedButton.customButtom.style,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => LoginPage());
                                },
                                child: Text(
                                  "Back to login",
                                  style: AppText.customText.bodyLarge,
                                ),
                              ),
                              SizedBox(
                                height: DevUtils.bottomNavigation() * 0.75,
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

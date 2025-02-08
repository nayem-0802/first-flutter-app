import 'package:first_flutter_app/features/login/login_controller.dart';
import 'package:first_flutter_app/features/signup/signup.dart';
import 'package:first_flutter_app/utils/constants/sizes.dart';
import 'package:first_flutter_app/utils/custom_theme/text_theme.dart';
import 'package:first_flutter_app/utils/device/device_utility.dart';
import 'package:first_flutter_app/utils/validator/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../utils/constants/colors.dart';
import '../../utils/custom_theme/button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: AppSizes.defaultSpace, right: AppSizes.defaultSpace),
          child: Container(
            height: DevUtils.getScreenHeight(),
            child: Form(
              key: controller.loginFormKey,
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
                          child: Column(
                            children: [
                              TextFormField(
                                controller: controller.email,
                                validator: (value) =>
                                    FormValidator.validateEmail(value),
                                decoration: InputDecoration(
                                  hintText: "email",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.normal),
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
                                  obscureText: controller.hidePassword.value,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () =>
                                            controller.hidePassword.value =
                                                !controller.hidePassword.value,
                                        icon: Icon(controller.hidePassword.value
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Keeps spacing balanced
                                children: [
                                  Expanded( // Allows Remember Me & Checkbox to take only needed space
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min, // Prevents unnecessary stretching
                                      children: [
                                        Obx(
                                              () => Checkbox(
                                            value: controller.rememberMe.value,
                                            onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                                            activeColor: AppColor.txt_primary,
                                          ),
                                        ),
                                        const Text("Remember me", style: TextStyle(fontSize: 14),),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forget password",
                                      style: AppText.customText.bodySmall,
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
                                    onPressed: () => controller.emailPasswordLogin(),
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
                                height: DevUtils.bottomNavigation(),
                              ),
                            ],
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
      ),
    );
  }
}

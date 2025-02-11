import 'package:first_flutter_app/features/main_screens/about_us.dart';
import 'package:first_flutter_app/features/main_screens/privacy_policy.dart';
import 'package:first_flutter_app/features/main_screens/update_screen.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/custom_theme/custom_delete_popup.dart';
import 'package:first_flutter_app/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../data/repository/auth_repository.dart';
import '../../utils/widgets/custom_item.dart';
import '../auth_controller/user_controller.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primary_color,
        scrolledUnderElevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
            ),
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/man.png"),
            ),
            const SizedBox(height: 10),

            // Username & Phone
            Obx(
              () => Text(
                controller.user.value.name,
                style: TextStyle(
                    wordSpacing: 1.5,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Obx(
              () => Text(
                controller.user.value.phone,
                style: TextStyle(color: AppColor.txt_accent, fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(8),
                width: DevUtils.getScreenWidth(),
                color: AppColor.secondary_color,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomItem(
                        title: "Edit information",
                        onTap: () {
                          Get.to(() => UpdateScreen());
                        },
                      ),
                      CustomItem(title: "Privacy policy",
                      onTap: (){
                        Get.to(PrivacyPolicy());
                      },
                      ),
                      CustomItem(title: "About us",
                        onTap: (){
                          Get.to(AboutUs());
                        },
                      ),

                      // Logout Button
                      CustomItem(
                        title: "Log out",
                        icon: Iconsax.logout,
                        iconColor: AppColor.warning_backgroung,
                        textColor: AppColor.warning_backgroung,
                        onTap: () => AuthRepository.instance.logOut(),
                      ),
                      CustomItem(
                        title: "Delete Account",
                        icon: Iconsax.profile_delete,
                        iconColor: AppColor.warning_backgroung,
                        textColor: AppColor.warning_backgroung,
                        onTap: (){
                            // Get.off(NavigationMenu());
                            showDialog(
                              barrierDismissible: false,
                                context: context,
                                builder: (context) =>
                                    CustomDeletePopup());
                        },
                        // onTap: () => AuthRepository.instance.logOut(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Menu Items
          ],
        ),
      ),
    );
  }
}

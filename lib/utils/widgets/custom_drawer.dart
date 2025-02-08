import 'package:first_flutter_app/features/auth_controller/user_controller.dart';
import 'package:first_flutter_app/features/main_screens/guide/be_a_guide.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Drawer(
      width: DevUtils.getScreenWidth() * 0.65,
      elevation: 0,
      child: Container(
        color: AppColor.primary_color,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColor.primary_color,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/man.png'),
                  ),
                  SizedBox(height: 10),
                  Obx(
                    () => Text(
                      controller.user.value.name,
                      style: TextStyle(
                        color: AppColor.txt_primary,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      controller.user.value.phone,
                      style: TextStyle(
                        color: AppColor.txt_accent,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.popup_backgroung,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: AppColor.txt_primary,
                      ),
                      title: Text(
                        'Home',
                        style: TextStyle(
                          color: AppColor.txt_primary,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    elevation: 0,
                    color: Colors.transparent,
                    // Keeps the background color from the container
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      // Ensures ripple stays inside
                      onTap: () {
                        Get.to(()=> BeAGuide());
                        },
                      splashColor: AppColor.popup_backgroung,
                      // Ripple effect color
                      highlightColor: AppColor.popup_backgroung,
                      // Pressed color
                      child: ListTile(
                        leading: Icon(Iconsax.profile_add),
                        title: Text(
                          'Be a Guide',
                          style: TextStyle(
                              color: AppColor.txt_primary,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                  // ListTile(
                  //   leading: Icon(Icons.account_circle_sharp, color: AppColor.txt_primary,),
                  //   title: Text(
                  //     'Be a Guide',
                  //     style: TextStyle(color: AppColor.txt_primary, fontWeight: FontWeight.normal),
                  //   ),
                  //   onTap: () {},
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

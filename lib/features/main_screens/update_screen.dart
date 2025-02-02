import 'package:first_flutter_app/features/auth_controller/update_controller.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../utils/custom_theme/button.dart';


class UpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateController());

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
          "Update information",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/man.png"),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Iconsax.edit),
              ],
            ),
            const SizedBox(height: 20),
            Form(
              key: controller.updateUserNameKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.username,
                    decoration: InputDecoration(
                      hintText: "new username",
                      hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: ElevatedButton(
                        onPressed: () => controller.updateUserName(),
                        child: Text("Update"),
                        style: ElivatedButton.customButtom.style,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
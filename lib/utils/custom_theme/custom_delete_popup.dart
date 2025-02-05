import 'package:first_flutter_app/features/auth_controller/user_controller.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDeletePopup extends StatelessWidget {
  const CustomDeletePopup({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return AlertDialog(
      backgroundColor: AppColor.warning_backgroung,
      title: Text('Warning!',
          style: TextStyle(color: AppColor.primary_color),
          textAlign: TextAlign.center),
      content: Text(
        'Your account will be delete permanently. Are you confirm to delete your account?',
        textAlign: TextAlign.center, // ✅ Centered text
      ),
      actions: [
        Center(
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 16),
                    backgroundColor: AppColor.txt_primary,
                    foregroundColor: AppColor.primary_color,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text('Cancel'),
              ),
              Spacer(),
              TextButton(
                onPressed: () => controller.deleteUserAccount(),
                style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 16),
                    backgroundColor: AppColor.txt_primary,
                    foregroundColor: AppColor.primary_color,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text('Delete'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

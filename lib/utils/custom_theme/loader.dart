import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomProgressIndicator {
  static void show() {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: AppColor.primary_color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColor.txt_secondary),
              ),
              SizedBox(height: 16),
              Text(
                "Please wait",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void hide() {
    Navigator.pop(Get.overlayContext!);
  }
}

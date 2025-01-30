import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppText {
  AppText._();
  static TextTheme customText = TextTheme(
    //custom title theme
    titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColor.txt_primary),
    titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: AppColor.txt_secondary),
    titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: AppColor.txt_primary),

    //body text theme
    bodyLarge: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: AppColor.txt_primary),
    bodyMedium: TextStyle(fontSize: 14,fontWeight: FontWeight.normal, color: AppColor.txt_primary),
    bodySmall: TextStyle(fontSize: 12,fontWeight: FontWeight.normal, color: AppColor.txt_secondary),

    //list text theme
    labelLarge: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: AppColor.txt_primary),
    labelMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: AppColor.txt_primary),
    labelSmall: TextStyle(fontSize: 14,fontWeight: FontWeight.normal, color: AppColor.txt_accent),

  );
}
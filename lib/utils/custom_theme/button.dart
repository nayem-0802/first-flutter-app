import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ElivatedButton {
  ElivatedButton._();

  static final customButtom = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: AppColor.btn_text_color,
        backgroundColor: AppColor.btn_primary,
        disabledForegroundColor: AppColor.btn_text_color,
        disabledBackgroundColor: AppColor.btn_disable,
        padding: EdgeInsets.symmetric(vertical: 12),
        textStyle: TextStyle(fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.btn_text_color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      )
  );
}
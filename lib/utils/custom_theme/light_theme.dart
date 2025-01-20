import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/custom_theme/button.dart';
import 'package:first_flutter_app/utils/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/utils/custom_theme/text_field.dart';

class LightTheme {
  LightTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: AppColor.primary_color,
    scaffoldBackgroundColor: AppColor.primary_color,
    textTheme: AppText.customText,
    elevatedButtonTheme: ElivatedButton.customButtom,
    inputDecorationTheme: InputField.inputTheme,
  );
}

import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
class InputField{
  InputField._();

  static InputDecorationTheme inputTheme = InputDecorationTheme(
    hintStyle: const TextStyle().copyWith(fontSize: 16, color: AppColor.ip_hint),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(width: 1, style: BorderStyle.solid, color: AppColor.ip_stroke),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(width: 1, style: BorderStyle.solid, color: AppColor.ip_focus),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(width: 1, style: BorderStyle.solid, color: AppColor.ip_focus),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(width: 1, style: BorderStyle.solid, color: AppColor.ip_error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(width: 1, style: BorderStyle.solid, color: AppColor.ip_error),
    ),
  );
}
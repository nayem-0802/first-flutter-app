import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.popup_backgroung
        ),
      ),
    );
  }
}

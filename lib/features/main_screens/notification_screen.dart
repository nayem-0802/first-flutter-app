import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/custom_theme/text_theme.dart';
import 'package:first_flutter_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import '../../utils/widgets/custom_item.dart';


class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primary_color,
        scrolledUnderElevation: 0,
        title: const Text(
          "Notifications",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "clear all ",
                    style: AppText.customText.bodyMedium,
                  )),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.all(8),
                width: DevUtils.getScreenWidth(),
                color: AppColor.secondary_color,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomItem(title: "Edit information"),
                      CustomItem(title: "Change app language"),
                      CustomItem(title: "Privacy policy"),
                      CustomItem(title: "About us"),
                      CustomItem(title: "Edit information"),
                      CustomItem(title: "Change app language"),
                      CustomItem(title: "Privacy policy"),
                      CustomItem(title: "About us"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

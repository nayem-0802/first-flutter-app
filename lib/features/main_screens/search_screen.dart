import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import '../../utils/widgets/custom_item.dart';

class SearchScreen extends StatelessWidget {
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
            Container(
              height: DevUtils.appBarHeight() + 8,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.secondary_color,
                  hintText: 'Search...',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
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

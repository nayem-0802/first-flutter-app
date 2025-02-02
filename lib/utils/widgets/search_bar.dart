import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/colors.dart';
import '../device/device_utility.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key, this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Container(
          width: DevUtils.getScreenWidth(),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.secondary_color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColor.search_stroke),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.search_normal,
                color: AppColor.txt_accent,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                "Search here",
                style: TextStyle(color: AppColor.search_stroke),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// return GestureDetector
// (
// onTap: onTap,
// child: Padding(
// padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
// child: Material(
// elevation: 4, // Adds shadow
// borderRadius: BorderRadius.circular(8),
// color: Colors.transparent, // Important for InkWell effect
// child: InkWell(
// borderRadius: BorderRadius.circular(8), // Matches container
// onTap: onTap,
// splashColor: Colors.grey.withOpacity(0.3), // Light ripple effect
// highlightColor: Colors.grey.withOpacity(0.1), // Click feedback effect
// child: Container(
// width: DevUtils.getScreenWidth(),
// padding: EdgeInsets.all(10),
// decoration: BoxDecoration(
// color: AppColor.secondary_color,
// borderRadius: BorderRadius.circular(8),
// border: Border.all(color: AppColor.search_stroke),
// ),
// child: Row(
// children: [
// Icon(
// Iconsax.search_normal,
// color: AppColor.txt_accent,
// ),
// const SizedBox(width: 12),
// Text(
// "Search here",
// style: TextStyle(color: AppColor.search_stroke),
// ),
// ],
// ),
// ),
// ),
// )
// ,
// )
// ,
// );


// TextField
// (
// decoration: InputDecoration(
// hintText: 'Search...',
// suffixIcon: Icon(Icons.search),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(8.0),
// ),
//
// ),
//
// ),

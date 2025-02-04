import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomItem extends StatelessWidget {
  CustomItem({
    Key? key,
    required this.title,
    this.icon,
    this.iconColor,
    this.textColor,
    this.onTap,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final Color? iconColor;
  final Color? textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColor.primary_color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // Shadow color
            blurRadius: 3, // Softness of the shadow
            spreadRadius: 1, // How much the shadow spreads
            offset: const Offset(2, 2), // Changes position of shadow (x, y)
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        // Keeps the background color from the container
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          // Ensures ripple stays inside
          onTap: onTap,
          splashColor: AppColor.secondary_color,
          // Ripple effect color
          highlightColor: Colors.blueGrey,
          // Pressed color
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5), // Avoids overflow
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                  color: textColor ?? AppColor.txt_secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: icon != null ? Icon(icon, color: iconColor) : null,
            ),
          ),
        ),
      ),
    );
  }
}
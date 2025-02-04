import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.popup_backgroung,
      title: Text('Submitted!',
          style: TextStyle(color: AppColor.txt_primary),
          textAlign: TextAlign.center),
      content: Text(
        'Your information is under review. Our team will contact with you soon.',
        textAlign: TextAlign.center, // ✅ Centered text
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
                backgroundColor: AppColor.txt_primary,
                foregroundColor: AppColor.primary_color,
                padding: EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text('OK'),
          ),
        ),
      ],
    );
  }
}

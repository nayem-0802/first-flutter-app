import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      backgroundColor: AppColor.popup_backgroung, // ✅ Changed popup background color
      title: Text('Congratulations!', textAlign: TextAlign.center), // ✅ Centered title
      content: Text(
        'Your information is under review. Our team will contact you soon.',
        textAlign: TextAlign.center, // ✅ Centered text
      ),
      actions: [
        Center( // ✅ Centered the OK button
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              backgroundColor: Color(0xff1A444F),
              foregroundColor: Colors.white,
            ),
            child: Text('OK'),
          ),
        ),
      ],
    );
  }
}
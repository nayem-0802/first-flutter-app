import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class PlaceDelaitsScreen extends StatelessWidget {
  const PlaceDelaitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary_color,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.txt_primary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Place Details',
          style: TextStyle(color: AppColor.txt_primary, fontSize: 18),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Text(
              "SADA PATHOR",
              style: AppText.customText.titleLarge,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Some popular Spots",
                  style: AppText.customText.titleSmall,
                ),
                Text(
                  "Some popular Spots",
                  style: AppText.customText.titleSmall,
                ),
                Text(
                  "Some popular Spots",
                  style: AppText.customText.titleSmall,
                ),
                Text(
                  "Some popular Spots",
                  style: AppText.customText.titleSmall,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Our guides",
              style: AppText.customText.titleMedium,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              color: AppColor.secondary_color,
              child: ListView.builder(
                itemCount: 10, // Number of guides
                itemBuilder: (context, index) {
                  return GuideTile();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Guide Tile Widget
class GuideTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primary_color,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
              spreadRadius: 2.0,
              offset: Offset(1, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage:
                AssetImage('assets/images/man.png'),
          ),
          title: Row(
            children: [
              Text(
                'Tanvir Ahmed',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.txt_primary),
              ),
              SizedBox(width: 5),
              Icon(Icons.check_circle, color: Colors.blue, size: 16),
              // Verified icon
            ],
          ),
          subtitle: Text(
            'Volagonj, Sylhet',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

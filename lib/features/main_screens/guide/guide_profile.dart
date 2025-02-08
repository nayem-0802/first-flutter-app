import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/device/device_utility.dart';

class GuideProfile extends StatelessWidget {
  final name, place, services;

  const GuideProfile({super.key, this.name, this.place, this.services});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary_color,
        scrolledUnderElevation: 0,
        title: Text(
          'Guide\'s Profile',
          style: TextStyle(fontSize: 18, color: AppColor.txt_primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            SizedBox(height: 8),
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/man.png'),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(place),
            SizedBox(height: 5),
            Text(services??"No services"),
            SizedBox(height: 20),
            // Reviews Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Given Reviews',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.txt_secondary),
                ),
              ),
            ),
            SizedBox(height: 10),

            Flexible(
                child: Container(
              padding: EdgeInsets.all(8),
              width: DevUtils.getScreenWidth(),
              color: AppColor.secondary_color,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Reviews Section (Responsive)
                    _buildReviews(),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  // Reviews Section
  Widget _buildReviews() {
    return ListView(
      shrinkWrap: true, // Makes it fit inside SingleChildScrollView
      physics: NeverScrollableScrollPhysics(), // Disables internal scrolling
      children: [
        _reviewItem('Great experience with the guide!'),
        _reviewItem('Very helpful and friendly.'),
        _reviewItem('The trip was amazing!'),
        _reviewItem('Great experience with the guide!'),
        _reviewItem('Very helpful and friendly.'),
        _reviewItem('The trip was amazing!'),
        _reviewItem('Great experience with the guide!'),
        _reviewItem('Very helpful and friendly.'),
        _reviewItem('The trip was amazing!'),
        _reviewItem('Very helpful and friendly.'),
        _reviewItem('The trip was amazing!'),
      ],
    );
  }

  // Review Item
  Widget _reviewItem(String reviewText) {
    return Card(
      color: AppColor.primary_color,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          reviewText,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

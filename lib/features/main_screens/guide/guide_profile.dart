import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/custom_theme/custom_popup.dart';
import 'package:flutter/material.dart';


class GuideProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary_color,
      // drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppColor.primary_color,
        title: Text(
          'Profile',
          style: TextStyle(color: AppColor.txt_primary,fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomPopup(),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Section with Scrollable View
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'Tanvir Ahmed',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff0E3640)),
                ),
                Text('Joined JAN 2022\nVolagonj, Sylhet'),
                SizedBox(height: 20),

                // Tabs for Posts & Reviews
                _tabsSection(context),
              ],
            ),
          ),
          SizedBox(height: 10),
          // Posts or Reviews Section (Scrollable)
          Expanded(child: _buildPosts()), // Default: Showing Posts
        ],
      ),
    );
  }

  // Tabs for Posts & Reviews
  Widget _tabsSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _tabButton(context, 'Posts', true),
        SizedBox(width: 25),
        _tabButton(context, 'Reviews', false),
      ],
    );
  }

  // Tab Button (Reusable)
  Widget _tabButton(BuildContext context, String text, bool isPosts) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xff0E3640),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Posts Section
  Widget _buildPosts() {
    return ListView(
      children: [
        _postItem('Visited Srimangal', 'assets/srimangal.jpg'),
        _postItem('Exploring Cox\'s Bazar', 'assets/coxsbazar.jpg'),
        _postItem('Beautiful Sundarbans', 'assets/sundarbans.jpg'),
      ],
    );
  }

  // Reviews Section
  // Widget _buildReviews() {
  //   return ListView(
  //     children: [
  //       _reviewItem('Great experience with the guide!'),
  //       _reviewItem('Very helpful and friendly.'),
  //       _reviewItem('The trip was amazing!'),
  //     ],
  //   );
  // }

  // Post Item with Image
  Widget _postItem(String text, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        children: [
          Image.asset(imagePath, fit: BoxFit.cover, height: 150, width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Review Item
  // Widget _reviewItem(String reviewText) {
  //   return Card(
  //     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
  //     child: Padding(
  //       padding: const EdgeInsets.all(12.0),
  //       child: Text(
  //         reviewText,
  //         style: TextStyle(fontSize: 16),
  //       ),
  //     ),
  //   );
  // }
}

// Separate Pages for Posts & Reviews (Navigation)
// class PostsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Posts')),
//       body: ProfilePage()._buildPosts(),
//     );
//   }
// }
//
// class ReviewsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Reviews')),
//       body: ProfilePage()._buildReviews(),
//     );
//   }
// }

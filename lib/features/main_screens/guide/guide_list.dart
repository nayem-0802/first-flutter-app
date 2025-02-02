import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class GuideList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary_color,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.txt_primary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'All Guide List',
          style: TextStyle(color: AppColor.txt_primary,fontSize: 18),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Location Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Text(
              'Sada pthor',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.txt_secondary,
              ),
            ),
          ),

          // Guide List
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Number of guides
              itemBuilder: (context, index) {
                return GuideTile();
              },
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
          color: Color(0xffF5F5F5),
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
            backgroundImage: AssetImage('assets/images/placeholder.jpg'), // Replace with guide image
          ),
          title: Row(
            children: [
              Text(
                'Tanvir Ahmed',
                style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff0E3640)),
              ),
              SizedBox(width: 5),
              Icon(Icons.check_circle, color: Colors.blue, size: 16), // Verified icon
            ],
          ),
          subtitle: Text(
            'Volagonj, Sylhet',
            style: TextStyle(color: Colors.grey),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.orange, size: 16),
              SizedBox(width: 5),
              Text(
                '3.9',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class GuideList extends StatelessWidget {
//   final List<Map<String, String>> guides = [
//     {"name": "Tanvir Ahmed", "location": "Volaganj, Sylhet", "rating": "4.9"},
//     {"name": "Arif Hossain", "location": "Sreemangal, Sylhet", "rating": "4.8"},
//     {"name": "Mizanur Rahman", "location": "Jaflong, Sylhet", "rating": "4.7"},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         title: Text('Available Guides'),
//       ),
//       body: ListView.builder(
//         itemCount: guides.length,
//         itemBuilder: (context, index) {
//           final guide = guides[index];
//           return ListTile(
//             leading: CircleAvatar(
//               backgroundColor: Colors.blue,
//               child: Text(guide['name']![0]),
//             ),
//             title: Text(guide['name']!),
//             subtitle: Text('${guide['location']} - Rating: ${guide['rating']}'),
//             trailing: Icon(Icons.arrow_forward),
//             onTap: () {
//               // Perform an action when a guide is tapped
//             },
//           );
//         },
//       ),
//     );
//   }
// }
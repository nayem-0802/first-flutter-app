import 'package:first_flutter_app/features/auth_controller/user_controller.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Drawer(
      elevation: 0,
      child: Container(
        color: AppColor.primary_color, // ✅ Changed drawer body color
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColor.primary_color, // ✅ Changed drawer header color
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/man.png'),
                  ),
                  SizedBox(height: 10),
                  Obx(
                    ()=> Text(
                      controller.user.value.name,
                      style: TextStyle(
                        color: Color(0xff0E3640),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Volagonj, Sylhet',
                    style: TextStyle(
                      color: Color(0xff0E3640),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Icon(Icons.home, color: Color(0xff0E3640)),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Color(0xff0E3640)),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.edit, color: Color(0xff0E3640)), // ✅ Added Edit Profile
                    title: Text(
                      'Edit Profile',
                      style: TextStyle(color: Color(0xff0E3640)),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Color(0xff0E3640)),
                    title: Text(
                      'Settings',
                      style: TextStyle(color: Color(0xff0E3640)),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Color(0xff0E3640)),
                    title: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xffE8F6E8), // ✅ Changed drawer header color
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'Tanvir Ahmed',
                  style: TextStyle(
                    color: Color(0xff0E3640),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Volagonj, Sylhet',
                  style: TextStyle(
                    color: Color(0xff0E3640),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Color(0xff0E3640)),
            title: Text('Home'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Color(0xff0E3640)),
            title: Text('Settings'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
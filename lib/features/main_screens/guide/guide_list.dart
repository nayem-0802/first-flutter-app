import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'guide_controller.dart';
import 'guide_profile.dart';

class GuideList extends StatelessWidget {
  const GuideList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GuideController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primary_color,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(
          'All Guide List',
          style: TextStyle(color: AppColor.txt_primary, fontSize: 18),
        ),
      ),
      body: Obx(
        () {
          if(controller.guideList.isEmpty){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  color: AppColor.secondary_color,
                  child: ListView.builder(
                    itemCount: controller.guideList.length,
                    // Number of guides
                    itemBuilder: (context, index) {
                      final singleGuide = controller.guideList[index];
                      return GuideTile(singleGuide: singleGuide);
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Guide Tile Widget
class GuideTile extends StatelessWidget {
  final singleGuide;

  const GuideTile({super.key, required this.singleGuide});

  @override
  Widget build(BuildContext context) {
    final controller = GuideController.instance;
    
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
                AssetImage('assets/images/man.png'), // Replace with guide image
          ),
          title: Text(
            '${singleGuide['name']}',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.txt_primary),
          ),
          subtitle: Text(
            '${singleGuide['area']} , ${singleGuide['city']}',
            style: TextStyle(color: Colors.grey),
          ),
          trailing: IconButton(icon: Icon(Iconsax.call), onPressed: () {
            controller.guideCall('${singleGuide['phone']}');
          },),
          onTap: (){
            Get.to(() => GuideProfile(
              name: singleGuide['name'],
              place:
              '${singleGuide['area']}, ${singleGuide['city']}',
              services:
              singleGuide['services'],
            ));
          },
        ),
      ),
    );
  }
}
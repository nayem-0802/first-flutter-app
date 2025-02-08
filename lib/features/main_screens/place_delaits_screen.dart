import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import 'guide/guide_controller.dart';
import 'guide/guide_profile.dart';

class PlaceDelaitsScreen extends StatelessWidget {
  const PlaceDelaitsScreen({super.key, required this.placeName});
  final String placeName;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GuideController());
    controller.fetchGuideForPlace(placeName);

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
              placeName,
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
            child: Obx(
                  () {
                if(controller.guideListPlace.isEmpty){
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
                          itemCount: controller.guideListPlace.length,
                          // Number of guides
                          itemBuilder: (context, index) {
                            final singleGuide = controller.guideListPlace[index];
                            return GuideTile(singleGuide: singleGuide);
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            // child: Container(
            //   padding: EdgeInsets.symmetric(vertical: 8),
            //   color: AppColor.secondary_color,
            //   child: ListView.builder(
            //     itemCount: 10, // Number of guides
            //     itemBuilder: (context, index) {
            //       return GuideTile();
            //     },
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}

// Guide Tile Widget
class GuideTile extends StatelessWidget {
  final singleGuide;

  const GuideTile({super.key, this.singleGuide});

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
                AssetImage('assets/images/man.png'),
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
          trailing: IconButton(onPressed: (){
            controller.guideCall('${singleGuide['phone']}');
          }, icon: Icon(Iconsax.call)),
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

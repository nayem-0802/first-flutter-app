import 'package:first_flutter_app/features/main_screens/guide/guide_profile.dart';
import 'package:first_flutter_app/features/main_screens/place_delaits_screen.dart';
import 'package:first_flutter_app/features/main_screens/search_controller.dart';
import 'package:first_flutter_app/navigation_menu.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/widgets/custom_drawer.dart';
import 'package:first_flutter_app/utils/widgets/popular_guides.dart';
import 'package:first_flutter_app/utils/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/widgets/populer_places.dart';
import 'guide/guide_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final placecontroller = Get.put(SearchPlacesController());
    final controller = Get.put(GuideController());

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppColor.primary_color,
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          "Adventour BD",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    CustomSearchBar(),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Popular places",
                                style: Theme.of(context).textTheme.bodyLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                              TextButton(
                                  onPressed: () {
                                    Get.find<NavigationController>()
                                        .selectedIndex
                                        .value = 1;
                                  },
                                  child: Text("see all",
                                      style: TextStyle(
                                          color: AppColor.txt_secondary,
                                          fontSize: 14)))
                            ],
                          ),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: placecontroller.allPlaces.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  final placename = placecontroller.allPlaces[index];
                                  return PopulerPlaces(
                                      image: 'assets/images/Sylhet.jpg',
                                      title: placename,
                                      onTap: () {
                                        Get.to(() => PlaceDelaitsScreen(
                                              placeName: placename,
                                            ));
                                      });
                                }),
                          ),
                          Row(
                            children: [
                              Text(
                                "Popular guides",
                                style: Theme.of(context).textTheme.bodyLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                              TextButton(
                                  onPressed: () {
                                    Get.find<NavigationController>()
                                        .selectedIndex
                                        .value = 2;
                                  },
                                  child: Text("see all",
                                      style: TextStyle(
                                          color: AppColor.txt_secondary,
                                          fontSize: 14)))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Obx(
                            () => SizedBox(
                              height: 120,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.guideList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    final singleGuide =
                                        controller.guideList[index];
                                    return PopularGuides(
                                        image: 'assets/images/man.png',
                                        title: '${singleGuide['name']}',
                                        onTap: () {
                                          Get.to(() => GuideProfile(
                                                name: singleGuide['name'],
                                                place:
                                                    '${singleGuide['area']}, ${singleGuide['city']}',
                                                services:
                                                    singleGuide['services'],
                                              ));
                                        });
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:first_flutter_app/data/repository/auth_repository.dart';
import 'package:first_flutter_app/features/main_screens/guide/guide_list.dart';
import 'package:first_flutter_app/features/main_screens/guide/guide_profile.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/widgets/custom_drawer.dart';
import 'package:first_flutter_app/utils/widgets/popular_guides.dart';
import 'package:first_flutter_app/utils/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/widgets/populer_places.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppColor.primary_color,
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
                                  onPressed: () {},
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
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  return PopulerPlaces(
                                      image: 'assets/images/join2.png',
                                      title: 'Place name',
                                      onTap: () {});
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
                                    Get.to(()=> GuideList());
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
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  return PopularGuides(
                                      image: 'assets/images/man.png',
                                      title: 'Guide name',
                                      onTap: () {
                                        Get.to (()=> GuideProfile());
                                      });
                                }),
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

import 'package:first_flutter_app/features/main_screens/place_delaits_screen.dart';
import 'package:first_flutter_app/features/main_screens/search_controller.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchPlacesController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primary_color,
        scrolledUnderElevation: 0,
        title: const Text(
          "Search",
          style: TextStyle(color: AppColor.txt_primary, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: DevUtils.appBarHeight() + 8,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TextField(
                onChanged: controller.filterSearchResults,
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.secondary_color,
                  hintText: 'Search...',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.filteredPlaces.length,
                    itemBuilder: (context, index) {
                      String placename = controller.filteredPlaces[index];
                      return ListTile(
                        titleTextStyle: TextStyle(
                            color: AppColor.txt_primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                        title: Text(controller.filteredPlaces[index]),
                        onTap: (){
                          Get.to(() => PlaceDelaitsScreen(placeName: placename,));
                        },
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

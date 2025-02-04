import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/custom_theme/button.dart';
import '../../../utils/custom_theme/custom_popup.dart';
import '../../../utils/custom_theme/text_theme.dart';
import '../../../utils/device/device_utility.dart';

class BeAGuide extends StatelessWidget {
  const BeAGuide({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SingupController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: AppSizes.defaultSpace, right: AppSizes.defaultSpace),
          child: Container(
            height: DevUtils.getScreenHeight(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Guide Form",
                  style: AppText.customText.titleLarge,
                ),
                Text(
                  "Enter The Information as Your NID",
                  style: AppText.customText.bodyMedium,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.secondary_color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  width: DevUtils.getScreenWidth(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Full Name",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Nid Number",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "City",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Area to be Guide",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Postal/ZIP Code",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (value) {},
                                      activeColor: AppColor.txt_primary,
                                    ),
                                    GestureDetector(
                                      child:
                                          const Text("Agree to Privacy policy"),
                                      onTap: () {},
                                    ),
                                    SizedBox(
                                      width: 25.0,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 100),
                                    child: ElevatedButton(
                                      child: Text("Submit"),
                                      style: ElivatedButton.customButtom.style,
                                      onPressed: () {
                                        Get.off(NavigationMenu());
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                CustomPopup());
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: DevUtils.bottomNavigation() * 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

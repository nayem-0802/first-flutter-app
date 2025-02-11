import 'package:first_flutter_app/utils/validator/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/custom_theme/button.dart';
import '../../../utils/custom_theme/text_theme.dart';
import '../../../utils/device/device_utility.dart';
import 'guide_update_controller.dart';

class BeAGuide extends StatelessWidget {
  const BeAGuide({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GudieUpdateController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.primary_color,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Iconsax.arrow_left)),
        title: const Text(
          "About us",
          style: TextStyle(fontSize: 22, color: AppColor.txt_primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: AppSizes.defaultSpace, right: AppSizes.defaultSpace),
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
                          key: controller.updateGuideKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) => FormValidator.validateEmpty(value, 'Full name'),
                                controller: controller.fullname,
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
                                controller: controller.nid,
                                validator: (value) => FormValidator.validateEmpty(value, 'Nid number'),
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
                                controller: controller.city,
                                validator: (value) => FormValidator.validateEmpty(value, 'City'),
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
                                controller: controller.area,
                                validator: (value) => FormValidator.validateEmpty(value, 'Area'),
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
                                controller: controller.postalcode,
                                validator: (value) => FormValidator.validateEmpty(value, 'Postal code'),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Postal/ZIP Code",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              TextFormField(
                                maxLines: 3,
                                controller: controller.services,
                                validator: (value) => FormValidator.validateEmpty(value, 'Services'),
                                decoration: InputDecoration(
                                  hintText: "Enter the services you provide.\n1. Local Transportation\n2. Emergency Services",
                                  hintMaxLines: 3,
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.normal),
                                ),
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
                                    style: ElivatedButton.customButtom.style,
                                    onPressed: () {
                                      controller.updateAsGuide();
                                    },
                                    child: Text("Submit"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: DevUtils.bottomNavigation(),
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
    );
  }
}

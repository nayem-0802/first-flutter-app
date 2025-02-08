import 'package:first_flutter_app/navigation_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/repository/user_ripository.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/custom_theme/custom_snack.dart';
import '../../../utils/custom_theme/loader.dart';
import '../../auth_controller/user_controller.dart';

class GudieUpdateController extends GetxController{
  static GudieUpdateController get instance => Get.find();

  final fullname = TextEditingController();
  final nid = TextEditingController();
  final city = TextEditingController();
  final area = TextEditingController();
  final postalcode = TextEditingController();
  final services = TextEditingController();
  final userController = UserController.instance;
  final userRipository = Get.put(UserRipository());
  GlobalKey<FormState> updateGuideKey = GlobalKey<FormState>();


  Future<void> updateAsGuide() async{
    try{
      CustomProgressIndicator.show();

      if(!updateGuideKey.currentState!.validate()){
        CustomProgressIndicator.hide();
        return;
      }

      Map<String, dynamic> newGuide = {
        'name' : fullname.text,
        'nid' : nid.text.trim(),
        'city' : city.text.trim(),
        'area' : area.text.trim(),
        'postalcode' : postalcode.text.trim(),
        'role' : 'guide',
        'services' : services.text.trim(),
      };

      await userRipository.updateSingleFeild(newGuide);

      userController.user.value.name = fullname.text.trim();
      userController.user.value.nid = nid.text.trim();
      userController.user.value.city = city.text.trim();
      userController.user.value.area = area.text.trim();
      userController.user.value.postalcode = postalcode.text.trim();
      userController.user.value.role = 'guide';
      userController.user.value.services = services.text.trim();

      CustomProgressIndicator.hide();

      CustomSnackbar.show("Done!", "Information Uploaded successfully", AppColor.success_backgroung);
      Get.off(()=> const NavigationMenu());

    }catch (e){
      CustomProgressIndicator.hide();
      CustomSnackbar.show("Failed!", "Something went wrong, please try again", AppColor.warning_backgroung);
    }
  }


}
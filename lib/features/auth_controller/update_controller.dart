
import 'package:first_flutter_app/data/repository/user_ripository.dart';
import 'package:first_flutter_app/features/auth_controller/user_controller.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/custom_theme/custom_snack.dart';
import 'package:first_flutter_app/utils/custom_theme/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController{
  static UpdateController get instance => Get.find();

  final username = TextEditingController();
  final phone = TextEditingController();
  final userController = UserController.instance;
  final userRipository = Get.put(UserRipository());
  GlobalKey<FormState> updateUserNameKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializedName();
    super.onInit();
  }

  Future<void> initializedName() async{
    username.text = userController.user.value.name;
  }

  Future<void> updateUserName() async{
    try{
      CustomProgressIndicator();

      Map<String, dynamic> name = {
        'name' : username.text.trim(),
      };

      await userRipository.updateSingleFeild(name);

      userController.user.value.name = username.text.trim();

      CustomProgressIndicator.hide();

      CustomSnackbar.show("Done!", "Information Updated successfully", AppColor.success_backgroung);
      Get.back();

    }catch (e){
      CustomProgressIndicator.hide();
      CustomSnackbar.show("Failed!", "Something went wrong, please try again", AppColor.warning_backgroung);
    }
  }





}
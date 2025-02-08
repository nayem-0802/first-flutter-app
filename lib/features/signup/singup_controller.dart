import 'package:first_flutter_app/data/repository/auth_repository.dart';
import 'package:first_flutter_app/features/login/varify_email.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/custom_theme/custom_snack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/repository/user_model.dart';
import '../../data/repository/user_ripository.dart';
import '../../utils/custom_theme/loader.dart';


class SingupController extends GetxController {
  static SingupController get instance => Get.find();

  final hidePass = true.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final conpass = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {

    //Format Validation
    try{

      CustomProgressIndicator.show();

      if(!signupFormKey.currentState!.validate()){
        CustomProgressIndicator.hide();
        return;
      }

      final userCredential = await AuthRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      final newUsre = UserModel(
        id: userCredential.user!.uid,
        name : name.text,
        role : 'user',
        nid : '',
        email: email.text.trim(),
        phone : phone.text.trim(),
        city : '',
        area : '',
        postalcode: '',
        services: '',
        profilePic : '',
      );

      final userRipository = Get.put(UserRipository());
      await userRipository.saveUserRecord(newUsre);

      CustomProgressIndicator.hide();

      CustomSnackbar.show("Successful!", "Account created successfully", AppColor.success_backgroung);
      Get.to(()=> VerifyEmailScreen(email: email.text.trim()));

    }catch (e){
      CustomProgressIndicator.hide();
      CustomSnackbar.show("Failed", "Something went wrong", AppColor.warning_backgroung);
    }

  }
}

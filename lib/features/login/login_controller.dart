import 'package:first_flutter_app/data/repository/auth_repository.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/custom_theme/custom_snack.dart';
import 'package:first_flutter_app/utils/custom_theme/loader.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  Future<void> emailPasswordLogin() async{
    try{
      CustomProgressIndicator.show();

      if(!loginFormKey.currentState!.validate()){
        CustomProgressIndicator.hide();
        return;
      }
      if(rememberMe.value){
        localStorage.write('remember_email', email.text.trim());
        localStorage.write('remember_password', password.text.trim());
      }

      final userCredentials = await AuthRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      CustomProgressIndicator.hide();

      CustomSnackbar.show("Successful!", "Account logged in successfully", AppColor.success_backgroung);
      AuthRepository.instance.screenRedirect();

    }catch (e){
      CustomProgressIndicator.hide();
      CustomSnackbar.show("Failed!", "Login unsuccessful, please check and try again", AppColor.warning_backgroung);
    }

  }

}
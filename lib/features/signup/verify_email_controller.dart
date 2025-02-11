import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_app/data/repository/auth_repository.dart';
import 'package:first_flutter_app/features/login/success_screen.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/custom_theme/custom_snack.dart';
import 'package:first_flutter_app/utils/custom_theme/loader.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  sendEmailVerification() async {
    try {
      CustomProgressIndicator.show();
      await AuthRepository.instance.sendEmailVerification();

      CustomProgressIndicator.hide();
      CustomSnackbar.show(
          "Sent",
          "Verification email sent successfully, check your inbox to verify",
          AppColor.success_backgroung);
    } catch (e) {
      CustomSnackbar.show(
          "Warning", "verification failed", AppColor.warning_backgroung);
    }
  }

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen());
      }
    });
  }

  chechVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen());
    }
  }
}

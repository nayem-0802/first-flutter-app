import 'package:first_flutter_app/data/repository/auth_repository.dart';
import 'package:first_flutter_app/data/repository/user_model.dart';
import 'package:first_flutter_app/data/repository/user_ripository.dart';
import 'package:first_flutter_app/features/login/login_page.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import '../../utils/custom_theme/custom_snack.dart';
import '../../utils/custom_theme/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRipository = Get.put(UserRipository());

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  Future<void> fetchUserRecord() async {
    try {
      final user = await userRipository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  void deleteUserAccount() async {
    try {
      CustomProgressIndicator.show();

      await AuthRepository.instance.deleteAccount();

      CustomProgressIndicator.hide();

      CustomSnackbar.show("Done!", "Information Updated successfully", AppColor.success_backgroung);
      Get.offAll(() => const LoginPage());
    } catch (e) {
      CustomProgressIndicator.hide();
      CustomSnackbar.show("Failed!", "Something went wrong, please try again", AppColor.warning_backgroung);
    }
  }
}

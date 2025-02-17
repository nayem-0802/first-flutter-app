import 'package:first_flutter_app/features/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnController extends GetxController {
  static OnController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPage = 0.obs;

  void updatepage(index) => currentPage.value = index;

  void dotnavigationclick(index){
    currentPage.value = index;
    pageController.jumpToPage(index);
  }

  void nextpage(){
    if(currentPage.value == 2){
      final deviceStorage = GetStorage();
      deviceStorage.write('isFirstTime', false);
      Get.offAll(() => const LoginPage());
    }else{
      int page = currentPage.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skippage(){
    currentPage.value = 2;
    pageController.jumpToPage(2);
  }

}
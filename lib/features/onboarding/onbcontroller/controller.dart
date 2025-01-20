import 'package:first_flutter_app/features/login/join_us_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
      Get.offAll(() => const JoinUsPage());
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
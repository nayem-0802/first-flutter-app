import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevUtils{
  DevUtils._();

  static double getScreenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }

  static double getStatusBarHeight(){
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double bottomNavigation(){
    return kBottomNavigationBarHeight;
  }

  static double appBarHeight(){
    return kToolbarHeight;
  }

}
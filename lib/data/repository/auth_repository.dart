import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_app/features/login/login_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../app.dart';
import '../../utils/constants/colors.dart';
import '../../utils/custom_theme/custom_snack.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;


  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async{
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => LoginPage()) : Get.offAll(() => MyApp());
  }

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(_) {
      throw "Firebase Auth Exception";
    } on FirebaseException catch(_) {
      throw "Firebase Exception";
    } on FormatException catch(_){
      throw "Format Exception";
    } on PlatformException catch (_){
      throw "Platform Exception";
    } catch (_){
      throw "Something went wrong";
    }
  }


}



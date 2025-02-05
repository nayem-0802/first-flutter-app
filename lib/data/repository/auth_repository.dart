import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_app/data/repository/user_ripository.dart';
import 'package:first_flutter_app/features/login/login_page.dart';
import 'package:first_flutter_app/features/login/varify_email.dart';
import 'package:first_flutter_app/navigation_menu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../app.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() {
    final user = _auth.currentUser;

    if (user == null) {
      deviceStorage.writeIfNull('isFirstTime', true);

      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginPage())
          : Get.offAll(() => WelcomeScreen());
    } else {
      if (user.emailVerified) {
          Get.offAll(() => const NavigationMenu());
        } else {
          Get.offAll(() => VerifyEmailScreen(
                email: _auth.currentUser?.email,
              ));
        }
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (_) {
      throw "Firebase Auth Exception";
    } on FirebaseException catch (_) {
      throw "Firebase Exception";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (_) {
      throw "Platform Exception";
    } catch (_) {
      throw "Something went wrong";
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (_) {
      throw "Firebase Auth Exception";
    } on FirebaseException catch (_) {
      throw "Firebase Exception";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (_) {
      throw "Platform Exception";
    } catch (_) {
      throw "Something went wrong";
    }
  }


  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (_) {
      throw "Firebase Auth Exception";
    } on FirebaseException catch (_) {
      throw "Firebase Exception";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (_) {
      throw "Platform Exception";
    } catch (_) {
      throw "Something went wrong";
    }
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginPage());
    } on FirebaseAuthException catch (_) {
      throw "Firebase Auth Exception";
    } on FirebaseException catch (_) {
      throw "Firebase Exception";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (_) {
      throw "Platform Exception";
    } catch (_) {
      throw "Something went wrong";
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRipository.instance.removeUserRecord(_auth.currentUser!.uid);
      await authUser?.delete();
      Get.offAll(() => LoginPage());
    } on FirebaseAuthException catch (_) {
      throw "Firebase Auth Exception";
    } on FirebaseException catch (_) {
      throw "Firebase Exception";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (_) {
      throw "Platform Exception";
    } catch (_) {
      throw "Something went wrong";
    }
  }

}


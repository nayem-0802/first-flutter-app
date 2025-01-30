
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_app/data/repository/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import '../../utils/custom_theme/custom_snack.dart';

class UserRipository extends GetxController{
  static UserRipository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async{
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    }on FirebaseAuthException catch(e){
      CustomSnackbar.show("Warning", "Something went wrong", AppColor.warning_backgroung);
    } on FirebaseException catch(e){
      CustomSnackbar.show("Warning", "Something went wrong", AppColor.warning_backgroung);
    } on FormatException catch(e){
      CustomSnackbar.show("Warning", "Something went wrong", AppColor.warning_backgroung);
    } on PlatformException catch(e){
      throw 'Something went wrong.';
    }
  }

}
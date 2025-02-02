import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_app/data/repository/auth_repository.dart';
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


  Future<UserModel> fetchUserDetails() async{
    try{
      final documentSnapshot = await _db.collection("Users").doc(AuthRepository.instance.authUser?.uid).get();

      if(documentSnapshot.exists){
        return UserModel.formSnaphot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    }on FirebaseAuthException catch(e){
      CustomSnackbar.show("Warning", "Something went wrong", AppColor.warning_backgroung);
    } on FirebaseException catch(e){
      CustomSnackbar.show("Warning", "Something went wrong", AppColor.warning_backgroung);
    } on FormatException catch(e){
      CustomSnackbar.show("Warning", "Something went wrong", AppColor.warning_backgroung);
    } on PlatformException catch(e){
      throw 'Something went wrong.';
    }
    throw 'Something went wrong.';
  }


  Future<void> updateUserDetails(UserModel updatedUser) async{
    try{
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
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

  Future<void> updateSingleFeild(Map<String, dynamic> json) async{
    try{
      final userId = await AuthRepository.instance.authUser?.uid;
      await _db.collection("Users").doc(userId).update(json);

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

  Future<void> removeUserRecord(String userId) async{
    try{
      await _db.collection("Users").doc(userId).delete();
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
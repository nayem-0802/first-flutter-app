import 'package:first_flutter_app/data/repository/user_model.dart';
import 'package:first_flutter_app/data/repository/user_ripository.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRipository = Get.put(UserRipository());

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  Future<void> fetchUserRecord() async{
    try{
      final user = await userRipository.fetchUserDetails();
      this.user(user);
    }catch (e){
      user(UserModel.empty());
    }
  }


}
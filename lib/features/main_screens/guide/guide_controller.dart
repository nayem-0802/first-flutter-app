import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:first_flutter_app/utils/custom_theme/custom_snack.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class GuideController extends GetxController {
  static GuideController get instance => Get.find();
  final FirebaseFirestore fs = FirebaseFirestore.instance;
  RxList<Map<String, dynamic>> guideList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> guideListPlace = <Map<String, dynamic>>[].obs;

  Future<void> fetchGuide() async {
    try {
      final QuerySnapshot querySnapshot =
          await fs.collection("Users").where('role', isEqualTo: 'guide').get();
      guideList.value = querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      throw "Something went wrong";
    }
  }

  Future<void> fetchGuideForPlace(String placeName) async {
    try {
      final QuerySnapshot querySnapshot =
      await fs.collection("Users").where('city', isEqualTo: placeName).get();
      guideListPlace.value = querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e){
      throw "Something went wrong";
    }
  }

  void guideCall(String? number) async{
    if(number!= null && number.isNotEmpty){
      final Uri uri = Uri(
        scheme: 'tel', path: number
      );
      if(await canLaunchUrl(uri)){
        await launchUrl(uri);
      }else{
        CustomSnackbar.show("Failed", "Cannot call, Please check and try again", AppColor.warning_backgroung);
      }
    }else{
      CustomSnackbar.show("Failed", "Phone number not found", AppColor.warning_backgroung);
    }

  }

  @override
  void onInit() {
    super.onInit();
    fetchGuide();
  }
}
import 'package:get/get.dart';

class SearchPlacesController extends GetxController {
  static SearchPlacesController get instance => Get.find();

  var allPlaces = [
    'Sundarbans', 'Sylhet', 'Rangamati','Pabna',
    'Bandarban', 'Srimangal', 'Kuakata', 'Saint Martin’s Island','Cox’s Bazar'
  ].obs;

  var filteredPlaces = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredPlaces.assignAll(allPlaces); // Show all places initially
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      filteredPlaces.assignAll(allPlaces);
    } else {
      filteredPlaces.assignAll(
        allPlaces.where((place) => place.toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
  }
}

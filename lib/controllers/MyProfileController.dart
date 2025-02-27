import 'package:get/get.dart';

class MyProfileController extends GetxController {

  //RxList<CatagoryModel> categories = <CatagoryModel>[].obs;

  RxBool isloading = false.obs;

  // get catagories
  // Future<void> getcatagories() async {
  //   isloading.value = true;
  //   try {
  //     final response = await http.get(Uri.parse(ApiConstants.getCategories));
  //     if (response.statusCode == 200) {
  //       final jsonResponse = json.decode(response.body);
  //       final List<dynamic> data = jsonResponse['data'];
  //       categories.value = data.map((e) => CatagoryModel.fromJson(e)).toList();
  //       isloading.value = false;
  //     } else {
  //       isloading.value = false;
  //       throw Exception('Failed to load categories');
  //     }
  //   } catch (e) {
  //     isloading.value = false;
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

}


import 'package:get/get.dart';

class MembershipController extends GetxController {

  RxBool isloading = true.obs;
  final List<String> chipLabels = ['approved', 'pending', 'all', 'rejected'];
  RxString selectedChip = 'Approved'.obs;

  // Future<void> getAllAds() async {
  //   try {
  //     final response = await http.post(Uri.parse(ApiConstants.getMyAds), body: {
  //       "status": selectedChip.value,
  //       "search": "event"
  //     }, headers: {
  //       'Authorization': 'Bearer ${authService.authToken}',
  //       'Content-Type': 'application/json',
  //     });
  //     if (response.statusCode == 200) {
  //       final jsonResponse = json.decode(response.body);
  //       final List<dynamic> data = jsonResponse['data'];
  //       // categories.value = data.map((e) => CatagoryModel.fromJson(e)).toList();
  //     } else {
  //       final errorData = jsonDecode(response.body);
  //       throw Exception(
  //           errorData["message"]["error"][0] ?? "An error occurred");
  //     }
  //   } catch (e) {
  //     CustomSnackbar.showError('Error', e.toString());
  //   }
  // }
}

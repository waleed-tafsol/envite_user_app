// import 'dart:convert';
// import 'package:event_planner_light/model/events_list_response.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// import '../constants/ApiConstant.dart';
// import '../model/CatagoryModel.dart';
// import '../model/event_model.dart';
// import '../utills/enums.dart';
// import 'Auth_services.dart';

// class ExploreController extends GetxController {
//   @override
//   void onInit() async {
//     super.onInit();
//     getExplorerPaginatedEvents();
//   }

//   Rx<String> exploreEventsScreenType = Events.explorerEvents.text.obs;
//   RxList<EventModel> exploreUpcomingEvents = <EventModel>[].obs;
//   RxList<EventModel> explorePastEvents = <EventModel>[].obs;
//   Rx<EventsListResponse> exploreEventModel = EventsListResponse().obs;

//   RxBool isEventLoading = false.obs;

//   Future<void> getExplorerPaginatedEvents() async {
//     isEventLoading.value = true;
//     try {
//       final response = await http.post(Uri.parse(ApiConstants.getAllEvents),
//           body: exploreEventsScreenType.value == Events.explorerEvents.text
//               ? jsonEncode({
//             "screen": 'explore-events',
//           })
//               : jsonEncode({
//             "screen": 'explore-events-view-all',
//             "status": exploreEventsScreenType.value == Events.explorerPastEvent.text
//                 ? 'past-events'
//                 : 'upcoming-events'
//           }),
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${authService.authToken}',
//           });
//       if (response.statusCode == 201) {
//         final jsonResponse = json.decode(response.body);
//         if (exploreEventsScreenType.value == Events.explorerEvents.text) {
//           exploreEventModel(EventsListResponse.fromJson(jsonResponse));
//         } else {
//           final List<dynamic> data = jsonResponse['data'];
//           if (exploreEventsScreenType.value == Events.explorerPastEvent.text) {
//             explorePastEvents.value = data.map((e) => EventModel.fromJson(e)).toList();
//           } else {
//             exploreUpcomingEvents.value =
//                 data.map((e) => EventModel.fromJson(e)).toList();
//           }
//         }

//         // final List<dynamic> data = jsonResponse['data'];
//         // upcomingEvents.value = data.map((e) => EventModel.fromJson(e)).toList();
//         isEventLoading.value = false;
//       } else {
//         isEventLoading.value = false;
//         final errorData = jsonDecode(response.body);
//         throw Exception(
//             errorData["message"]["error"][0] ?? "An error occurred");
//       }
//     } catch (e) {
//       isEventLoading.value = false;
//       Get.snackbar('Error', e.toString());
//     }
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }
// }

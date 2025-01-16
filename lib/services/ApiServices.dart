// import 'dart:convert';

// import 'package:http/http.dart' as http;


// import '../constants/strings.dart';
// import '../model/questions_model.dart';
// import '../model/user_model.dart';
// import 'storage_services.dart';

// class ApiServices {
//   Future<List<QuestionsModel>> fetchQuestions(String token) async {
//     final response = await http.post(
//       Uri.parse(ApiConstants.qanswers),
//       headers: {"Authorization": "Bearer $token"},
//       body: {"type": "2"},
//     );

//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       final List<dynamic> listOfQuestions = jsonData["data"];
//       return listOfQuestions
//           .map((question) => QuestionsModel.fromJson(question))
//           .toList();
//     } else {
//       final jsonData = json.decode(response.body);
//       throw Exception(jsonData["message"]);
//     }
//   }

//   Future<bool> register(String name, String email, String password,
//       String confirmPassword) async {
//     try {
//       final response = await http.post(Uri.parse(ApiConstants.register), body: {
//         "name": name,
//         "email": email,
//         "password": password,
//         "confirm_password": confirmPassword,
//       });

//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         final jsonData = json.decode(response.body);
//         throw Exception(jsonData["message"]);
//       }
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   Future<UserModel?> login(String email, String password) async {
//     try {
//       final response = await http.post(Uri.parse(ApiConstants.login), body: {
//         "email": email,
//         "password": password,
//       });

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         return UserModel.fromJson(jsonData["data"]);
//       } else {
//         final jsonData = json.decode(response.body);
//         throw Exception(jsonData["message"]);
//       }
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   Future<void> logout() async {
//     await StorageService().remove(Strings.auth_token);
//   }
// }

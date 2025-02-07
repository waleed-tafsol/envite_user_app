import 'package:event_planner_light/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/customPrint.dart';

class SessionStorageService {
  static const String _userSessionKey = 'user_session';

  // Save token to local storage
  Future<void> saveSession(Map<String, dynamic> user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userSessionKey, user.toString());
    ColoredPrint.green("Saved Auth Token:    ${user["token"]}");
  }

  // Retrieve token from local storage
  Future<String?> getSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_userSessionKey);
    ColoredPrint.green("Getting Auth Token:    $token");
    return token;
  }

  // Delete token from local storage
  Future<void> deleteSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userSessionKey);
    ColoredPrint.red("Deleting Auth Token:  Removed");
  }

  // Check if the token exists (for authentication status)
  Future<bool> hasSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final hasToken = prefs.containsKey(_userSessionKey);

    hasToken
        ? ColoredPrint.green("Getting Auth Token:    True")
        : ColoredPrint.red("Getting Auth Token:    False");
    return hasToken;
  }
}

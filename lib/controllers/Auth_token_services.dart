import 'package:shared_preferences/shared_preferences.dart';

import '../services/customPrint.dart';

class TokenService {
  static const String _authTokenKey = 'auth_token';

  // Save token to local storage
  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authTokenKey, token);
    ColoredPrint.green("Saved Auth Token:    $token");
  }

  // Retrieve token from local storage
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_authTokenKey);
    ColoredPrint.green("Getting Auth Token:    $token");
    return token;
  }

  // Delete token from local storage
  Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authTokenKey);
    ColoredPrint.red("Deleting Auth Token:  Removed");
  }

  // Check if the token exists (for authentication status)
  Future<bool> hasToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final hasToken = prefs.containsKey(_authTokenKey);

    hasToken
        ? ColoredPrint.green("Getting Auth Token:    True")
        : ColoredPrint.red("Getting Auth Token:    False");
    return hasToken;
  }
}

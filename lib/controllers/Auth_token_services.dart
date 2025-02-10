import 'package:shared_preferences/shared_preferences.dart';
import '../services/customPrint.dart';

class SessionStorageService {
  static const String _userTokenKey = 'auth_token';

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userTokenKey, token.toString());
    // ColoredPrint.green("Saved Auth Token:    ${user["token"]}");
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_userTokenKey);
    ColoredPrint.green("Getting Auth Token:    $token");
    return token;
  }

  // Delete token from local storage
  Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userTokenKey);
    ColoredPrint.red("Deleting Auth Token:  Removed");
  }

  Future<bool> hasToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final hasToken = prefs.containsKey(_userTokenKey);

    hasToken
        ? ColoredPrint.green("Getting Auth Token:    True")
        : ColoredPrint.red("Getting Auth Token:    False");
    return hasToken;
  }
}

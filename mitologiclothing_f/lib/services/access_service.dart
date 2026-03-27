import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_access_model.dart';

class AccessService {
  static const String _userKey = 'logged_user_access';

  static Future<void> saveUser(UserAccessModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  static Future<UserAccessModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_userKey);

    if (raw == null || raw.isEmpty) return null;

    final Map<String, dynamic> json = jsonDecode(raw);
    return UserAccessModel.fromJson(json);
  }

  static Future<bool> isLoggedIn() async {
    final user = await getUser();
    return user != null &&
        user.name.trim().isNotEmpty &&
        user.phone.trim().isNotEmpty;
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
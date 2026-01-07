import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  static const String usersKey = 'APP_USERS_LIST';
  static const String currentUserKey = 'APP_CURRENT_USER';

  /// reactive current user (null when logged out)
  final Rxn<Map<String, dynamic>> currentUser = Rxn<Map<String, dynamic>>();

  bool get isAuthenticated => currentUser.value != null;

  /// Call this once on app start (before middleware checks)
  Future<AuthService> init() async {
    await loadSession();
    return this;
  }

  Future<void> loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(currentUserKey);

    if (raw == null || raw.isEmpty) {
      currentUser.value = null;
      return;
    }

    currentUser.value = Map<String, dynamic>.from(jsonDecode(raw));
  }

  Future<void> setSessionUser(Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(currentUserKey, jsonEncode(user));
    currentUser.value = user;
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(currentUserKey);
    currentUser.value = null;
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(usersKey);
    if (raw == null || raw.isEmpty) return [];

    final decoded = jsonDecode(raw);
    if (decoded is! List) return [];

    return decoded
        .whereType<Map>()
        .map((m) => Map<String, dynamic>.from(m))
        .toList();
  }

  Future<void> saveUsers(List<Map<String, dynamic>> users) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(usersKey, jsonEncode(users));
  }
}

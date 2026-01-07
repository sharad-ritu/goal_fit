import 'package:get/get.dart';
import 'package:goal_fit/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _auth = Get.find<AuthService>();

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final n = name.trim();
    final e = email.trim().toLowerCase();
    final p = password;

    if (n.isEmpty || e.isEmpty || p.isEmpty) return false;
    if (!_isValidEmail(e)) return false;

    final users = await _auth.getUsers();

    final exists = users.any(
      (u) => (u['email'] ?? '').toString().trim().toLowerCase() == e,
    );

    if (exists) return false;

    users.add({
      'name': n,
      'email': e,
      'password': p, // basic plain text
    });

    await _auth.saveUsers(users);
    return true;
  }

  Future<bool> signIn({required String email, required String password}) async {
    final e = email.trim().toLowerCase();
    final p = password;

    if (_isValidEmail(e) == false) return false;

    final users = await _auth.getUsers();

    final match = users.firstWhereOrNull((u) {
      final storedEmail = (u['email'] ?? '').toString().trim().toLowerCase();
      final storedPass = (u['password'] ?? '').toString();
      return storedEmail == e && storedPass == p;
    });

    if (match == null) return false;

    final sessionUser = {
      'name': (match['name'] ?? '').toString(),
      'email': (match['email'] ?? '').toString(),
    };

    await _auth.setSessionUser(sessionUser);
    return true;
  }

  Future<void> signOut() async {
    await _auth.clearSession();
  }

  bool _isValidEmail(String email) =>
      RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);
}

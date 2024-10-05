
import 'package:shared_preferences/shared_preferences.dart';

class RoleStorage {
  // Save role to SharedPreferences
  Future<void> saveRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
  }

  // Retrieve role from SharedPreferences
  Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }

  // Remove role from SharedPreferences
  Future<void> removeRole() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('role');
  }
}
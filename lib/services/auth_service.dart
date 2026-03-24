import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  /// 🔵 Your deployed backend URL
  static const String baseUrl =
      "https://banasthali-buddy-backend.onrender.com";

  // ======================
  // SIGNUP
  // ======================
  Future<bool> signup(String name, String email, String password) async {

    final response = await http.post(
      Uri.parse("$baseUrl/api/auth/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": name,
        "email": email,
        "password": password,
        "role": "STUDENT"
      }),
    );

    print("SIGNUP STATUS: ${response.statusCode}");
    print("SIGNUP RESPONSE: ${response.body}");

    return response.statusCode == 200 || response.statusCode == 201;
  }

  // ======================
  // LOGIN
  // ======================
  Future<bool> login(String email, String password) async {

    final response = await http.post(
      Uri.parse("$baseUrl/api/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    print("LOGIN STATUS: ${response.statusCode}");
    print("LOGIN BODY: ${response.body}");

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString("token", data["token"]);

      print("TOKEN SAVED: ${data["token"]}");

      return true;
    }

    return false;
  }

  // ======================
  // CHECK LOGIN
  // ======================
  Future<bool> isUserLoggedIn() async {

    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token");

    return token != null && token.isNotEmpty;
  }

  // ======================
  // LOGOUT
  // ======================
  Future<void> logout() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }
}
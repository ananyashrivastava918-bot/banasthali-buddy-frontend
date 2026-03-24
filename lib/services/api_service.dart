import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static const String baseUrl = "https://banasthali-buddy.onrender.com";

  // ================= SERVER PING (NEW) =================
  Future<void> pingServer() async {
    try {
      await http
          .get(Uri.parse(baseUrl))
          .timeout(const Duration(seconds: 10));

      print("SERVER WARMED UP");
    } catch (e) {
      print("PING ERROR: $e");
    }
  }

  // ================= SIGNUP =================
  Future<bool> signup(
      String name,
      String email,
      String password,
      String role,
      ) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/api/auth/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": name.trim(),
          "email": email.trim(),
          "password": password.trim(),
          "role": role.toLowerCase(),
        }),
      ).timeout(const Duration(seconds: 20)); // ✅ reduced timeout

      print("SIGNUP STATUS: ${response.statusCode}");
      print("SIGNUP BODY: ${response.body}");

      return response.statusCode == 200 || response.statusCode == 201;

    } catch (e) {
      print("SIGNUP ERROR: $e");
      return false;
    }
  }

  // ================= LOGIN =================
  Future<Map<String, dynamic>> login(
      String email,
      String password,
      ) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/api/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email.trim(),
          "password": password.trim(),
        }),
      ).timeout(const Duration(seconds: 30)); // ✅ reduced timeout

      print("LOGIN STATUS: ${response.statusCode}");
      print("LOGIN BODY: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        /// ROLE EXTRACTION
        String role = "student";

        if (data["role"] != null) {
          role = data["role"];
        } else if (data["user"] != null &&
            data["user"]["role"] != null) {
          role = data["user"]["role"];
        }

        print("DETECTED ROLE: $role");

        return {
          "success": true,
          "role": role.toLowerCase(),
          "token": data["token"],
        };

      } else {
        return {
          "success": false,
          "message": "Invalid credentials",
        };
      }

    } catch (e) {
      print("LOGIN ERROR: $e");

      // ✅ Proper error handling
      if (e.toString().contains("TimeoutException")) {
        return {
          "success": false,
          "message": "Slow Server, please try again",
        };
      }

      return {
        "success": false,
        "message": "Something went wrong",
      };
    }
  }
}
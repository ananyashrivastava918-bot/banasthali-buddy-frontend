import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AdminApiService {

  static const String baseUrl =
      "https://banasthali-buddy.onrender.com/api/admin";

  /// ================= GET TOKEN =================
  static Future<String?> getToken() async {

    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    print("ADMIN TOKEN: $token");

    return token;
  }


  /// ================= DASHBOARD =================
  static Future<Map<String, dynamic>> getDashboardStats() async {

    final token = await getToken();

    final response = await http.get(
      Uri.parse("$baseUrl/dashboard"),
      headers: {
        "Authorization": "Bearer $token"
      },
    );

    print("DASHBOARD STATUS: ${response.statusCode}");
    print("DASHBOARD BODY: ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {};
    }
  }


  /// ================= USERS LIST =================
  static Future<List<dynamic>> getUsers() async {

    final token = await getToken();

    final response = await http.get(
      Uri.parse("$baseUrl/users"),
      headers: {
        "Authorization": "Bearer $token"
      },
    );

    return jsonDecode(response.body);
  }


  /// ================= DELETE USER =================
  static Future deleteUser(String id) async {

    final token = await getToken();

    await http.delete(
      Uri.parse("$baseUrl/users/$id"),
      headers: {
        "Authorization": "Bearer $token"
      },
    );
  }


  /// ================= ROUTES LIST =================
  static Future<List<dynamic>> getRoutes() async {

    final token = await getToken();

    final response = await http.get(
      Uri.parse("$baseUrl/routes"),
      headers: {
        "Authorization": "Bearer $token"
      },
    );

    return jsonDecode(response.body);
  }


  /// ================= DELETE ROUTE =================
  static Future deleteRoute(String id) async {

    final token = await getToken();

    await http.delete(
      Uri.parse("$baseUrl/routes/$id"),
      headers: {
        "Authorization": "Bearer $token"
      },
    );
  }
}
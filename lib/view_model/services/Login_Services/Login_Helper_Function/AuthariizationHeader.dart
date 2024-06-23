import 'dart:convert';
import 'package:http/http.dart' as http;
import 'LoginAuthServices.dart';

class ApiHelper {
  final AuthService authService = AuthService();

  Future<Map<String, String>> getHeaders() async {
    final String? token = await authService.getToken();

    if (token == null) {
      throw Exception('Token not found');
    }

    return {
      'Content-Type': 'application/json',
      'Authorization': '$token',
    };
  }

  static const String baseUrl = 'https://attendancesystem-s1.onrender.com/api/';

  static Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    final Uri uri = Uri.parse(baseUrl + endpoint);
    return await http.get(uri, headers: headers);
  }

  static Future<http.Response> post(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    final Uri uri = Uri.parse(baseUrl + endpoint);
    return await http.post(uri, headers: headers, body: body);
  }
}

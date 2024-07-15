import 'dart:convert';
import 'package:attendence/view_model/services/Login_Services/Login_Helper_Function/Login_Storage_Helper.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../../models/for_Login/LoginModel.dart';

class AuthService {
  final GetStorage storage = GetStorage();
  final String baseUrl = 'https://attendancesystem-s1.onrender.com';

  Future<UserModel?> login(String username, String password) async {
    final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

    final response = await http.get(
      Uri.parse('$baseUrl/user'),
      headers: {'Authorization': basicAuth},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("API Response: $data");
      final int userId = data['id'];
      final String userName = data['name'];

      // Store id and name using LoginStorageHelper
      LoginStorageHelper.storeData(userId, userName);

      print(userId);
      print(userName);
      // Print all headers
      response.headers.forEach((key, value) {
        print('$key: $value');
      });

      // Extract the token from the headers
      final token = response.headers['authorization']?.replaceFirst('Bearer ', '');
      print("Extracted token from headers: $token");

      if (token != null && token.split('.').length == 3) {
        try {
          // Decode the header and payload without verifying the token
          final parts = token.split('.');
          final header = jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(parts[0]))));
          final payload = jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
          print("Decoded Token Header: $header");
          print("Decoded Token Payload: $payload");

          // Convert the decoded payload to UserModel
          final userModel = UserModel.fromJson(payload);

          await storage.write('token', token);
          await storage.write('userModel', userModel.toJson()); // store UserModel as JSON

          return userModel;
        } catch (e) {
          print('JWT decoding failed: $e');
          throw Exception('Invalid token');
        }
      } else {
        throw Exception('Token not found in API response or invalid format');
      }
    } else {
      throw Exception('Failed to login');
    }
  }
  bool isLoggedIn()  {
    String? token = storage.read('token');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }
  String? getToken() {
    return storage.read('token');
  }

  UserModel? getUserModel() {
    final json = storage.read('userModel');
    print("Stored UserModel JSON: $json");

    if (json != null) {
      return UserModel.fromJson(json);
    }
    return null;
  }
  Future<void> logout() async {
    await storage.erase();
  }
}

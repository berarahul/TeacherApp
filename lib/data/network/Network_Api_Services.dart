import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';
import 'Base_Api_Services.dart';
class NetworkApiServices extends Base_Api_Services {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    if (kDebugMode) {
      print(url);
    }
    try {
      final response =
      await http.get(Uri.parse(url)).timeout(const Duration(seconds: 500));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOutException('');
    }
    return jsonResponse;
  }
   Future<dynamic> postApi(var data, String url) async {
    dynamic jsonResponse;
    if (kDebugMode) {
      print('URL: $url');
      print('Data: $data');
    }
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      ).timeout(const Duration(seconds: 10));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetException('No Internet connection');
    } on TimeoutException {
      throw RequestTimeOutException('Request timed out');
    }
    return jsonResponse;
  }
 dynamic returnResponse(http.Response response){
   switch(response.statusCode){

     case 200:
       dynamic jsonResponse=jsonDecode(response.body);
       return jsonResponse;
     case 201:
       dynamic jsonResponse=jsonDecode(response.body);
       return jsonResponse;

     case 400:
       throw InvalidUrlException('');
       default:
         throw FetchDataException('Error occurred while Communicating with the server '+response.statusCode.toString());
   }
  }

}

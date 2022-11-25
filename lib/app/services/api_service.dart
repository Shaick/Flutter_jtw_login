import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/register_request.dart';
import '../models/register_response.dart';
import 'shared_service.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(
    LoginRequest model,
  ) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(
      Config.apiURL,
      Config.loginAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));

      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponse> register(
    RegisterRequest model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.registerAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseJson(
      response.body,
    );
  }

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      //'Accept': '*/*',
      'Authorization': 'Bearer ${loginDetails!.data.token}'
    };
    //debugPrint(loginDetails.data.token);
    var url = Uri.http(Config.apiURL, Config.userProfileAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "statusCode = ${response.statusCode}";
    }
  }
}

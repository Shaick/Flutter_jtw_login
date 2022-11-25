import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../models/login_response.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");
    return isKeyExist;
  }

  static Future<LoginResponse?> loginDetails() async {
    var isCacheKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");

    LoginResponse? response;

    if (isCacheKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_details");

      response = loginResponseJson(cacheData.syncData);
    }
    return response;
  }

  static Future<void> setLoginDetails(
    LoginResponse loginResponse,
  ) async {
    APICacheDBModel cacheModel = APICacheDBModel(
      key: "login_details",
      syncData: jsonEncode(loginResponse.toJson()),
    );

    await APICacheManager().addCacheData(cacheModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache("login_details");
    Get.offAllNamed('/login');
  }
}

import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/secure_storage_helper.dart';

import '../../../../app_constants.dart';

abstract class SecureToken {
  static SecureStorageHelper secureStorageHelper = SecureStorageHelper();
  static Future<void> addToken(String token) async {
    await secureStorageHelper.writeValue(AppConstants.kToken, token);
    debugPrint("added $token");
  }

  static Future<String?> getToken() async {
    return await secureStorageHelper.readValue(AppConstants.kToken);
  }

  static Future<void> deleteToken() async {
    await secureStorageHelper.deleteValue(AppConstants.kToken);
  }
}

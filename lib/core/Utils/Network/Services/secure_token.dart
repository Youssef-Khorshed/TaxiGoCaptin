import 'package:taxi_go_driver/core/Utils/Network/Services/secure_storage_helper.dart';

import '../../../../app_constants.dart';

abstract class SecureToken {
 static SecureStorageHelper secureStorageHelper = SecureStorageHelper();
static  addToken(String token) async {
    await secureStorageHelper.writeValue(AppConstants.kToken, token);
    print("added $token");
  }

 static Future<String?> getToken() async {
 return   await secureStorageHelper.readValue(AppConstants.kToken);
  }

static   deleteToken() async {
    await secureStorageHelper.deleteValue(AppConstants.kToken);

  }
}

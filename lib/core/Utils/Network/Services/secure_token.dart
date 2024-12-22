import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/secure_storage_helper.dart';

abstract class SecureToken {
  static SecureStorageHelper secureStorageHelper = SecureStorageHelper();
  static addToken(String token) async {
    await secureStorageHelper.writeValue(Constants.kToken, token);
  }

  static Future<String?> getToken() async {
    return await secureStorageHelper.readValue(Constants.kToken);
  }

  static deleteToken() async {
    await secureStorageHelper.deleteValue(Constants.kToken);
  }
}

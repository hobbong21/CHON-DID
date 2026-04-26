import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:base_flutter/core/di.dart';
import 'package:base_flutter/core/storage/app_shared_preferences.dart';

final class AppSecureStorageKeys {
  AppSecureStorageKeys._();

  static const String encToken = 'encToken';
}

class AppSecureStorage {
  static Future<FlutterSecureStorage> precheckStorage(
      FlutterSecureStorage storage) async {
    final hasRunBefore = AppSP.get(AppSP.hasRunBefore) ?? false;

    if (hasRunBefore == false) {
      await storage.deleteAll();
      AppSP.set(AppSP.hasRunBefore, true);
    }

    return storage;
  }

  static Future<FlutterSecureStorage> init() async {
    const iosOptions = IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    );
    const androidOptions = AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm:
          KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
    );

    const storage = FlutterSecureStorage(
      iOptions: iosOptions,
      aOptions: androidOptions,
    );

    return precheckStorage(storage);
  }

  static Future setEncToken(String? token) async {
    final storage = Di.getIt.get<FlutterSecureStorage>();

    await storage.write(key: AppSecureStorageKeys.encToken, value: token);
  }

  static Future<String?> getEncToken() async {
    final storage = Di.getIt.get<FlutterSecureStorage>();
    final rawEncToken = await storage.read(key: AppSecureStorageKeys.encToken);

    return rawEncToken;
  }
}

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:base_flutter/core/storage/app_secure_storage.dart';

class Di {
  static final getIt = GetIt.instance;
  static final Di _singleton = Di._internal();

  factory Di() {
    return _singleton;
  }

  Di._internal();

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    getIt.registerSingleton(prefs);

    final secureStorage = await AppSecureStorage.init();
    getIt.registerSingleton(secureStorage);
  }
}

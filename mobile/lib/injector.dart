import 'dart:io';

import 'package:base_flutter/domain/repositories/bank_repo.dart';
import 'package:base_flutter/domain/repositories/category_repo.dart';
import 'package:base_flutter/domain/repositories/chatbot_repo.dart';
import 'package:base_flutter/domain/repositories/clan_repo.dart';
import 'package:base_flutter/domain/repositories/event_repo.dart';
import 'package:base_flutter/domain/repositories/ocr_repo.dart';
import 'package:base_flutter/domain/repositories/relation_repo.dart';
import 'package:base_flutter/domain/repositories/report_repo.dart';
import 'package:base_flutter/domain/repositories/self_id_repo.dart';
import 'package:base_flutter/domain/repositories/share_repo.dart';
import 'package:base_flutter/domain/repositories/taekwondo_repo.dart';
import 'package:base_flutter/domain/repositories/verify_repo.dart';
import 'package:base_flutter/flavors.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'app/app_cubit.dart';
import 'core/di.dart';
import 'data/data_source/remote/dio.dart';
import 'domain/repositories/auth_repo.dart';

final class Injector {
  static final getIt = Di.getIt;

  static Future<void> init() async {
    await Di().init();

    final deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      getIt.registerSingleton<AndroidDeviceInfo>(androidDeviceInfo);
    }

    if (Platform.isIOS) {
      final iOSDeviceInfo = await deviceInfoPlugin.iosInfo;
      getIt.registerSingleton<IosDeviceInfo>(iOSDeviceInfo);
    }

    DioInjection.init();

    initRepo();
    initCubit();
  }

  static void initRepo() {
    getIt.registerSingleton<AuthRepo>(AuthRepo(getIt()));
    getIt.registerSingleton<BankRepo>(BankRepo(getIt()));
    getIt.registerSingleton<CategoryRepo>(CategoryRepo(getIt()));
    getIt.registerSingleton<ClanRepo>(ClanRepo(getIt()));
    getIt.registerSingleton<EventRepo>(EventRepo(getIt()));
    getIt.registerSingleton<SelfIdRepo>(SelfIdRepo(getIt()));
    getIt.registerSingleton<ShareRepo>(ShareRepo(getIt()));
    getIt.registerSingleton<TaekwondoRepo>(TaekwondoRepo(getIt()));
    getIt.registerSingleton<VerifyRepo>(VerifyRepo(getIt()));
    getIt.registerSingleton<RelationRepo>(RelationRepo(getIt()));
    getIt.registerSingleton<ReportRepo>(ReportRepo(getIt()));

    getIt.registerSingleton<ChatbotRepo>(
        ChatbotRepo(getIt(), baseUrl: F.openaiUrl));
    getIt.registerSingleton<OcrRepo>(OcrRepo(getIt(), baseUrl: F.ocrUrl));
  }

  static void initCubit() {
    getIt.registerSingleton<AppCubit>(AppCubit());
  }
}

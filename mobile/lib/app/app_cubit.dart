import 'dart:convert';

import 'package:base_flutter/router/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base_flutter/core/storage/app_shared_preferences.dart';
import 'package:base_flutter/core/theme/app_colors.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:base_flutter/core/utils/utils.dart';
import 'package:base_flutter/data/models/auth/login_model.dart';
import 'package:base_flutter/generated/assets.gen.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

const kLoginModel = 'kLoginModel';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  bool needRefreshHome = false;

  void init(BuildContext context) async {
    getLanguage();
    initThemeMode();
    initLoginModel();
  }

  Future setRedirectPath(String path) async {
    emit(state.copyWith(redirectPath: path));
  }

  void getLanguage() {
    var languageLocal = AppSP.get(AppSP.languageLocale);
    if (!Utils.isNullOrEmpty(languageLocal)) {
      emit(state.copyWith(locale: languageLocal));
      onChangeLanguage(LanguageSetting.values.byName(languageLocal));
    } else {
      onChangeLanguage();
    }
  }

  void initThemeMode() {
    var themeMode = AppSP.get(AppSP.themeMode);
    if (themeMode == null) {
      changeThemeMode(ThemeMode.light);
    } else {
      changeThemeMode(ThemeMode.values.byName(themeMode));
    }
  }

  void initTheme() {
    emit(state.copyWith(themes: AppThemes()));
  }

  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
    AppSP.set(AppSP.themeMode, themeMode.name);
  }

  // Change Language
  Future<void> onChangeLanguage([LanguageSetting? lang]) async {
    await AppSP.remove(AppSP.languageLocale);
    if (lang == null) {
      try {
        final locale = WidgetsBinding.instance.platformDispatcher.locale;
        lang = LanguageSetting.values.byName(locale.languageCode);
      } catch (e) {
        lang = LanguageSetting.ko;
      }
    } else {
      await AppSP.set(AppSP.languageLocale, lang.name);
    }
    await S.load(Locale(
      state.locale.split('_')[0],
      state.locale.split('_').elementAtOrNull(1),
    ));
    emit(state.copyWith(locale: lang.name));
  }

  AppColors colors(BuildContext context) =>
      state.themes?.currentColor(context) ?? AppColors.light();

  Future<LoginModel?> getStorageLoginModel() async {
    try {
      final storage = Injector.getIt.get<FlutterSecureStorage>();
      final rawToken = await storage.read(key: kLoginModel);
      if (Utils.isNullOrEmpty(rawToken)) {
        return null;
      }
      return LoginModel.fromJson(jsonDecode(rawToken!));
    } catch (e) {
      debugPrint('getStorageLoginModel error');
    }
    return null;
  }

  Future setLoginModel(LoginModel loginModel) async {
    try {
      final storage = Injector.getIt.get<FlutterSecureStorage>();
      await storage.write(
          key: kLoginModel, value: jsonEncode(loginModel.toJson()));
      emit(state.copyWith(loginModel: loginModel));
    } catch (e) {
      debugPrint('setLoginModel error');
    }
  }

  initLoginModel() async {
    final loginModel = await getStorageLoginModel();
    if (loginModel != null) {
      setLoginModel(loginModel);
    }
  }

  void logout({bool clearAuth = false}) async {
    try {
      if (clearAuth) {
        final storage = Injector.getIt.get<FlutterSecureStorage>();
        await storage.delete(key: kLoginModel);
      }
      emit(state.copyWith(loginModel: null));
      AppNavigator.go(Routes.home);
      AppNavigator.push(Routes.guardPage);
    } catch (e) {
      debugPrint('logout error');
    }
  }
}

extension AppColorsExtension on BuildContext {
  AppColors get colors => Injector.getIt<AppCubit>().colors(this);
}

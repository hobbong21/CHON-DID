part of 'app_cubit.dart';

@freezed
sealed class AppState with _$AppState {
  factory AppState({
    @Default('en') String locale,
    @Default(ThemeMode.system) ThemeMode themeMode,
    LoginModel? loginModel,
    @Default('') String redirectPath,
    BaseThemes? themes,
  }) = _AppState;
}

enum LanguageSetting {
  en,
  ko,
  vi,
  ja,
  zh_CN,
  zh_TW,
  ;
}

extension LanguageExt on LanguageSetting {
  String getTitle() {
    switch (this) {
      case LanguageSetting.vi:
        return 'Tiếng Việt';
      case LanguageSetting.en:
        return 'English';
      case LanguageSetting.ko:
        return '한국어';
      case LanguageSetting.ja:
        return '日本語';
      case LanguageSetting.zh_CN:
        return '中文（简体)';
      case LanguageSetting.zh_TW:
        return '中文（繁體)';
    }
  }

  String get phoneCode {
    switch (this) {
      case LanguageSetting.vi:
        return '+84'; // Việt Nam
      case LanguageSetting.en:
        return '+1'; // Mỹ (giả định)
      case LanguageSetting.ko:
        return '+82'; // Hàn Quốc
      case LanguageSetting.ja:
        return '+81'; // Nhật Bản
      case LanguageSetting.zh_CN:
        return '+86'; // Trung Quốc
      case LanguageSetting.zh_TW:
        return '+886'; // Đài Loan
    }
  }
}

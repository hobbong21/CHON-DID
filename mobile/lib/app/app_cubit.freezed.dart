// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppState {
  String get locale;
  ThemeMode get themeMode;
  LoginModel? get loginModel;
  String get redirectPath;
  BaseThemes? get themes;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppStateCopyWith<AppState> get copyWith =>
      _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppState &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.loginModel, loginModel) ||
                other.loginModel == loginModel) &&
            (identical(other.redirectPath, redirectPath) ||
                other.redirectPath == redirectPath) &&
            (identical(other.themes, themes) || other.themes == themes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, locale, themeMode, loginModel, redirectPath, themes);

  @override
  String toString() {
    return 'AppState(locale: $locale, themeMode: $themeMode, loginModel: $loginModel, redirectPath: $redirectPath, themes: $themes)';
  }
}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) =
      _$AppStateCopyWithImpl;
  @useResult
  $Res call(
      {String locale,
      ThemeMode themeMode,
      LoginModel? loginModel,
      String redirectPath,
      BaseThemes? themes});

  $LoginModelCopyWith<$Res>? get loginModel;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? themeMode = null,
    Object? loginModel = freezed,
    Object? redirectPath = null,
    Object? themes = freezed,
  }) {
    return _then(_self.copyWith(
      locale: null == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      loginModel: freezed == loginModel
          ? _self.loginModel
          : loginModel // ignore: cast_nullable_to_non_nullable
              as LoginModel?,
      redirectPath: null == redirectPath
          ? _self.redirectPath
          : redirectPath // ignore: cast_nullable_to_non_nullable
              as String,
      themes: freezed == themes
          ? _self.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as BaseThemes?,
    ));
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginModelCopyWith<$Res>? get loginModel {
    if (_self.loginModel == null) {
      return null;
    }

    return $LoginModelCopyWith<$Res>(_self.loginModel!, (value) {
      return _then(_self.copyWith(loginModel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppState():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String locale, ThemeMode themeMode, LoginModel? loginModel,
            String redirectPath, BaseThemes? themes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppState() when $default != null:
        return $default(_that.locale, _that.themeMode, _that.loginModel,
            _that.redirectPath, _that.themes);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String locale, ThemeMode themeMode, LoginModel? loginModel,
            String redirectPath, BaseThemes? themes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppState():
        return $default(_that.locale, _that.themeMode, _that.loginModel,
            _that.redirectPath, _that.themes);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String locale, ThemeMode themeMode,
            LoginModel? loginModel, String redirectPath, BaseThemes? themes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppState() when $default != null:
        return $default(_that.locale, _that.themeMode, _that.loginModel,
            _that.redirectPath, _that.themes);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AppState implements AppState {
  _AppState(
      {this.locale = 'en',
      this.themeMode = ThemeMode.system,
      this.loginModel,
      this.redirectPath = '',
      this.themes});

  @override
  @JsonKey()
  final String locale;
  @override
  @JsonKey()
  final ThemeMode themeMode;
  @override
  final LoginModel? loginModel;
  @override
  @JsonKey()
  final String redirectPath;
  @override
  final BaseThemes? themes;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppState &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.loginModel, loginModel) ||
                other.loginModel == loginModel) &&
            (identical(other.redirectPath, redirectPath) ||
                other.redirectPath == redirectPath) &&
            (identical(other.themes, themes) || other.themes == themes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, locale, themeMode, loginModel, redirectPath, themes);

  @override
  String toString() {
    return 'AppState(locale: $locale, themeMode: $themeMode, loginModel: $loginModel, redirectPath: $redirectPath, themes: $themes)';
  }
}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) =
      __$AppStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String locale,
      ThemeMode themeMode,
      LoginModel? loginModel,
      String redirectPath,
      BaseThemes? themes});

  @override
  $LoginModelCopyWith<$Res>? get loginModel;
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locale = null,
    Object? themeMode = null,
    Object? loginModel = freezed,
    Object? redirectPath = null,
    Object? themes = freezed,
  }) {
    return _then(_AppState(
      locale: null == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      loginModel: freezed == loginModel
          ? _self.loginModel
          : loginModel // ignore: cast_nullable_to_non_nullable
              as LoginModel?,
      redirectPath: null == redirectPath
          ? _self.redirectPath
          : redirectPath // ignore: cast_nullable_to_non_nullable
              as String,
      themes: freezed == themes
          ? _self.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as BaseThemes?,
    ));
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginModelCopyWith<$Res>? get loginModel {
    if (_self.loginModel == null) {
      return null;
    }

    return $LoginModelCopyWith<$Res>(_self.loginModel!, (value) {
      return _then(_self.copyWith(loginModel: value));
    });
  }
}

// dart format on

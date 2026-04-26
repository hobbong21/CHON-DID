// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scan_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrScanState {
  bool get isLoading;
  String get messageError;
  dynamic get showData;
  String get data;

  /// Create a copy of QrScanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QrScanStateCopyWith<QrScanState> get copyWith =>
      _$QrScanStateCopyWithImpl<QrScanState>(this as QrScanState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QrScanState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            const DeepCollectionEquality().equals(other.showData, showData) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, messageError,
      const DeepCollectionEquality().hash(showData), data);

  @override
  String toString() {
    return 'QrScanState(isLoading: $isLoading, messageError: $messageError, showData: $showData, data: $data)';
  }
}

/// @nodoc
abstract mixin class $QrScanStateCopyWith<$Res> {
  factory $QrScanStateCopyWith(
          QrScanState value, $Res Function(QrScanState) _then) =
      _$QrScanStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading, String messageError, dynamic showData, String data});
}

/// @nodoc
class _$QrScanStateCopyWithImpl<$Res> implements $QrScanStateCopyWith<$Res> {
  _$QrScanStateCopyWithImpl(this._self, this._then);

  final QrScanState _self;
  final $Res Function(QrScanState) _then;

  /// Create a copy of QrScanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? messageError = null,
    Object? showData = freezed,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      messageError: null == messageError
          ? _self.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String,
      showData: freezed == showData
          ? _self.showData
          : showData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [QrScanState].
extension QrScanStatePatterns on QrScanState {
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
    TResult Function(_QrScanState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QrScanState() when $default != null:
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
    TResult Function(_QrScanState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QrScanState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(_QrScanState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QrScanState() when $default != null:
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
    TResult Function(
            bool isLoading, String messageError, dynamic showData, String data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QrScanState() when $default != null:
        return $default(
            _that.isLoading, _that.messageError, _that.showData, _that.data);
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
    TResult Function(
            bool isLoading, String messageError, dynamic showData, String data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QrScanState():
        return $default(
            _that.isLoading, _that.messageError, _that.showData, _that.data);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(
            bool isLoading, String messageError, dynamic showData, String data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QrScanState() when $default != null:
        return $default(
            _that.isLoading, _that.messageError, _that.showData, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QrScanState implements QrScanState {
  _QrScanState(
      {this.isLoading = false,
      this.messageError = '',
      this.showData = false,
      this.data = ''});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String messageError;
  @override
  @JsonKey()
  final dynamic showData;
  @override
  @JsonKey()
  final String data;

  /// Create a copy of QrScanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QrScanStateCopyWith<_QrScanState> get copyWith =>
      __$QrScanStateCopyWithImpl<_QrScanState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QrScanState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            const DeepCollectionEquality().equals(other.showData, showData) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, messageError,
      const DeepCollectionEquality().hash(showData), data);

  @override
  String toString() {
    return 'QrScanState(isLoading: $isLoading, messageError: $messageError, showData: $showData, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$QrScanStateCopyWith<$Res>
    implements $QrScanStateCopyWith<$Res> {
  factory _$QrScanStateCopyWith(
          _QrScanState value, $Res Function(_QrScanState) _then) =
      __$QrScanStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading, String messageError, dynamic showData, String data});
}

/// @nodoc
class __$QrScanStateCopyWithImpl<$Res> implements _$QrScanStateCopyWith<$Res> {
  __$QrScanStateCopyWithImpl(this._self, this._then);

  final _QrScanState _self;
  final $Res Function(_QrScanState) _then;

  /// Create a copy of QrScanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? messageError = null,
    Object? showData = freezed,
    Object? data = null,
  }) {
    return _then(_QrScanState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      messageError: null == messageError
          ? _self.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String,
      showData: freezed == showData
          ? _self.showData
          : showData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

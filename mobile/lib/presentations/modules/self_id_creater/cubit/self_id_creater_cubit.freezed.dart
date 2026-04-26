// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'self_id_creater_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SelfIdCreaterState {
  bool get isLoading;
  String get errorMessage;
  File? get selectedFile;
  int get resetKey;
  int? get createdCardId;

  /// Create a copy of SelfIdCreaterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelfIdCreaterStateCopyWith<SelfIdCreaterState> get copyWith =>
      _$SelfIdCreaterStateCopyWithImpl<SelfIdCreaterState>(
          this as SelfIdCreaterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelfIdCreaterState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.selectedFile, selectedFile) ||
                other.selectedFile == selectedFile) &&
            (identical(other.resetKey, resetKey) ||
                other.resetKey == resetKey) &&
            (identical(other.createdCardId, createdCardId) ||
                other.createdCardId == createdCardId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage,
      selectedFile, resetKey, createdCardId);

  @override
  String toString() {
    return 'SelfIdCreaterState(isLoading: $isLoading, errorMessage: $errorMessage, selectedFile: $selectedFile, resetKey: $resetKey, createdCardId: $createdCardId)';
  }
}

/// @nodoc
abstract mixin class $SelfIdCreaterStateCopyWith<$Res> {
  factory $SelfIdCreaterStateCopyWith(
          SelfIdCreaterState value, $Res Function(SelfIdCreaterState) _then) =
      _$SelfIdCreaterStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      File? selectedFile,
      int resetKey,
      int? createdCardId});
}

/// @nodoc
class _$SelfIdCreaterStateCopyWithImpl<$Res>
    implements $SelfIdCreaterStateCopyWith<$Res> {
  _$SelfIdCreaterStateCopyWithImpl(this._self, this._then);

  final SelfIdCreaterState _self;
  final $Res Function(SelfIdCreaterState) _then;

  /// Create a copy of SelfIdCreaterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? selectedFile = freezed,
    Object? resetKey = null,
    Object? createdCardId = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedFile: freezed == selectedFile
          ? _self.selectedFile
          : selectedFile // ignore: cast_nullable_to_non_nullable
              as File?,
      resetKey: null == resetKey
          ? _self.resetKey
          : resetKey // ignore: cast_nullable_to_non_nullable
              as int,
      createdCardId: freezed == createdCardId
          ? _self.createdCardId
          : createdCardId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SelfIdCreaterState].
extension SelfIdCreaterStatePatterns on SelfIdCreaterState {
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
    TResult Function(_SelfIdCreaterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SelfIdCreaterState() when $default != null:
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
    TResult Function(_SelfIdCreaterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelfIdCreaterState():
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
    TResult? Function(_SelfIdCreaterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelfIdCreaterState() when $default != null:
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
    TResult Function(bool isLoading, String errorMessage, File? selectedFile,
            int resetKey, int? createdCardId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SelfIdCreaterState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.selectedFile,
            _that.resetKey, _that.createdCardId);
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
    TResult Function(bool isLoading, String errorMessage, File? selectedFile,
            int resetKey, int? createdCardId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelfIdCreaterState():
        return $default(_that.isLoading, _that.errorMessage, _that.selectedFile,
            _that.resetKey, _that.createdCardId);
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
    TResult? Function(bool isLoading, String errorMessage, File? selectedFile,
            int resetKey, int? createdCardId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelfIdCreaterState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.selectedFile,
            _that.resetKey, _that.createdCardId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SelfIdCreaterState implements SelfIdCreaterState {
  const _SelfIdCreaterState(
      {this.isLoading = false,
      this.errorMessage = '',
      this.selectedFile,
      this.resetKey = 0,
      this.createdCardId});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final File? selectedFile;
  @override
  @JsonKey()
  final int resetKey;
  @override
  final int? createdCardId;

  /// Create a copy of SelfIdCreaterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelfIdCreaterStateCopyWith<_SelfIdCreaterState> get copyWith =>
      __$SelfIdCreaterStateCopyWithImpl<_SelfIdCreaterState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelfIdCreaterState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.selectedFile, selectedFile) ||
                other.selectedFile == selectedFile) &&
            (identical(other.resetKey, resetKey) ||
                other.resetKey == resetKey) &&
            (identical(other.createdCardId, createdCardId) ||
                other.createdCardId == createdCardId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage,
      selectedFile, resetKey, createdCardId);

  @override
  String toString() {
    return 'SelfIdCreaterState(isLoading: $isLoading, errorMessage: $errorMessage, selectedFile: $selectedFile, resetKey: $resetKey, createdCardId: $createdCardId)';
  }
}

/// @nodoc
abstract mixin class _$SelfIdCreaterStateCopyWith<$Res>
    implements $SelfIdCreaterStateCopyWith<$Res> {
  factory _$SelfIdCreaterStateCopyWith(
          _SelfIdCreaterState value, $Res Function(_SelfIdCreaterState) _then) =
      __$SelfIdCreaterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      File? selectedFile,
      int resetKey,
      int? createdCardId});
}

/// @nodoc
class __$SelfIdCreaterStateCopyWithImpl<$Res>
    implements _$SelfIdCreaterStateCopyWith<$Res> {
  __$SelfIdCreaterStateCopyWithImpl(this._self, this._then);

  final _SelfIdCreaterState _self;
  final $Res Function(_SelfIdCreaterState) _then;

  /// Create a copy of SelfIdCreaterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? selectedFile = freezed,
    Object? resetKey = null,
    Object? createdCardId = freezed,
  }) {
    return _then(_SelfIdCreaterState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedFile: freezed == selectedFile
          ? _self.selectedFile
          : selectedFile // ignore: cast_nullable_to_non_nullable
              as File?,
      resetKey: null == resetKey
          ? _self.resetKey
          : resetKey // ignore: cast_nullable_to_non_nullable
              as int,
      createdCardId: freezed == createdCardId
          ? _self.createdCardId
          : createdCardId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on

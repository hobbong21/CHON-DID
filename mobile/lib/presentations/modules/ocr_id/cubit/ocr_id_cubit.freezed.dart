// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ocr_id_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OcrIdState {
  bool get isLoading;
  String get errorMessage;
  OcrType? get ocrType;
  File? get image;
  File? get croppedImage;

  /// Create a copy of OcrIdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrIdStateCopyWith<OcrIdState> get copyWith =>
      _$OcrIdStateCopyWithImpl<OcrIdState>(this as OcrIdState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrIdState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.ocrType, ocrType) || other.ocrType == ocrType) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.croppedImage, croppedImage) ||
                other.croppedImage == croppedImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, errorMessage, ocrType, image, croppedImage);

  @override
  String toString() {
    return 'OcrIdState(isLoading: $isLoading, errorMessage: $errorMessage, ocrType: $ocrType, image: $image, croppedImage: $croppedImage)';
  }
}

/// @nodoc
abstract mixin class $OcrIdStateCopyWith<$Res> {
  factory $OcrIdStateCopyWith(
          OcrIdState value, $Res Function(OcrIdState) _then) =
      _$OcrIdStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      OcrType? ocrType,
      File? image,
      File? croppedImage});
}

/// @nodoc
class _$OcrIdStateCopyWithImpl<$Res> implements $OcrIdStateCopyWith<$Res> {
  _$OcrIdStateCopyWithImpl(this._self, this._then);

  final OcrIdState _self;
  final $Res Function(OcrIdState) _then;

  /// Create a copy of OcrIdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? ocrType = freezed,
    Object? image = freezed,
    Object? croppedImage = freezed,
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
      ocrType: freezed == ocrType
          ? _self.ocrType
          : ocrType // ignore: cast_nullable_to_non_nullable
              as OcrType?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      croppedImage: freezed == croppedImage
          ? _self.croppedImage
          : croppedImage // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OcrIdState].
extension OcrIdStatePatterns on OcrIdState {
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
    TResult Function(_OcrIdState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdState() when $default != null:
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
    TResult Function(_OcrIdState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdState():
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
    TResult? Function(_OcrIdState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdState() when $default != null:
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
    TResult Function(bool isLoading, String errorMessage, OcrType? ocrType,
            File? image, File? croppedImage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.ocrType,
            _that.image, _that.croppedImage);
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
    TResult Function(bool isLoading, String errorMessage, OcrType? ocrType,
            File? image, File? croppedImage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdState():
        return $default(_that.isLoading, _that.errorMessage, _that.ocrType,
            _that.image, _that.croppedImage);
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
    TResult? Function(bool isLoading, String errorMessage, OcrType? ocrType,
            File? image, File? croppedImage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.ocrType,
            _that.image, _that.croppedImage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OcrIdState implements OcrIdState {
  _OcrIdState(
      {this.isLoading = false,
      this.errorMessage = '',
      this.ocrType = OcrType.identityCard,
      this.image,
      this.croppedImage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final OcrType? ocrType;
  @override
  final File? image;
  @override
  final File? croppedImage;

  /// Create a copy of OcrIdState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrIdStateCopyWith<_OcrIdState> get copyWith =>
      __$OcrIdStateCopyWithImpl<_OcrIdState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrIdState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.ocrType, ocrType) || other.ocrType == ocrType) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.croppedImage, croppedImage) ||
                other.croppedImage == croppedImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, errorMessage, ocrType, image, croppedImage);

  @override
  String toString() {
    return 'OcrIdState(isLoading: $isLoading, errorMessage: $errorMessage, ocrType: $ocrType, image: $image, croppedImage: $croppedImage)';
  }
}

/// @nodoc
abstract mixin class _$OcrIdStateCopyWith<$Res>
    implements $OcrIdStateCopyWith<$Res> {
  factory _$OcrIdStateCopyWith(
          _OcrIdState value, $Res Function(_OcrIdState) _then) =
      __$OcrIdStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      OcrType? ocrType,
      File? image,
      File? croppedImage});
}

/// @nodoc
class __$OcrIdStateCopyWithImpl<$Res> implements _$OcrIdStateCopyWith<$Res> {
  __$OcrIdStateCopyWithImpl(this._self, this._then);

  final _OcrIdState _self;
  final $Res Function(_OcrIdState) _then;

  /// Create a copy of OcrIdState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? ocrType = freezed,
    Object? image = freezed,
    Object? croppedImage = freezed,
  }) {
    return _then(_OcrIdState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      ocrType: freezed == ocrType
          ? _self.ocrType
          : ocrType // ignore: cast_nullable_to_non_nullable
              as OcrType?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      croppedImage: freezed == croppedImage
          ? _self.croppedImage
          : croppedImage // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

// dart format on

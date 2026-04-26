// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ocr_passport.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OcrDocumentPassportResponse {
  String get version;
  String get requestId;
  int get timestamp;
  List<OcrPassportImage> get images;

  /// Create a copy of OcrDocumentPassportResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrDocumentPassportResponseCopyWith<OcrDocumentPassportResponse>
      get copyWith => _$OcrDocumentPassportResponseCopyWithImpl<
              OcrDocumentPassportResponse>(
          this as OcrDocumentPassportResponse, _$identity);

  /// Serializes this OcrDocumentPassportResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrDocumentPassportResponse &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.images, images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, version, requestId, timestamp,
      const DeepCollectionEquality().hash(images));

  @override
  String toString() {
    return 'OcrDocumentPassportResponse(version: $version, requestId: $requestId, timestamp: $timestamp, images: $images)';
  }
}

/// @nodoc
abstract mixin class $OcrDocumentPassportResponseCopyWith<$Res> {
  factory $OcrDocumentPassportResponseCopyWith(
          OcrDocumentPassportResponse value,
          $Res Function(OcrDocumentPassportResponse) _then) =
      _$OcrDocumentPassportResponseCopyWithImpl;
  @useResult
  $Res call(
      {String version,
      String requestId,
      int timestamp,
      List<OcrPassportImage> images});
}

/// @nodoc
class _$OcrDocumentPassportResponseCopyWithImpl<$Res>
    implements $OcrDocumentPassportResponseCopyWith<$Res> {
  _$OcrDocumentPassportResponseCopyWithImpl(this._self, this._then);

  final OcrDocumentPassportResponse _self;
  final $Res Function(OcrDocumentPassportResponse) _then;

  /// Create a copy of OcrDocumentPassportResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? requestId = null,
    Object? timestamp = null,
    Object? images = null,
  }) {
    return _then(_self.copyWith(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      requestId: null == requestId
          ? _self.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<OcrPassportImage>,
    ));
  }
}

/// Adds pattern-matching-related methods to [OcrDocumentPassportResponse].
extension OcrDocumentPassportResponsePatterns on OcrDocumentPassportResponse {
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
    TResult Function(_OcrDocumentPassportResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentPassportResponse() when $default != null:
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
    TResult Function(_OcrDocumentPassportResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentPassportResponse():
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
    TResult? Function(_OcrDocumentPassportResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentPassportResponse() when $default != null:
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
    TResult Function(String version, String requestId, int timestamp,
            List<OcrPassportImage> images)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentPassportResponse() when $default != null:
        return $default(
            _that.version, _that.requestId, _that.timestamp, _that.images);
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
    TResult Function(String version, String requestId, int timestamp,
            List<OcrPassportImage> images)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentPassportResponse():
        return $default(
            _that.version, _that.requestId, _that.timestamp, _that.images);
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
    TResult? Function(String version, String requestId, int timestamp,
            List<OcrPassportImage> images)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentPassportResponse() when $default != null:
        return $default(
            _that.version, _that.requestId, _that.timestamp, _that.images);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrDocumentPassportResponse implements OcrDocumentPassportResponse {
  const _OcrDocumentPassportResponse(
      {required this.version,
      required this.requestId,
      required this.timestamp,
      required final List<OcrPassportImage> images})
      : _images = images;
  factory _OcrDocumentPassportResponse.fromJson(Map<String, dynamic> json) =>
      _$OcrDocumentPassportResponseFromJson(json);

  @override
  final String version;
  @override
  final String requestId;
  @override
  final int timestamp;
  final List<OcrPassportImage> _images;
  @override
  List<OcrPassportImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// Create a copy of OcrDocumentPassportResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrDocumentPassportResponseCopyWith<_OcrDocumentPassportResponse>
      get copyWith => __$OcrDocumentPassportResponseCopyWithImpl<
          _OcrDocumentPassportResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrDocumentPassportResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrDocumentPassportResponse &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, version, requestId, timestamp,
      const DeepCollectionEquality().hash(_images));

  @override
  String toString() {
    return 'OcrDocumentPassportResponse(version: $version, requestId: $requestId, timestamp: $timestamp, images: $images)';
  }
}

/// @nodoc
abstract mixin class _$OcrDocumentPassportResponseCopyWith<$Res>
    implements $OcrDocumentPassportResponseCopyWith<$Res> {
  factory _$OcrDocumentPassportResponseCopyWith(
          _OcrDocumentPassportResponse value,
          $Res Function(_OcrDocumentPassportResponse) _then) =
      __$OcrDocumentPassportResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String version,
      String requestId,
      int timestamp,
      List<OcrPassportImage> images});
}

/// @nodoc
class __$OcrDocumentPassportResponseCopyWithImpl<$Res>
    implements _$OcrDocumentPassportResponseCopyWith<$Res> {
  __$OcrDocumentPassportResponseCopyWithImpl(this._self, this._then);

  final _OcrDocumentPassportResponse _self;
  final $Res Function(_OcrDocumentPassportResponse) _then;

  /// Create a copy of OcrDocumentPassportResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
    Object? requestId = null,
    Object? timestamp = null,
    Object? images = null,
  }) {
    return _then(_OcrDocumentPassportResponse(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      requestId: null == requestId
          ? _self.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<OcrPassportImage>,
    ));
  }
}

/// @nodoc
mixin _$OcrPassportImage {
  String get uid;
  String get name;
  String get inferResult;
  String? get message;
  OcrValidationResult? get validationResult;
  OcrPassport? get passport;

  /// Create a copy of OcrPassportImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrPassportImageCopyWith<OcrPassportImage> get copyWith =>
      _$OcrPassportImageCopyWithImpl<OcrPassportImage>(
          this as OcrPassportImage, _$identity);

  /// Serializes this OcrPassportImage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrPassportImage &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inferResult, inferResult) ||
                other.inferResult == inferResult) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.validationResult, validationResult) ||
                other.validationResult == validationResult) &&
            (identical(other.passport, passport) ||
                other.passport == passport));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, name, inferResult, message, validationResult, passport);

  @override
  String toString() {
    return 'OcrPassportImage(uid: $uid, name: $name, inferResult: $inferResult, message: $message, validationResult: $validationResult, passport: $passport)';
  }
}

/// @nodoc
abstract mixin class $OcrPassportImageCopyWith<$Res> {
  factory $OcrPassportImageCopyWith(
          OcrPassportImage value, $Res Function(OcrPassportImage) _then) =
      _$OcrPassportImageCopyWithImpl;
  @useResult
  $Res call(
      {String uid,
      String name,
      String inferResult,
      String? message,
      OcrValidationResult? validationResult,
      OcrPassport? passport});

  $OcrValidationResultCopyWith<$Res>? get validationResult;
  $OcrPassportCopyWith<$Res>? get passport;
}

/// @nodoc
class _$OcrPassportImageCopyWithImpl<$Res>
    implements $OcrPassportImageCopyWith<$Res> {
  _$OcrPassportImageCopyWithImpl(this._self, this._then);

  final OcrPassportImage _self;
  final $Res Function(OcrPassportImage) _then;

  /// Create a copy of OcrPassportImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? inferResult = null,
    Object? message = freezed,
    Object? validationResult = freezed,
    Object? passport = freezed,
  }) {
    return _then(_self.copyWith(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      inferResult: null == inferResult
          ? _self.inferResult
          : inferResult // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      validationResult: freezed == validationResult
          ? _self.validationResult
          : validationResult // ignore: cast_nullable_to_non_nullable
              as OcrValidationResult?,
      passport: freezed == passport
          ? _self.passport
          : passport // ignore: cast_nullable_to_non_nullable
              as OcrPassport?,
    ));
  }

  /// Create a copy of OcrPassportImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrValidationResultCopyWith<$Res>? get validationResult {
    if (_self.validationResult == null) {
      return null;
    }

    return $OcrValidationResultCopyWith<$Res>(_self.validationResult!, (value) {
      return _then(_self.copyWith(validationResult: value));
    });
  }

  /// Create a copy of OcrPassportImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportCopyWith<$Res>? get passport {
    if (_self.passport == null) {
      return null;
    }

    return $OcrPassportCopyWith<$Res>(_self.passport!, (value) {
      return _then(_self.copyWith(passport: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OcrPassportImage].
extension OcrPassportImagePatterns on OcrPassportImage {
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
    TResult Function(_OcrPassportImage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrPassportImage() when $default != null:
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
    TResult Function(_OcrPassportImage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassportImage():
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
    TResult? Function(_OcrPassportImage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassportImage() when $default != null:
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
            String uid,
            String name,
            String inferResult,
            String? message,
            OcrValidationResult? validationResult,
            OcrPassport? passport)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrPassportImage() when $default != null:
        return $default(_that.uid, _that.name, _that.inferResult, _that.message,
            _that.validationResult, _that.passport);
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
            String uid,
            String name,
            String inferResult,
            String? message,
            OcrValidationResult? validationResult,
            OcrPassport? passport)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassportImage():
        return $default(_that.uid, _that.name, _that.inferResult, _that.message,
            _that.validationResult, _that.passport);
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
            String uid,
            String name,
            String inferResult,
            String? message,
            OcrValidationResult? validationResult,
            OcrPassport? passport)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassportImage() when $default != null:
        return $default(_that.uid, _that.name, _that.inferResult, _that.message,
            _that.validationResult, _that.passport);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrPassportImage implements OcrPassportImage {
  const _OcrPassportImage(
      {required this.uid,
      required this.name,
      required this.inferResult,
      this.message,
      this.validationResult,
      this.passport});
  factory _OcrPassportImage.fromJson(Map<String, dynamic> json) =>
      _$OcrPassportImageFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String inferResult;
  @override
  final String? message;
  @override
  final OcrValidationResult? validationResult;
  @override
  final OcrPassport? passport;

  /// Create a copy of OcrPassportImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrPassportImageCopyWith<_OcrPassportImage> get copyWith =>
      __$OcrPassportImageCopyWithImpl<_OcrPassportImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrPassportImageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrPassportImage &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inferResult, inferResult) ||
                other.inferResult == inferResult) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.validationResult, validationResult) ||
                other.validationResult == validationResult) &&
            (identical(other.passport, passport) ||
                other.passport == passport));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, name, inferResult, message, validationResult, passport);

  @override
  String toString() {
    return 'OcrPassportImage(uid: $uid, name: $name, inferResult: $inferResult, message: $message, validationResult: $validationResult, passport: $passport)';
  }
}

/// @nodoc
abstract mixin class _$OcrPassportImageCopyWith<$Res>
    implements $OcrPassportImageCopyWith<$Res> {
  factory _$OcrPassportImageCopyWith(
          _OcrPassportImage value, $Res Function(_OcrPassportImage) _then) =
      __$OcrPassportImageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String inferResult,
      String? message,
      OcrValidationResult? validationResult,
      OcrPassport? passport});

  @override
  $OcrValidationResultCopyWith<$Res>? get validationResult;
  @override
  $OcrPassportCopyWith<$Res>? get passport;
}

/// @nodoc
class __$OcrPassportImageCopyWithImpl<$Res>
    implements _$OcrPassportImageCopyWith<$Res> {
  __$OcrPassportImageCopyWithImpl(this._self, this._then);

  final _OcrPassportImage _self;
  final $Res Function(_OcrPassportImage) _then;

  /// Create a copy of OcrPassportImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? inferResult = null,
    Object? message = freezed,
    Object? validationResult = freezed,
    Object? passport = freezed,
  }) {
    return _then(_OcrPassportImage(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      inferResult: null == inferResult
          ? _self.inferResult
          : inferResult // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      validationResult: freezed == validationResult
          ? _self.validationResult
          : validationResult // ignore: cast_nullable_to_non_nullable
              as OcrValidationResult?,
      passport: freezed == passport
          ? _self.passport
          : passport // ignore: cast_nullable_to_non_nullable
              as OcrPassport?,
    ));
  }

  /// Create a copy of OcrPassportImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrValidationResultCopyWith<$Res>? get validationResult {
    if (_self.validationResult == null) {
      return null;
    }

    return $OcrValidationResultCopyWith<$Res>(_self.validationResult!, (value) {
      return _then(_self.copyWith(validationResult: value));
    });
  }

  /// Create a copy of OcrPassportImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportCopyWith<$Res>? get passport {
    if (_self.passport == null) {
      return null;
    }

    return $OcrPassportCopyWith<$Res>(_self.passport!, (value) {
      return _then(_self.copyWith(passport: value));
    });
  }
}

/// @nodoc
mixin _$OcrValidationResult {
  String? get result;

  /// Create a copy of OcrValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrValidationResultCopyWith<OcrValidationResult> get copyWith =>
      _$OcrValidationResultCopyWithImpl<OcrValidationResult>(
          this as OcrValidationResult, _$identity);

  /// Serializes this OcrValidationResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrValidationResult &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'OcrValidationResult(result: $result)';
  }
}

/// @nodoc
abstract mixin class $OcrValidationResultCopyWith<$Res> {
  factory $OcrValidationResultCopyWith(
          OcrValidationResult value, $Res Function(OcrValidationResult) _then) =
      _$OcrValidationResultCopyWithImpl;
  @useResult
  $Res call({String? result});
}

/// @nodoc
class _$OcrValidationResultCopyWithImpl<$Res>
    implements $OcrValidationResultCopyWith<$Res> {
  _$OcrValidationResultCopyWithImpl(this._self, this._then);

  final OcrValidationResult _self;
  final $Res Function(OcrValidationResult) _then;

  /// Create a copy of OcrValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_self.copyWith(
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OcrValidationResult].
extension OcrValidationResultPatterns on OcrValidationResult {
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
    TResult Function(_OcrValidationResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrValidationResult() when $default != null:
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
    TResult Function(_OcrValidationResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrValidationResult():
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
    TResult? Function(_OcrValidationResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrValidationResult() when $default != null:
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
    TResult Function(String? result)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrValidationResult() when $default != null:
        return $default(_that.result);
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
    TResult Function(String? result) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrValidationResult():
        return $default(_that.result);
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
    TResult? Function(String? result)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrValidationResult() when $default != null:
        return $default(_that.result);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrValidationResult implements OcrValidationResult {
  const _OcrValidationResult({this.result});
  factory _OcrValidationResult.fromJson(Map<String, dynamic> json) =>
      _$OcrValidationResultFromJson(json);

  @override
  final String? result;

  /// Create a copy of OcrValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrValidationResultCopyWith<_OcrValidationResult> get copyWith =>
      __$OcrValidationResultCopyWithImpl<_OcrValidationResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrValidationResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrValidationResult &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'OcrValidationResult(result: $result)';
  }
}

/// @nodoc
abstract mixin class _$OcrValidationResultCopyWith<$Res>
    implements $OcrValidationResultCopyWith<$Res> {
  factory _$OcrValidationResultCopyWith(_OcrValidationResult value,
          $Res Function(_OcrValidationResult) _then) =
      __$OcrValidationResultCopyWithImpl;
  @override
  @useResult
  $Res call({String? result});
}

/// @nodoc
class __$OcrValidationResultCopyWithImpl<$Res>
    implements _$OcrValidationResultCopyWith<$Res> {
  __$OcrValidationResultCopyWithImpl(this._self, this._then);

  final _OcrValidationResult _self;
  final $Res Function(_OcrValidationResult) _then;

  /// Create a copy of OcrValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_OcrValidationResult(
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$OcrPassport {
  OcrPassportResult? get passportResult;

  /// Create a copy of OcrPassport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrPassportCopyWith<OcrPassport> get copyWith =>
      _$OcrPassportCopyWithImpl<OcrPassport>(this as OcrPassport, _$identity);

  /// Serializes this OcrPassport to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrPassport &&
            (identical(other.passportResult, passportResult) ||
                other.passportResult == passportResult));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, passportResult);

  @override
  String toString() {
    return 'OcrPassport(passportResult: $passportResult)';
  }
}

/// @nodoc
abstract mixin class $OcrPassportCopyWith<$Res> {
  factory $OcrPassportCopyWith(
          OcrPassport value, $Res Function(OcrPassport) _then) =
      _$OcrPassportCopyWithImpl;
  @useResult
  $Res call({OcrPassportResult? passportResult});

  $OcrPassportResultCopyWith<$Res>? get passportResult;
}

/// @nodoc
class _$OcrPassportCopyWithImpl<$Res> implements $OcrPassportCopyWith<$Res> {
  _$OcrPassportCopyWithImpl(this._self, this._then);

  final OcrPassport _self;
  final $Res Function(OcrPassport) _then;

  /// Create a copy of OcrPassport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passportResult = freezed,
  }) {
    return _then(_self.copyWith(
      passportResult: freezed == passportResult
          ? _self.passportResult
          : passportResult // ignore: cast_nullable_to_non_nullable
              as OcrPassportResult?,
    ));
  }

  /// Create a copy of OcrPassport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportResultCopyWith<$Res>? get passportResult {
    if (_self.passportResult == null) {
      return null;
    }

    return $OcrPassportResultCopyWith<$Res>(_self.passportResult!, (value) {
      return _then(_self.copyWith(passportResult: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OcrPassport].
extension OcrPassportPatterns on OcrPassport {
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
    TResult Function(_OcrPassport value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrPassport() when $default != null:
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
    TResult Function(_OcrPassport value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassport():
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
    TResult? Function(_OcrPassport value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassport() when $default != null:
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
    TResult Function(OcrPassportResult? passportResult)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrPassport() when $default != null:
        return $default(_that.passportResult);
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
    TResult Function(OcrPassportResult? passportResult) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassport():
        return $default(_that.passportResult);
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
    TResult? Function(OcrPassportResult? passportResult)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassport() when $default != null:
        return $default(_that.passportResult);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrPassport implements OcrPassport {
  const _OcrPassport({this.passportResult});
  factory _OcrPassport.fromJson(Map<String, dynamic> json) =>
      _$OcrPassportFromJson(json);

  @override
  final OcrPassportResult? passportResult;

  /// Create a copy of OcrPassport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrPassportCopyWith<_OcrPassport> get copyWith =>
      __$OcrPassportCopyWithImpl<_OcrPassport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrPassportToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrPassport &&
            (identical(other.passportResult, passportResult) ||
                other.passportResult == passportResult));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, passportResult);

  @override
  String toString() {
    return 'OcrPassport(passportResult: $passportResult)';
  }
}

/// @nodoc
abstract mixin class _$OcrPassportCopyWith<$Res>
    implements $OcrPassportCopyWith<$Res> {
  factory _$OcrPassportCopyWith(
          _OcrPassport value, $Res Function(_OcrPassport) _then) =
      __$OcrPassportCopyWithImpl;
  @override
  @useResult
  $Res call({OcrPassportResult? passportResult});

  @override
  $OcrPassportResultCopyWith<$Res>? get passportResult;
}

/// @nodoc
class __$OcrPassportCopyWithImpl<$Res> implements _$OcrPassportCopyWith<$Res> {
  __$OcrPassportCopyWithImpl(this._self, this._then);

  final _OcrPassport _self;
  final $Res Function(_OcrPassport) _then;

  /// Create a copy of OcrPassport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? passportResult = freezed,
  }) {
    return _then(_OcrPassport(
      passportResult: freezed == passportResult
          ? _self.passportResult
          : passportResult // ignore: cast_nullable_to_non_nullable
              as OcrPassportResult?,
    ));
  }

  /// Create a copy of OcrPassport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportResultCopyWith<$Res>? get passportResult {
    if (_self.passportResult == null) {
      return null;
    }

    return $OcrPassportResultCopyWith<$Res>(_self.passportResult!, (value) {
      return _then(_self.copyWith(passportResult: value));
    });
  }
}

/// @nodoc
mixin _$OcrPassportResult {
  OcrPassportField? get documentClassCode;
  OcrPassportField? get issuingStateCode;
  OcrPassportField? get firstName;
  OcrPassportField? get lastName1;
  OcrPassportField? get lastName2;
  OcrPassportField? get documentNumber;
  OcrPassportField? get checkDigitForDocumentNumber;
  OcrPassportField? get nationality;
  OcrPassportField? get dateOfBirth;
  OcrPassportField? get age;
  OcrPassportField? get checkDigitForDateOfBirth;
  OcrPassportField? get gender;
  OcrPassportField? get dateOfExpiry;
  OcrPassportField? get checkDigitForDateOfExpiry;
  OcrPassportField? get personalNumber;
  OcrPassportField? get finalDigitForPersonalNumber;
  OcrPassportField? get mrzType;
  OcrPassportField? get mrzLines;
  OcrPassportField? get isExpired;

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrPassportResultCopyWith<OcrPassportResult> get copyWith =>
      _$OcrPassportResultCopyWithImpl<OcrPassportResult>(
          this as OcrPassportResult, _$identity);

  /// Serializes this OcrPassportResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrPassportResult &&
            (identical(other.documentClassCode, documentClassCode) ||
                other.documentClassCode == documentClassCode) &&
            (identical(other.issuingStateCode, issuingStateCode) ||
                other.issuingStateCode == issuingStateCode) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName1, lastName1) ||
                other.lastName1 == lastName1) &&
            (identical(other.lastName2, lastName2) ||
                other.lastName2 == lastName2) &&
            (identical(other.documentNumber, documentNumber) ||
                other.documentNumber == documentNumber) &&
            (identical(other.checkDigitForDocumentNumber,
                    checkDigitForDocumentNumber) ||
                other.checkDigitForDocumentNumber ==
                    checkDigitForDocumentNumber) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(
                    other.checkDigitForDateOfBirth, checkDigitForDateOfBirth) ||
                other.checkDigitForDateOfBirth == checkDigitForDateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfExpiry, dateOfExpiry) ||
                other.dateOfExpiry == dateOfExpiry) &&
            (identical(other.checkDigitForDateOfExpiry,
                    checkDigitForDateOfExpiry) ||
                other.checkDigitForDateOfExpiry == checkDigitForDateOfExpiry) &&
            (identical(other.personalNumber, personalNumber) ||
                other.personalNumber == personalNumber) &&
            (identical(other.finalDigitForPersonalNumber,
                    finalDigitForPersonalNumber) ||
                other.finalDigitForPersonalNumber ==
                    finalDigitForPersonalNumber) &&
            (identical(other.mrzType, mrzType) || other.mrzType == mrzType) &&
            (identical(other.mrzLines, mrzLines) ||
                other.mrzLines == mrzLines) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        documentClassCode,
        issuingStateCode,
        firstName,
        lastName1,
        lastName2,
        documentNumber,
        checkDigitForDocumentNumber,
        nationality,
        dateOfBirth,
        age,
        checkDigitForDateOfBirth,
        gender,
        dateOfExpiry,
        checkDigitForDateOfExpiry,
        personalNumber,
        finalDigitForPersonalNumber,
        mrzType,
        mrzLines,
        isExpired
      ]);

  @override
  String toString() {
    return 'OcrPassportResult(documentClassCode: $documentClassCode, issuingStateCode: $issuingStateCode, firstName: $firstName, lastName1: $lastName1, lastName2: $lastName2, documentNumber: $documentNumber, checkDigitForDocumentNumber: $checkDigitForDocumentNumber, nationality: $nationality, dateOfBirth: $dateOfBirth, age: $age, checkDigitForDateOfBirth: $checkDigitForDateOfBirth, gender: $gender, dateOfExpiry: $dateOfExpiry, checkDigitForDateOfExpiry: $checkDigitForDateOfExpiry, personalNumber: $personalNumber, finalDigitForPersonalNumber: $finalDigitForPersonalNumber, mrzType: $mrzType, mrzLines: $mrzLines, isExpired: $isExpired)';
  }
}

/// @nodoc
abstract mixin class $OcrPassportResultCopyWith<$Res> {
  factory $OcrPassportResultCopyWith(
          OcrPassportResult value, $Res Function(OcrPassportResult) _then) =
      _$OcrPassportResultCopyWithImpl;
  @useResult
  $Res call(
      {OcrPassportField? documentClassCode,
      OcrPassportField? issuingStateCode,
      OcrPassportField? firstName,
      OcrPassportField? lastName1,
      OcrPassportField? lastName2,
      OcrPassportField? documentNumber,
      OcrPassportField? checkDigitForDocumentNumber,
      OcrPassportField? nationality,
      OcrPassportField? dateOfBirth,
      OcrPassportField? age,
      OcrPassportField? checkDigitForDateOfBirth,
      OcrPassportField? gender,
      OcrPassportField? dateOfExpiry,
      OcrPassportField? checkDigitForDateOfExpiry,
      OcrPassportField? personalNumber,
      OcrPassportField? finalDigitForPersonalNumber,
      OcrPassportField? mrzType,
      OcrPassportField? mrzLines,
      OcrPassportField? isExpired});

  $OcrPassportFieldCopyWith<$Res>? get documentClassCode;
  $OcrPassportFieldCopyWith<$Res>? get issuingStateCode;
  $OcrPassportFieldCopyWith<$Res>? get firstName;
  $OcrPassportFieldCopyWith<$Res>? get lastName1;
  $OcrPassportFieldCopyWith<$Res>? get lastName2;
  $OcrPassportFieldCopyWith<$Res>? get documentNumber;
  $OcrPassportFieldCopyWith<$Res>? get checkDigitForDocumentNumber;
  $OcrPassportFieldCopyWith<$Res>? get nationality;
  $OcrPassportFieldCopyWith<$Res>? get dateOfBirth;
  $OcrPassportFieldCopyWith<$Res>? get age;
  $OcrPassportFieldCopyWith<$Res>? get checkDigitForDateOfBirth;
  $OcrPassportFieldCopyWith<$Res>? get gender;
  $OcrPassportFieldCopyWith<$Res>? get dateOfExpiry;
  $OcrPassportFieldCopyWith<$Res>? get checkDigitForDateOfExpiry;
  $OcrPassportFieldCopyWith<$Res>? get personalNumber;
  $OcrPassportFieldCopyWith<$Res>? get finalDigitForPersonalNumber;
  $OcrPassportFieldCopyWith<$Res>? get mrzType;
  $OcrPassportFieldCopyWith<$Res>? get mrzLines;
  $OcrPassportFieldCopyWith<$Res>? get isExpired;
}

/// @nodoc
class _$OcrPassportResultCopyWithImpl<$Res>
    implements $OcrPassportResultCopyWith<$Res> {
  _$OcrPassportResultCopyWithImpl(this._self, this._then);

  final OcrPassportResult _self;
  final $Res Function(OcrPassportResult) _then;

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentClassCode = freezed,
    Object? issuingStateCode = freezed,
    Object? firstName = freezed,
    Object? lastName1 = freezed,
    Object? lastName2 = freezed,
    Object? documentNumber = freezed,
    Object? checkDigitForDocumentNumber = freezed,
    Object? nationality = freezed,
    Object? dateOfBirth = freezed,
    Object? age = freezed,
    Object? checkDigitForDateOfBirth = freezed,
    Object? gender = freezed,
    Object? dateOfExpiry = freezed,
    Object? checkDigitForDateOfExpiry = freezed,
    Object? personalNumber = freezed,
    Object? finalDigitForPersonalNumber = freezed,
    Object? mrzType = freezed,
    Object? mrzLines = freezed,
    Object? isExpired = freezed,
  }) {
    return _then(_self.copyWith(
      documentClassCode: freezed == documentClassCode
          ? _self.documentClassCode
          : documentClassCode // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      issuingStateCode: freezed == issuingStateCode
          ? _self.issuingStateCode
          : issuingStateCode // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      lastName1: freezed == lastName1
          ? _self.lastName1
          : lastName1 // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      lastName2: freezed == lastName2
          ? _self.lastName2
          : lastName2 // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      documentNumber: freezed == documentNumber
          ? _self.documentNumber
          : documentNumber // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      checkDigitForDocumentNumber: freezed == checkDigitForDocumentNumber
          ? _self.checkDigitForDocumentNumber
          : checkDigitForDocumentNumber // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      nationality: freezed == nationality
          ? _self.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      checkDigitForDateOfBirth: freezed == checkDigitForDateOfBirth
          ? _self.checkDigitForDateOfBirth
          : checkDigitForDateOfBirth // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      dateOfExpiry: freezed == dateOfExpiry
          ? _self.dateOfExpiry
          : dateOfExpiry // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      checkDigitForDateOfExpiry: freezed == checkDigitForDateOfExpiry
          ? _self.checkDigitForDateOfExpiry
          : checkDigitForDateOfExpiry // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      personalNumber: freezed == personalNumber
          ? _self.personalNumber
          : personalNumber // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      finalDigitForPersonalNumber: freezed == finalDigitForPersonalNumber
          ? _self.finalDigitForPersonalNumber
          : finalDigitForPersonalNumber // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      mrzType: freezed == mrzType
          ? _self.mrzType
          : mrzType // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      mrzLines: freezed == mrzLines
          ? _self.mrzLines
          : mrzLines // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      isExpired: freezed == isExpired
          ? _self.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
    ));
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get documentClassCode {
    if (_self.documentClassCode == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.documentClassCode!, (value) {
      return _then(_self.copyWith(documentClassCode: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get issuingStateCode {
    if (_self.issuingStateCode == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.issuingStateCode!, (value) {
      return _then(_self.copyWith(issuingStateCode: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get firstName {
    if (_self.firstName == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.firstName!, (value) {
      return _then(_self.copyWith(firstName: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get lastName1 {
    if (_self.lastName1 == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.lastName1!, (value) {
      return _then(_self.copyWith(lastName1: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get lastName2 {
    if (_self.lastName2 == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.lastName2!, (value) {
      return _then(_self.copyWith(lastName2: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get documentNumber {
    if (_self.documentNumber == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.documentNumber!, (value) {
      return _then(_self.copyWith(documentNumber: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get checkDigitForDocumentNumber {
    if (_self.checkDigitForDocumentNumber == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.checkDigitForDocumentNumber!,
        (value) {
      return _then(_self.copyWith(checkDigitForDocumentNumber: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get nationality {
    if (_self.nationality == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.nationality!, (value) {
      return _then(_self.copyWith(nationality: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get dateOfBirth {
    if (_self.dateOfBirth == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.dateOfBirth!, (value) {
      return _then(_self.copyWith(dateOfBirth: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get age {
    if (_self.age == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.age!, (value) {
      return _then(_self.copyWith(age: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get checkDigitForDateOfBirth {
    if (_self.checkDigitForDateOfBirth == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.checkDigitForDateOfBirth!,
        (value) {
      return _then(_self.copyWith(checkDigitForDateOfBirth: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get gender {
    if (_self.gender == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.gender!, (value) {
      return _then(_self.copyWith(gender: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get dateOfExpiry {
    if (_self.dateOfExpiry == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.dateOfExpiry!, (value) {
      return _then(_self.copyWith(dateOfExpiry: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get checkDigitForDateOfExpiry {
    if (_self.checkDigitForDateOfExpiry == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.checkDigitForDateOfExpiry!,
        (value) {
      return _then(_self.copyWith(checkDigitForDateOfExpiry: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get personalNumber {
    if (_self.personalNumber == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.personalNumber!, (value) {
      return _then(_self.copyWith(personalNumber: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get finalDigitForPersonalNumber {
    if (_self.finalDigitForPersonalNumber == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.finalDigitForPersonalNumber!,
        (value) {
      return _then(_self.copyWith(finalDigitForPersonalNumber: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get mrzType {
    if (_self.mrzType == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.mrzType!, (value) {
      return _then(_self.copyWith(mrzType: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get mrzLines {
    if (_self.mrzLines == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.mrzLines!, (value) {
      return _then(_self.copyWith(mrzLines: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get isExpired {
    if (_self.isExpired == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.isExpired!, (value) {
      return _then(_self.copyWith(isExpired: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OcrPassportResult].
extension OcrPassportResultPatterns on OcrPassportResult {
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
    TResult Function(_OcrPassportResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrPassportResult() when $default != null:
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
    TResult Function(_OcrPassportResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassportResult():
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
    TResult? Function(_OcrPassportResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassportResult() when $default != null:
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
            OcrPassportField? documentClassCode,
            OcrPassportField? issuingStateCode,
            OcrPassportField? firstName,
            OcrPassportField? lastName1,
            OcrPassportField? lastName2,
            OcrPassportField? documentNumber,
            OcrPassportField? checkDigitForDocumentNumber,
            OcrPassportField? nationality,
            OcrPassportField? dateOfBirth,
            OcrPassportField? age,
            OcrPassportField? checkDigitForDateOfBirth,
            OcrPassportField? gender,
            OcrPassportField? dateOfExpiry,
            OcrPassportField? checkDigitForDateOfExpiry,
            OcrPassportField? personalNumber,
            OcrPassportField? finalDigitForPersonalNumber,
            OcrPassportField? mrzType,
            OcrPassportField? mrzLines,
            OcrPassportField? isExpired)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrPassportResult() when $default != null:
        return $default(
            _that.documentClassCode,
            _that.issuingStateCode,
            _that.firstName,
            _that.lastName1,
            _that.lastName2,
            _that.documentNumber,
            _that.checkDigitForDocumentNumber,
            _that.nationality,
            _that.dateOfBirth,
            _that.age,
            _that.checkDigitForDateOfBirth,
            _that.gender,
            _that.dateOfExpiry,
            _that.checkDigitForDateOfExpiry,
            _that.personalNumber,
            _that.finalDigitForPersonalNumber,
            _that.mrzType,
            _that.mrzLines,
            _that.isExpired);
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
            OcrPassportField? documentClassCode,
            OcrPassportField? issuingStateCode,
            OcrPassportField? firstName,
            OcrPassportField? lastName1,
            OcrPassportField? lastName2,
            OcrPassportField? documentNumber,
            OcrPassportField? checkDigitForDocumentNumber,
            OcrPassportField? nationality,
            OcrPassportField? dateOfBirth,
            OcrPassportField? age,
            OcrPassportField? checkDigitForDateOfBirth,
            OcrPassportField? gender,
            OcrPassportField? dateOfExpiry,
            OcrPassportField? checkDigitForDateOfExpiry,
            OcrPassportField? personalNumber,
            OcrPassportField? finalDigitForPersonalNumber,
            OcrPassportField? mrzType,
            OcrPassportField? mrzLines,
            OcrPassportField? isExpired)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassportResult():
        return $default(
            _that.documentClassCode,
            _that.issuingStateCode,
            _that.firstName,
            _that.lastName1,
            _that.lastName2,
            _that.documentNumber,
            _that.checkDigitForDocumentNumber,
            _that.nationality,
            _that.dateOfBirth,
            _that.age,
            _that.checkDigitForDateOfBirth,
            _that.gender,
            _that.dateOfExpiry,
            _that.checkDigitForDateOfExpiry,
            _that.personalNumber,
            _that.finalDigitForPersonalNumber,
            _that.mrzType,
            _that.mrzLines,
            _that.isExpired);
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
            OcrPassportField? documentClassCode,
            OcrPassportField? issuingStateCode,
            OcrPassportField? firstName,
            OcrPassportField? lastName1,
            OcrPassportField? lastName2,
            OcrPassportField? documentNumber,
            OcrPassportField? checkDigitForDocumentNumber,
            OcrPassportField? nationality,
            OcrPassportField? dateOfBirth,
            OcrPassportField? age,
            OcrPassportField? checkDigitForDateOfBirth,
            OcrPassportField? gender,
            OcrPassportField? dateOfExpiry,
            OcrPassportField? checkDigitForDateOfExpiry,
            OcrPassportField? personalNumber,
            OcrPassportField? finalDigitForPersonalNumber,
            OcrPassportField? mrzType,
            OcrPassportField? mrzLines,
            OcrPassportField? isExpired)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassportResult() when $default != null:
        return $default(
            _that.documentClassCode,
            _that.issuingStateCode,
            _that.firstName,
            _that.lastName1,
            _that.lastName2,
            _that.documentNumber,
            _that.checkDigitForDocumentNumber,
            _that.nationality,
            _that.dateOfBirth,
            _that.age,
            _that.checkDigitForDateOfBirth,
            _that.gender,
            _that.dateOfExpiry,
            _that.checkDigitForDateOfExpiry,
            _that.personalNumber,
            _that.finalDigitForPersonalNumber,
            _that.mrzType,
            _that.mrzLines,
            _that.isExpired);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrPassportResult implements OcrPassportResult {
  const _OcrPassportResult(
      {this.documentClassCode,
      this.issuingStateCode,
      this.firstName,
      this.lastName1,
      this.lastName2,
      this.documentNumber,
      this.checkDigitForDocumentNumber,
      this.nationality,
      this.dateOfBirth,
      this.age,
      this.checkDigitForDateOfBirth,
      this.gender,
      this.dateOfExpiry,
      this.checkDigitForDateOfExpiry,
      this.personalNumber,
      this.finalDigitForPersonalNumber,
      this.mrzType,
      this.mrzLines,
      this.isExpired});
  factory _OcrPassportResult.fromJson(Map<String, dynamic> json) =>
      _$OcrPassportResultFromJson(json);

  @override
  final OcrPassportField? documentClassCode;
  @override
  final OcrPassportField? issuingStateCode;
  @override
  final OcrPassportField? firstName;
  @override
  final OcrPassportField? lastName1;
  @override
  final OcrPassportField? lastName2;
  @override
  final OcrPassportField? documentNumber;
  @override
  final OcrPassportField? checkDigitForDocumentNumber;
  @override
  final OcrPassportField? nationality;
  @override
  final OcrPassportField? dateOfBirth;
  @override
  final OcrPassportField? age;
  @override
  final OcrPassportField? checkDigitForDateOfBirth;
  @override
  final OcrPassportField? gender;
  @override
  final OcrPassportField? dateOfExpiry;
  @override
  final OcrPassportField? checkDigitForDateOfExpiry;
  @override
  final OcrPassportField? personalNumber;
  @override
  final OcrPassportField? finalDigitForPersonalNumber;
  @override
  final OcrPassportField? mrzType;
  @override
  final OcrPassportField? mrzLines;
  @override
  final OcrPassportField? isExpired;

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrPassportResultCopyWith<_OcrPassportResult> get copyWith =>
      __$OcrPassportResultCopyWithImpl<_OcrPassportResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrPassportResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrPassportResult &&
            (identical(other.documentClassCode, documentClassCode) ||
                other.documentClassCode == documentClassCode) &&
            (identical(other.issuingStateCode, issuingStateCode) ||
                other.issuingStateCode == issuingStateCode) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName1, lastName1) ||
                other.lastName1 == lastName1) &&
            (identical(other.lastName2, lastName2) ||
                other.lastName2 == lastName2) &&
            (identical(other.documentNumber, documentNumber) ||
                other.documentNumber == documentNumber) &&
            (identical(other.checkDigitForDocumentNumber,
                    checkDigitForDocumentNumber) ||
                other.checkDigitForDocumentNumber ==
                    checkDigitForDocumentNumber) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(
                    other.checkDigitForDateOfBirth, checkDigitForDateOfBirth) ||
                other.checkDigitForDateOfBirth == checkDigitForDateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfExpiry, dateOfExpiry) ||
                other.dateOfExpiry == dateOfExpiry) &&
            (identical(other.checkDigitForDateOfExpiry,
                    checkDigitForDateOfExpiry) ||
                other.checkDigitForDateOfExpiry == checkDigitForDateOfExpiry) &&
            (identical(other.personalNumber, personalNumber) ||
                other.personalNumber == personalNumber) &&
            (identical(other.finalDigitForPersonalNumber,
                    finalDigitForPersonalNumber) ||
                other.finalDigitForPersonalNumber ==
                    finalDigitForPersonalNumber) &&
            (identical(other.mrzType, mrzType) || other.mrzType == mrzType) &&
            (identical(other.mrzLines, mrzLines) ||
                other.mrzLines == mrzLines) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        documentClassCode,
        issuingStateCode,
        firstName,
        lastName1,
        lastName2,
        documentNumber,
        checkDigitForDocumentNumber,
        nationality,
        dateOfBirth,
        age,
        checkDigitForDateOfBirth,
        gender,
        dateOfExpiry,
        checkDigitForDateOfExpiry,
        personalNumber,
        finalDigitForPersonalNumber,
        mrzType,
        mrzLines,
        isExpired
      ]);

  @override
  String toString() {
    return 'OcrPassportResult(documentClassCode: $documentClassCode, issuingStateCode: $issuingStateCode, firstName: $firstName, lastName1: $lastName1, lastName2: $lastName2, documentNumber: $documentNumber, checkDigitForDocumentNumber: $checkDigitForDocumentNumber, nationality: $nationality, dateOfBirth: $dateOfBirth, age: $age, checkDigitForDateOfBirth: $checkDigitForDateOfBirth, gender: $gender, dateOfExpiry: $dateOfExpiry, checkDigitForDateOfExpiry: $checkDigitForDateOfExpiry, personalNumber: $personalNumber, finalDigitForPersonalNumber: $finalDigitForPersonalNumber, mrzType: $mrzType, mrzLines: $mrzLines, isExpired: $isExpired)';
  }
}

/// @nodoc
abstract mixin class _$OcrPassportResultCopyWith<$Res>
    implements $OcrPassportResultCopyWith<$Res> {
  factory _$OcrPassportResultCopyWith(
          _OcrPassportResult value, $Res Function(_OcrPassportResult) _then) =
      __$OcrPassportResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {OcrPassportField? documentClassCode,
      OcrPassportField? issuingStateCode,
      OcrPassportField? firstName,
      OcrPassportField? lastName1,
      OcrPassportField? lastName2,
      OcrPassportField? documentNumber,
      OcrPassportField? checkDigitForDocumentNumber,
      OcrPassportField? nationality,
      OcrPassportField? dateOfBirth,
      OcrPassportField? age,
      OcrPassportField? checkDigitForDateOfBirth,
      OcrPassportField? gender,
      OcrPassportField? dateOfExpiry,
      OcrPassportField? checkDigitForDateOfExpiry,
      OcrPassportField? personalNumber,
      OcrPassportField? finalDigitForPersonalNumber,
      OcrPassportField? mrzType,
      OcrPassportField? mrzLines,
      OcrPassportField? isExpired});

  @override
  $OcrPassportFieldCopyWith<$Res>? get documentClassCode;
  @override
  $OcrPassportFieldCopyWith<$Res>? get issuingStateCode;
  @override
  $OcrPassportFieldCopyWith<$Res>? get firstName;
  @override
  $OcrPassportFieldCopyWith<$Res>? get lastName1;
  @override
  $OcrPassportFieldCopyWith<$Res>? get lastName2;
  @override
  $OcrPassportFieldCopyWith<$Res>? get documentNumber;
  @override
  $OcrPassportFieldCopyWith<$Res>? get checkDigitForDocumentNumber;
  @override
  $OcrPassportFieldCopyWith<$Res>? get nationality;
  @override
  $OcrPassportFieldCopyWith<$Res>? get dateOfBirth;
  @override
  $OcrPassportFieldCopyWith<$Res>? get age;
  @override
  $OcrPassportFieldCopyWith<$Res>? get checkDigitForDateOfBirth;
  @override
  $OcrPassportFieldCopyWith<$Res>? get gender;
  @override
  $OcrPassportFieldCopyWith<$Res>? get dateOfExpiry;
  @override
  $OcrPassportFieldCopyWith<$Res>? get checkDigitForDateOfExpiry;
  @override
  $OcrPassportFieldCopyWith<$Res>? get personalNumber;
  @override
  $OcrPassportFieldCopyWith<$Res>? get finalDigitForPersonalNumber;
  @override
  $OcrPassportFieldCopyWith<$Res>? get mrzType;
  @override
  $OcrPassportFieldCopyWith<$Res>? get mrzLines;
  @override
  $OcrPassportFieldCopyWith<$Res>? get isExpired;
}

/// @nodoc
class __$OcrPassportResultCopyWithImpl<$Res>
    implements _$OcrPassportResultCopyWith<$Res> {
  __$OcrPassportResultCopyWithImpl(this._self, this._then);

  final _OcrPassportResult _self;
  final $Res Function(_OcrPassportResult) _then;

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? documentClassCode = freezed,
    Object? issuingStateCode = freezed,
    Object? firstName = freezed,
    Object? lastName1 = freezed,
    Object? lastName2 = freezed,
    Object? documentNumber = freezed,
    Object? checkDigitForDocumentNumber = freezed,
    Object? nationality = freezed,
    Object? dateOfBirth = freezed,
    Object? age = freezed,
    Object? checkDigitForDateOfBirth = freezed,
    Object? gender = freezed,
    Object? dateOfExpiry = freezed,
    Object? checkDigitForDateOfExpiry = freezed,
    Object? personalNumber = freezed,
    Object? finalDigitForPersonalNumber = freezed,
    Object? mrzType = freezed,
    Object? mrzLines = freezed,
    Object? isExpired = freezed,
  }) {
    return _then(_OcrPassportResult(
      documentClassCode: freezed == documentClassCode
          ? _self.documentClassCode
          : documentClassCode // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      issuingStateCode: freezed == issuingStateCode
          ? _self.issuingStateCode
          : issuingStateCode // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      lastName1: freezed == lastName1
          ? _self.lastName1
          : lastName1 // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      lastName2: freezed == lastName2
          ? _self.lastName2
          : lastName2 // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      documentNumber: freezed == documentNumber
          ? _self.documentNumber
          : documentNumber // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      checkDigitForDocumentNumber: freezed == checkDigitForDocumentNumber
          ? _self.checkDigitForDocumentNumber
          : checkDigitForDocumentNumber // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      nationality: freezed == nationality
          ? _self.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      checkDigitForDateOfBirth: freezed == checkDigitForDateOfBirth
          ? _self.checkDigitForDateOfBirth
          : checkDigitForDateOfBirth // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      dateOfExpiry: freezed == dateOfExpiry
          ? _self.dateOfExpiry
          : dateOfExpiry // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      checkDigitForDateOfExpiry: freezed == checkDigitForDateOfExpiry
          ? _self.checkDigitForDateOfExpiry
          : checkDigitForDateOfExpiry // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      personalNumber: freezed == personalNumber
          ? _self.personalNumber
          : personalNumber // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      finalDigitForPersonalNumber: freezed == finalDigitForPersonalNumber
          ? _self.finalDigitForPersonalNumber
          : finalDigitForPersonalNumber // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      mrzType: freezed == mrzType
          ? _self.mrzType
          : mrzType // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      mrzLines: freezed == mrzLines
          ? _self.mrzLines
          : mrzLines // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
      isExpired: freezed == isExpired
          ? _self.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as OcrPassportField?,
    ));
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get documentClassCode {
    if (_self.documentClassCode == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.documentClassCode!, (value) {
      return _then(_self.copyWith(documentClassCode: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get issuingStateCode {
    if (_self.issuingStateCode == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.issuingStateCode!, (value) {
      return _then(_self.copyWith(issuingStateCode: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get firstName {
    if (_self.firstName == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.firstName!, (value) {
      return _then(_self.copyWith(firstName: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get lastName1 {
    if (_self.lastName1 == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.lastName1!, (value) {
      return _then(_self.copyWith(lastName1: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get lastName2 {
    if (_self.lastName2 == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.lastName2!, (value) {
      return _then(_self.copyWith(lastName2: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get documentNumber {
    if (_self.documentNumber == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.documentNumber!, (value) {
      return _then(_self.copyWith(documentNumber: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get checkDigitForDocumentNumber {
    if (_self.checkDigitForDocumentNumber == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.checkDigitForDocumentNumber!,
        (value) {
      return _then(_self.copyWith(checkDigitForDocumentNumber: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get nationality {
    if (_self.nationality == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.nationality!, (value) {
      return _then(_self.copyWith(nationality: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get dateOfBirth {
    if (_self.dateOfBirth == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.dateOfBirth!, (value) {
      return _then(_self.copyWith(dateOfBirth: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get age {
    if (_self.age == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.age!, (value) {
      return _then(_self.copyWith(age: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get checkDigitForDateOfBirth {
    if (_self.checkDigitForDateOfBirth == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.checkDigitForDateOfBirth!,
        (value) {
      return _then(_self.copyWith(checkDigitForDateOfBirth: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get gender {
    if (_self.gender == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.gender!, (value) {
      return _then(_self.copyWith(gender: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get dateOfExpiry {
    if (_self.dateOfExpiry == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.dateOfExpiry!, (value) {
      return _then(_self.copyWith(dateOfExpiry: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get checkDigitForDateOfExpiry {
    if (_self.checkDigitForDateOfExpiry == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.checkDigitForDateOfExpiry!,
        (value) {
      return _then(_self.copyWith(checkDigitForDateOfExpiry: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get personalNumber {
    if (_self.personalNumber == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.personalNumber!, (value) {
      return _then(_self.copyWith(personalNumber: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get finalDigitForPersonalNumber {
    if (_self.finalDigitForPersonalNumber == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.finalDigitForPersonalNumber!,
        (value) {
      return _then(_self.copyWith(finalDigitForPersonalNumber: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get mrzType {
    if (_self.mrzType == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.mrzType!, (value) {
      return _then(_self.copyWith(mrzType: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get mrzLines {
    if (_self.mrzLines == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.mrzLines!, (value) {
      return _then(_self.copyWith(mrzLines: value));
    });
  }

  /// Create a copy of OcrPassportResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<$Res>? get isExpired {
    if (_self.isExpired == null) {
      return null;
    }

    return $OcrPassportFieldCopyWith<$Res>(_self.isExpired!, (value) {
      return _then(_self.copyWith(isExpired: value));
    });
  }
}

/// @nodoc
mixin _$OcrPassportField {
  String? get rawText;
  dynamic get refinedText;

  /// Create a copy of OcrPassportField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrPassportFieldCopyWith<OcrPassportField> get copyWith =>
      _$OcrPassportFieldCopyWithImpl<OcrPassportField>(
          this as OcrPassportField, _$identity);

  /// Serializes this OcrPassportField to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrPassportField &&
            (identical(other.rawText, rawText) || other.rawText == rawText) &&
            const DeepCollectionEquality()
                .equals(other.refinedText, refinedText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, rawText, const DeepCollectionEquality().hash(refinedText));

  @override
  String toString() {
    return 'OcrPassportField(rawText: $rawText, refinedText: $refinedText)';
  }
}

/// @nodoc
abstract mixin class $OcrPassportFieldCopyWith<$Res> {
  factory $OcrPassportFieldCopyWith(
          OcrPassportField value, $Res Function(OcrPassportField) _then) =
      _$OcrPassportFieldCopyWithImpl;
  @useResult
  $Res call({String? rawText, dynamic refinedText});
}

/// @nodoc
class _$OcrPassportFieldCopyWithImpl<$Res>
    implements $OcrPassportFieldCopyWith<$Res> {
  _$OcrPassportFieldCopyWithImpl(this._self, this._then);

  final OcrPassportField _self;
  final $Res Function(OcrPassportField) _then;

  /// Create a copy of OcrPassportField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawText = freezed,
    Object? refinedText = freezed,
  }) {
    return _then(_self.copyWith(
      rawText: freezed == rawText
          ? _self.rawText
          : rawText // ignore: cast_nullable_to_non_nullable
              as String?,
      refinedText: freezed == refinedText
          ? _self.refinedText
          : refinedText // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// Adds pattern-matching-related methods to [OcrPassportField].
extension OcrPassportFieldPatterns on OcrPassportField {
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
    TResult Function(_OcrPassportField value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrPassportField() when $default != null:
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
    TResult Function(_OcrPassportField value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassportField():
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
    TResult? Function(_OcrPassportField value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassportField() when $default != null:
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
    TResult Function(String? rawText, dynamic refinedText)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrPassportField() when $default != null:
        return $default(_that.rawText, _that.refinedText);
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
    TResult Function(String? rawText, dynamic refinedText) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassportField():
        return $default(_that.rawText, _that.refinedText);
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
    TResult? Function(String? rawText, dynamic refinedText)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrPassportField() when $default != null:
        return $default(_that.rawText, _that.refinedText);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrPassportField implements OcrPassportField {
  const _OcrPassportField({this.rawText, this.refinedText});
  factory _OcrPassportField.fromJson(Map<String, dynamic> json) =>
      _$OcrPassportFieldFromJson(json);

  @override
  final String? rawText;
  @override
  final dynamic refinedText;

  /// Create a copy of OcrPassportField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrPassportFieldCopyWith<_OcrPassportField> get copyWith =>
      __$OcrPassportFieldCopyWithImpl<_OcrPassportField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrPassportFieldToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrPassportField &&
            (identical(other.rawText, rawText) || other.rawText == rawText) &&
            const DeepCollectionEquality()
                .equals(other.refinedText, refinedText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, rawText, const DeepCollectionEquality().hash(refinedText));

  @override
  String toString() {
    return 'OcrPassportField(rawText: $rawText, refinedText: $refinedText)';
  }
}

/// @nodoc
abstract mixin class _$OcrPassportFieldCopyWith<$Res>
    implements $OcrPassportFieldCopyWith<$Res> {
  factory _$OcrPassportFieldCopyWith(
          _OcrPassportField value, $Res Function(_OcrPassportField) _then) =
      __$OcrPassportFieldCopyWithImpl;
  @override
  @useResult
  $Res call({String? rawText, dynamic refinedText});
}

/// @nodoc
class __$OcrPassportFieldCopyWithImpl<$Res>
    implements _$OcrPassportFieldCopyWith<$Res> {
  __$OcrPassportFieldCopyWithImpl(this._self, this._then);

  final _OcrPassportField _self;
  final $Res Function(_OcrPassportField) _then;

  /// Create a copy of OcrPassportField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rawText = freezed,
    Object? refinedText = freezed,
  }) {
    return _then(_OcrPassportField(
      rawText: freezed == rawText
          ? _self.rawText
          : rawText // ignore: cast_nullable_to_non_nullable
              as String?,
      refinedText: freezed == refinedText
          ? _self.refinedText
          : refinedText // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on

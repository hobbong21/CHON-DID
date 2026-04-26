// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ocr_card_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OcrDocumentIdCardResponse {
  String get version;
  String get requestId;
  int get timestamp;
  List<OcrDocumentImage> get images;

  /// Create a copy of OcrDocumentIdCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrDocumentIdCardResponseCopyWith<OcrDocumentIdCardResponse> get copyWith =>
      _$OcrDocumentIdCardResponseCopyWithImpl<OcrDocumentIdCardResponse>(
          this as OcrDocumentIdCardResponse, _$identity);

  /// Serializes this OcrDocumentIdCardResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrDocumentIdCardResponse &&
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
    return 'OcrDocumentIdCardResponse(version: $version, requestId: $requestId, timestamp: $timestamp, images: $images)';
  }
}

/// @nodoc
abstract mixin class $OcrDocumentIdCardResponseCopyWith<$Res> {
  factory $OcrDocumentIdCardResponseCopyWith(OcrDocumentIdCardResponse value,
          $Res Function(OcrDocumentIdCardResponse) _then) =
      _$OcrDocumentIdCardResponseCopyWithImpl;
  @useResult
  $Res call(
      {String version,
      String requestId,
      int timestamp,
      List<OcrDocumentImage> images});
}

/// @nodoc
class _$OcrDocumentIdCardResponseCopyWithImpl<$Res>
    implements $OcrDocumentIdCardResponseCopyWith<$Res> {
  _$OcrDocumentIdCardResponseCopyWithImpl(this._self, this._then);

  final OcrDocumentIdCardResponse _self;
  final $Res Function(OcrDocumentIdCardResponse) _then;

  /// Create a copy of OcrDocumentIdCardResponse
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
              as List<OcrDocumentImage>,
    ));
  }
}

/// Adds pattern-matching-related methods to [OcrDocumentIdCardResponse].
extension OcrDocumentIdCardResponsePatterns on OcrDocumentIdCardResponse {
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
    TResult Function(_OcrDocumentIdCardResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentIdCardResponse() when $default != null:
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
    TResult Function(_OcrDocumentIdCardResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentIdCardResponse():
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
    TResult? Function(_OcrDocumentIdCardResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentIdCardResponse() when $default != null:
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
            List<OcrDocumentImage> images)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentIdCardResponse() when $default != null:
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
            List<OcrDocumentImage> images)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentIdCardResponse():
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
            List<OcrDocumentImage> images)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentIdCardResponse() when $default != null:
        return $default(
            _that.version, _that.requestId, _that.timestamp, _that.images);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrDocumentIdCardResponse implements OcrDocumentIdCardResponse {
  const _OcrDocumentIdCardResponse(
      {required this.version,
      required this.requestId,
      required this.timestamp,
      required final List<OcrDocumentImage> images})
      : _images = images;
  factory _OcrDocumentIdCardResponse.fromJson(Map<String, dynamic> json) =>
      _$OcrDocumentIdCardResponseFromJson(json);

  @override
  final String version;
  @override
  final String requestId;
  @override
  final int timestamp;
  final List<OcrDocumentImage> _images;
  @override
  List<OcrDocumentImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// Create a copy of OcrDocumentIdCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrDocumentIdCardResponseCopyWith<_OcrDocumentIdCardResponse>
      get copyWith =>
          __$OcrDocumentIdCardResponseCopyWithImpl<_OcrDocumentIdCardResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrDocumentIdCardResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrDocumentIdCardResponse &&
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
    return 'OcrDocumentIdCardResponse(version: $version, requestId: $requestId, timestamp: $timestamp, images: $images)';
  }
}

/// @nodoc
abstract mixin class _$OcrDocumentIdCardResponseCopyWith<$Res>
    implements $OcrDocumentIdCardResponseCopyWith<$Res> {
  factory _$OcrDocumentIdCardResponseCopyWith(_OcrDocumentIdCardResponse value,
          $Res Function(_OcrDocumentIdCardResponse) _then) =
      __$OcrDocumentIdCardResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String version,
      String requestId,
      int timestamp,
      List<OcrDocumentImage> images});
}

/// @nodoc
class __$OcrDocumentIdCardResponseCopyWithImpl<$Res>
    implements _$OcrDocumentIdCardResponseCopyWith<$Res> {
  __$OcrDocumentIdCardResponseCopyWithImpl(this._self, this._then);

  final _OcrDocumentIdCardResponse _self;
  final $Res Function(_OcrDocumentIdCardResponse) _then;

  /// Create a copy of OcrDocumentIdCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
    Object? requestId = null,
    Object? timestamp = null,
    Object? images = null,
  }) {
    return _then(_OcrDocumentIdCardResponse(
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
              as List<OcrDocumentImage>,
    ));
  }
}

/// @nodoc
mixin _$OcrDocumentImage {
  String get uid;
  String get name;
  String get inferResult;
  String? get message;
  OcrValidationResult? get validationResult;
  OcrIdCard? get idCard;

  /// Create a copy of OcrDocumentImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrDocumentImageCopyWith<OcrDocumentImage> get copyWith =>
      _$OcrDocumentImageCopyWithImpl<OcrDocumentImage>(
          this as OcrDocumentImage, _$identity);

  /// Serializes this OcrDocumentImage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrDocumentImage &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inferResult, inferResult) ||
                other.inferResult == inferResult) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.validationResult, validationResult) ||
                other.validationResult == validationResult) &&
            (identical(other.idCard, idCard) || other.idCard == idCard));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, name, inferResult, message, validationResult, idCard);

  @override
  String toString() {
    return 'OcrDocumentImage(uid: $uid, name: $name, inferResult: $inferResult, message: $message, validationResult: $validationResult, idCard: $idCard)';
  }
}

/// @nodoc
abstract mixin class $OcrDocumentImageCopyWith<$Res> {
  factory $OcrDocumentImageCopyWith(
          OcrDocumentImage value, $Res Function(OcrDocumentImage) _then) =
      _$OcrDocumentImageCopyWithImpl;
  @useResult
  $Res call(
      {String uid,
      String name,
      String inferResult,
      String? message,
      OcrValidationResult? validationResult,
      OcrIdCard? idCard});

  $OcrValidationResultCopyWith<$Res>? get validationResult;
  $OcrIdCardCopyWith<$Res>? get idCard;
}

/// @nodoc
class _$OcrDocumentImageCopyWithImpl<$Res>
    implements $OcrDocumentImageCopyWith<$Res> {
  _$OcrDocumentImageCopyWithImpl(this._self, this._then);

  final OcrDocumentImage _self;
  final $Res Function(OcrDocumentImage) _then;

  /// Create a copy of OcrDocumentImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? inferResult = null,
    Object? message = freezed,
    Object? validationResult = freezed,
    Object? idCard = freezed,
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
      idCard: freezed == idCard
          ? _self.idCard
          : idCard // ignore: cast_nullable_to_non_nullable
              as OcrIdCard?,
    ));
  }

  /// Create a copy of OcrDocumentImage
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

  /// Create a copy of OcrDocumentImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrIdCardCopyWith<$Res>? get idCard {
    if (_self.idCard == null) {
      return null;
    }

    return $OcrIdCardCopyWith<$Res>(_self.idCard!, (value) {
      return _then(_self.copyWith(idCard: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OcrDocumentImage].
extension OcrDocumentImagePatterns on OcrDocumentImage {
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
    TResult Function(_OcrDocumentImage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentImage() when $default != null:
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
    TResult Function(_OcrDocumentImage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentImage():
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
    TResult? Function(_OcrDocumentImage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentImage() when $default != null:
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
            OcrIdCard? idCard)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentImage() when $default != null:
        return $default(_that.uid, _that.name, _that.inferResult, _that.message,
            _that.validationResult, _that.idCard);
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
            OcrIdCard? idCard)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentImage():
        return $default(_that.uid, _that.name, _that.inferResult, _that.message,
            _that.validationResult, _that.idCard);
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
            OcrIdCard? idCard)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrDocumentImage() when $default != null:
        return $default(_that.uid, _that.name, _that.inferResult, _that.message,
            _that.validationResult, _that.idCard);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrDocumentImage implements OcrDocumentImage {
  const _OcrDocumentImage(
      {required this.uid,
      required this.name,
      required this.inferResult,
      this.message,
      this.validationResult,
      this.idCard});
  factory _OcrDocumentImage.fromJson(Map<String, dynamic> json) =>
      _$OcrDocumentImageFromJson(json);

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
  final OcrIdCard? idCard;

  /// Create a copy of OcrDocumentImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrDocumentImageCopyWith<_OcrDocumentImage> get copyWith =>
      __$OcrDocumentImageCopyWithImpl<_OcrDocumentImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrDocumentImageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrDocumentImage &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inferResult, inferResult) ||
                other.inferResult == inferResult) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.validationResult, validationResult) ||
                other.validationResult == validationResult) &&
            (identical(other.idCard, idCard) || other.idCard == idCard));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, name, inferResult, message, validationResult, idCard);

  @override
  String toString() {
    return 'OcrDocumentImage(uid: $uid, name: $name, inferResult: $inferResult, message: $message, validationResult: $validationResult, idCard: $idCard)';
  }
}

/// @nodoc
abstract mixin class _$OcrDocumentImageCopyWith<$Res>
    implements $OcrDocumentImageCopyWith<$Res> {
  factory _$OcrDocumentImageCopyWith(
          _OcrDocumentImage value, $Res Function(_OcrDocumentImage) _then) =
      __$OcrDocumentImageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String inferResult,
      String? message,
      OcrValidationResult? validationResult,
      OcrIdCard? idCard});

  @override
  $OcrValidationResultCopyWith<$Res>? get validationResult;
  @override
  $OcrIdCardCopyWith<$Res>? get idCard;
}

/// @nodoc
class __$OcrDocumentImageCopyWithImpl<$Res>
    implements _$OcrDocumentImageCopyWith<$Res> {
  __$OcrDocumentImageCopyWithImpl(this._self, this._then);

  final _OcrDocumentImage _self;
  final $Res Function(_OcrDocumentImage) _then;

  /// Create a copy of OcrDocumentImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? inferResult = null,
    Object? message = freezed,
    Object? validationResult = freezed,
    Object? idCard = freezed,
  }) {
    return _then(_OcrDocumentImage(
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
      idCard: freezed == idCard
          ? _self.idCard
          : idCard // ignore: cast_nullable_to_non_nullable
              as OcrIdCard?,
    ));
  }

  /// Create a copy of OcrDocumentImage
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

  /// Create a copy of OcrDocumentImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrIdCardCopyWith<$Res>? get idCard {
    if (_self.idCard == null) {
      return null;
    }

    return $OcrIdCardCopyWith<$Res>(_self.idCard!, (value) {
      return _then(_self.copyWith(idCard: value));
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
mixin _$OcrIdCard {
  OcrIdCardMeta? get meta;
  OcrIdCardResult? get result;

  /// Create a copy of OcrIdCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrIdCardCopyWith<OcrIdCard> get copyWith =>
      _$OcrIdCardCopyWithImpl<OcrIdCard>(this as OcrIdCard, _$identity);

  /// Serializes this OcrIdCard to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrIdCard &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, meta, result);

  @override
  String toString() {
    return 'OcrIdCard(meta: $meta, result: $result)';
  }
}

/// @nodoc
abstract mixin class $OcrIdCardCopyWith<$Res> {
  factory $OcrIdCardCopyWith(OcrIdCard value, $Res Function(OcrIdCard) _then) =
      _$OcrIdCardCopyWithImpl;
  @useResult
  $Res call({OcrIdCardMeta? meta, OcrIdCardResult? result});

  $OcrIdCardMetaCopyWith<$Res>? get meta;
  $OcrIdCardResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$OcrIdCardCopyWithImpl<$Res> implements $OcrIdCardCopyWith<$Res> {
  _$OcrIdCardCopyWithImpl(this._self, this._then);

  final OcrIdCard _self;
  final $Res Function(OcrIdCard) _then;

  /// Create a copy of OcrIdCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? result = freezed,
  }) {
    return _then(_self.copyWith(
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as OcrIdCardMeta?,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as OcrIdCardResult?,
    ));
  }

  /// Create a copy of OcrIdCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrIdCardMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $OcrIdCardMetaCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }

  /// Create a copy of OcrIdCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrIdCardResultCopyWith<$Res>? get result {
    if (_self.result == null) {
      return null;
    }

    return $OcrIdCardResultCopyWith<$Res>(_self.result!, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OcrIdCard].
extension OcrIdCardPatterns on OcrIdCard {
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
    TResult Function(_OcrIdCard value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdCard() when $default != null:
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
    TResult Function(_OcrIdCard value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCard():
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
    TResult? Function(_OcrIdCard value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCard() when $default != null:
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
    TResult Function(OcrIdCardMeta? meta, OcrIdCardResult? result)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdCard() when $default != null:
        return $default(_that.meta, _that.result);
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
    TResult Function(OcrIdCardMeta? meta, OcrIdCardResult? result) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCard():
        return $default(_that.meta, _that.result);
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
    TResult? Function(OcrIdCardMeta? meta, OcrIdCardResult? result)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCard() when $default != null:
        return $default(_that.meta, _that.result);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrIdCard implements OcrIdCard {
  const _OcrIdCard({this.meta, this.result});
  factory _OcrIdCard.fromJson(Map<String, dynamic> json) =>
      _$OcrIdCardFromJson(json);

  @override
  final OcrIdCardMeta? meta;
  @override
  final OcrIdCardResult? result;

  /// Create a copy of OcrIdCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrIdCardCopyWith<_OcrIdCard> get copyWith =>
      __$OcrIdCardCopyWithImpl<_OcrIdCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrIdCardToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrIdCard &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, meta, result);

  @override
  String toString() {
    return 'OcrIdCard(meta: $meta, result: $result)';
  }
}

/// @nodoc
abstract mixin class _$OcrIdCardCopyWith<$Res>
    implements $OcrIdCardCopyWith<$Res> {
  factory _$OcrIdCardCopyWith(
          _OcrIdCard value, $Res Function(_OcrIdCard) _then) =
      __$OcrIdCardCopyWithImpl;
  @override
  @useResult
  $Res call({OcrIdCardMeta? meta, OcrIdCardResult? result});

  @override
  $OcrIdCardMetaCopyWith<$Res>? get meta;
  @override
  $OcrIdCardResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$OcrIdCardCopyWithImpl<$Res> implements _$OcrIdCardCopyWith<$Res> {
  __$OcrIdCardCopyWithImpl(this._self, this._then);

  final _OcrIdCard _self;
  final $Res Function(_OcrIdCard) _then;

  /// Create a copy of OcrIdCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? meta = freezed,
    Object? result = freezed,
  }) {
    return _then(_OcrIdCard(
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as OcrIdCardMeta?,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as OcrIdCardResult?,
    ));
  }

  /// Create a copy of OcrIdCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrIdCardMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $OcrIdCardMetaCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }

  /// Create a copy of OcrIdCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrIdCardResultCopyWith<$Res>? get result {
    if (_self.result == null) {
      return null;
    }

    return $OcrIdCardResultCopyWith<$Res>(_self.result!, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

/// @nodoc
mixin _$OcrIdCardMeta {
  String? get estimatedLanguage;

  /// Create a copy of OcrIdCardMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrIdCardMetaCopyWith<OcrIdCardMeta> get copyWith =>
      _$OcrIdCardMetaCopyWithImpl<OcrIdCardMeta>(
          this as OcrIdCardMeta, _$identity);

  /// Serializes this OcrIdCardMeta to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrIdCardMeta &&
            (identical(other.estimatedLanguage, estimatedLanguage) ||
                other.estimatedLanguage == estimatedLanguage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, estimatedLanguage);

  @override
  String toString() {
    return 'OcrIdCardMeta(estimatedLanguage: $estimatedLanguage)';
  }
}

/// @nodoc
abstract mixin class $OcrIdCardMetaCopyWith<$Res> {
  factory $OcrIdCardMetaCopyWith(
          OcrIdCardMeta value, $Res Function(OcrIdCardMeta) _then) =
      _$OcrIdCardMetaCopyWithImpl;
  @useResult
  $Res call({String? estimatedLanguage});
}

/// @nodoc
class _$OcrIdCardMetaCopyWithImpl<$Res>
    implements $OcrIdCardMetaCopyWith<$Res> {
  _$OcrIdCardMetaCopyWithImpl(this._self, this._then);

  final OcrIdCardMeta _self;
  final $Res Function(OcrIdCardMeta) _then;

  /// Create a copy of OcrIdCardMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estimatedLanguage = freezed,
  }) {
    return _then(_self.copyWith(
      estimatedLanguage: freezed == estimatedLanguage
          ? _self.estimatedLanguage
          : estimatedLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OcrIdCardMeta].
extension OcrIdCardMetaPatterns on OcrIdCardMeta {
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
    TResult Function(_OcrIdCardMeta value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardMeta() when $default != null:
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
    TResult Function(_OcrIdCardMeta value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardMeta():
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
    TResult? Function(_OcrIdCardMeta value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardMeta() when $default != null:
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
    TResult Function(String? estimatedLanguage)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardMeta() when $default != null:
        return $default(_that.estimatedLanguage);
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
    TResult Function(String? estimatedLanguage) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardMeta():
        return $default(_that.estimatedLanguage);
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
    TResult? Function(String? estimatedLanguage)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardMeta() when $default != null:
        return $default(_that.estimatedLanguage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrIdCardMeta implements OcrIdCardMeta {
  const _OcrIdCardMeta({this.estimatedLanguage});
  factory _OcrIdCardMeta.fromJson(Map<String, dynamic> json) =>
      _$OcrIdCardMetaFromJson(json);

  @override
  final String? estimatedLanguage;

  /// Create a copy of OcrIdCardMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrIdCardMetaCopyWith<_OcrIdCardMeta> get copyWith =>
      __$OcrIdCardMetaCopyWithImpl<_OcrIdCardMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrIdCardMetaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrIdCardMeta &&
            (identical(other.estimatedLanguage, estimatedLanguage) ||
                other.estimatedLanguage == estimatedLanguage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, estimatedLanguage);

  @override
  String toString() {
    return 'OcrIdCardMeta(estimatedLanguage: $estimatedLanguage)';
  }
}

/// @nodoc
abstract mixin class _$OcrIdCardMetaCopyWith<$Res>
    implements $OcrIdCardMetaCopyWith<$Res> {
  factory _$OcrIdCardMetaCopyWith(
          _OcrIdCardMeta value, $Res Function(_OcrIdCardMeta) _then) =
      __$OcrIdCardMetaCopyWithImpl;
  @override
  @useResult
  $Res call({String? estimatedLanguage});
}

/// @nodoc
class __$OcrIdCardMetaCopyWithImpl<$Res>
    implements _$OcrIdCardMetaCopyWith<$Res> {
  __$OcrIdCardMetaCopyWithImpl(this._self, this._then);

  final _OcrIdCardMeta _self;
  final $Res Function(_OcrIdCardMeta) _then;

  /// Create a copy of OcrIdCardMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? estimatedLanguage = freezed,
  }) {
    return _then(_OcrIdCardMeta(
      estimatedLanguage: freezed == estimatedLanguage
          ? _self.estimatedLanguage
          : estimatedLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$OcrIdCardResult {
  bool? get isConfident;
  OcrIdCardIC? get ic;
  OcrIdCardDL? get dl;

  /// Create a copy of OcrIdCardResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrIdCardResultCopyWith<OcrIdCardResult> get copyWith =>
      _$OcrIdCardResultCopyWithImpl<OcrIdCardResult>(
          this as OcrIdCardResult, _$identity);

  /// Serializes this OcrIdCardResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrIdCardResult &&
            (identical(other.isConfident, isConfident) ||
                other.isConfident == isConfident) &&
            (identical(other.ic, ic) || other.ic == ic) &&
            (identical(other.dl, dl) || other.dl == dl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isConfident, ic, dl);

  @override
  String toString() {
    return 'OcrIdCardResult(isConfident: $isConfident, ic: $ic, dl: $dl)';
  }
}

/// @nodoc
abstract mixin class $OcrIdCardResultCopyWith<$Res> {
  factory $OcrIdCardResultCopyWith(
          OcrIdCardResult value, $Res Function(OcrIdCardResult) _then) =
      _$OcrIdCardResultCopyWithImpl;
  @useResult
  $Res call({bool? isConfident, OcrIdCardIC? ic, OcrIdCardDL? dl});

  $OcrIdCardICCopyWith<$Res>? get ic;
  $OcrIdCardDLCopyWith<$Res>? get dl;
}

/// @nodoc
class _$OcrIdCardResultCopyWithImpl<$Res>
    implements $OcrIdCardResultCopyWith<$Res> {
  _$OcrIdCardResultCopyWithImpl(this._self, this._then);

  final OcrIdCardResult _self;
  final $Res Function(OcrIdCardResult) _then;

  /// Create a copy of OcrIdCardResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConfident = freezed,
    Object? ic = freezed,
    Object? dl = freezed,
  }) {
    return _then(_self.copyWith(
      isConfident: freezed == isConfident
          ? _self.isConfident
          : isConfident // ignore: cast_nullable_to_non_nullable
              as bool?,
      ic: freezed == ic
          ? _self.ic
          : ic // ignore: cast_nullable_to_non_nullable
              as OcrIdCardIC?,
      dl: freezed == dl
          ? _self.dl
          : dl // ignore: cast_nullable_to_non_nullable
              as OcrIdCardDL?,
    ));
  }

  /// Create a copy of OcrIdCardResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrIdCardICCopyWith<$Res>? get ic {
    if (_self.ic == null) {
      return null;
    }

    return $OcrIdCardICCopyWith<$Res>(_self.ic!, (value) {
      return _then(_self.copyWith(ic: value));
    });
  }

  /// Create a copy of OcrIdCardResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrIdCardDLCopyWith<$Res>? get dl {
    if (_self.dl == null) {
      return null;
    }

    return $OcrIdCardDLCopyWith<$Res>(_self.dl!, (value) {
      return _then(_self.copyWith(dl: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OcrIdCardResult].
extension OcrIdCardResultPatterns on OcrIdCardResult {
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
    TResult Function(_OcrIdCardResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardResult() when $default != null:
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
    TResult Function(_OcrIdCardResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardResult():
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
    TResult? Function(_OcrIdCardResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardResult() when $default != null:
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
    TResult Function(bool? isConfident, OcrIdCardIC? ic, OcrIdCardDL? dl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardResult() when $default != null:
        return $default(_that.isConfident, _that.ic, _that.dl);
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
    TResult Function(bool? isConfident, OcrIdCardIC? ic, OcrIdCardDL? dl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardResult():
        return $default(_that.isConfident, _that.ic, _that.dl);
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
    TResult? Function(bool? isConfident, OcrIdCardIC? ic, OcrIdCardDL? dl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardResult() when $default != null:
        return $default(_that.isConfident, _that.ic, _that.dl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrIdCardResult implements OcrIdCardResult {
  const _OcrIdCardResult({this.isConfident, this.ic, this.dl});
  factory _OcrIdCardResult.fromJson(Map<String, dynamic> json) =>
      _$OcrIdCardResultFromJson(json);

  @override
  final bool? isConfident;
  @override
  final OcrIdCardIC? ic;
  @override
  final OcrIdCardDL? dl;

  /// Create a copy of OcrIdCardResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrIdCardResultCopyWith<_OcrIdCardResult> get copyWith =>
      __$OcrIdCardResultCopyWithImpl<_OcrIdCardResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrIdCardResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrIdCardResult &&
            (identical(other.isConfident, isConfident) ||
                other.isConfident == isConfident) &&
            (identical(other.ic, ic) || other.ic == ic) &&
            (identical(other.dl, dl) || other.dl == dl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isConfident, ic, dl);

  @override
  String toString() {
    return 'OcrIdCardResult(isConfident: $isConfident, ic: $ic, dl: $dl)';
  }
}

/// @nodoc
abstract mixin class _$OcrIdCardResultCopyWith<$Res>
    implements $OcrIdCardResultCopyWith<$Res> {
  factory _$OcrIdCardResultCopyWith(
          _OcrIdCardResult value, $Res Function(_OcrIdCardResult) _then) =
      __$OcrIdCardResultCopyWithImpl;
  @override
  @useResult
  $Res call({bool? isConfident, OcrIdCardIC? ic, OcrIdCardDL? dl});

  @override
  $OcrIdCardICCopyWith<$Res>? get ic;
  @override
  $OcrIdCardDLCopyWith<$Res>? get dl;
}

/// @nodoc
class __$OcrIdCardResultCopyWithImpl<$Res>
    implements _$OcrIdCardResultCopyWith<$Res> {
  __$OcrIdCardResultCopyWithImpl(this._self, this._then);

  final _OcrIdCardResult _self;
  final $Res Function(_OcrIdCardResult) _then;

  /// Create a copy of OcrIdCardResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isConfident = freezed,
    Object? ic = freezed,
    Object? dl = freezed,
  }) {
    return _then(_OcrIdCardResult(
      isConfident: freezed == isConfident
          ? _self.isConfident
          : isConfident // ignore: cast_nullable_to_non_nullable
              as bool?,
      ic: freezed == ic
          ? _self.ic
          : ic // ignore: cast_nullable_to_non_nullable
              as OcrIdCardIC?,
      dl: freezed == dl
          ? _self.dl
          : dl // ignore: cast_nullable_to_non_nullable
              as OcrIdCardDL?,
    ));
  }

  /// Create a copy of OcrIdCardResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrIdCardICCopyWith<$Res>? get ic {
    if (_self.ic == null) {
      return null;
    }

    return $OcrIdCardICCopyWith<$Res>(_self.ic!, (value) {
      return _then(_self.copyWith(ic: value));
    });
  }

  /// Create a copy of OcrIdCardResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrIdCardDLCopyWith<$Res>? get dl {
    if (_self.dl == null) {
      return null;
    }

    return $OcrIdCardDLCopyWith<$Res>(_self.dl!, (value) {
      return _then(_self.copyWith(dl: value));
    });
  }
}

/// @nodoc
mixin _$OcrIdCardIC {
  List<OcrIdCardField>? get name;
  List<OcrIdCardField>? get personalNum;
  List<OcrIdCardField>? get address;
  List<OcrIdCardField>? get issueDate;
  List<OcrIdCardField>? get authority;

  /// Create a copy of OcrIdCardIC
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrIdCardICCopyWith<OcrIdCardIC> get copyWith =>
      _$OcrIdCardICCopyWithImpl<OcrIdCardIC>(this as OcrIdCardIC, _$identity);

  /// Serializes this OcrIdCardIC to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrIdCardIC &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.personalNum, personalNum) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.issueDate, issueDate) &&
            const DeepCollectionEquality().equals(other.authority, authority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(personalNum),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(issueDate),
      const DeepCollectionEquality().hash(authority));

  @override
  String toString() {
    return 'OcrIdCardIC(name: $name, personalNum: $personalNum, address: $address, issueDate: $issueDate, authority: $authority)';
  }
}

/// @nodoc
abstract mixin class $OcrIdCardICCopyWith<$Res> {
  factory $OcrIdCardICCopyWith(
          OcrIdCardIC value, $Res Function(OcrIdCardIC) _then) =
      _$OcrIdCardICCopyWithImpl;
  @useResult
  $Res call(
      {List<OcrIdCardField>? name,
      List<OcrIdCardField>? personalNum,
      List<OcrIdCardField>? address,
      List<OcrIdCardField>? issueDate,
      List<OcrIdCardField>? authority});
}

/// @nodoc
class _$OcrIdCardICCopyWithImpl<$Res> implements $OcrIdCardICCopyWith<$Res> {
  _$OcrIdCardICCopyWithImpl(this._self, this._then);

  final OcrIdCardIC _self;
  final $Res Function(OcrIdCardIC) _then;

  /// Create a copy of OcrIdCardIC
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? personalNum = freezed,
    Object? address = freezed,
    Object? issueDate = freezed,
    Object? authority = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      personalNum: freezed == personalNum
          ? _self.personalNum
          : personalNum // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      issueDate: freezed == issueDate
          ? _self.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      authority: freezed == authority
          ? _self.authority
          : authority // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OcrIdCardIC].
extension OcrIdCardICPatterns on OcrIdCardIC {
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
    TResult Function(_OcrIdCardIC value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardIC() when $default != null:
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
    TResult Function(_OcrIdCardIC value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardIC():
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
    TResult? Function(_OcrIdCardIC value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardIC() when $default != null:
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
            List<OcrIdCardField>? name,
            List<OcrIdCardField>? personalNum,
            List<OcrIdCardField>? address,
            List<OcrIdCardField>? issueDate,
            List<OcrIdCardField>? authority)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardIC() when $default != null:
        return $default(_that.name, _that.personalNum, _that.address,
            _that.issueDate, _that.authority);
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
            List<OcrIdCardField>? name,
            List<OcrIdCardField>? personalNum,
            List<OcrIdCardField>? address,
            List<OcrIdCardField>? issueDate,
            List<OcrIdCardField>? authority)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardIC():
        return $default(_that.name, _that.personalNum, _that.address,
            _that.issueDate, _that.authority);
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
            List<OcrIdCardField>? name,
            List<OcrIdCardField>? personalNum,
            List<OcrIdCardField>? address,
            List<OcrIdCardField>? issueDate,
            List<OcrIdCardField>? authority)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardIC() when $default != null:
        return $default(_that.name, _that.personalNum, _that.address,
            _that.issueDate, _that.authority);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrIdCardIC implements OcrIdCardIC {
  const _OcrIdCardIC(
      {final List<OcrIdCardField>? name,
      final List<OcrIdCardField>? personalNum,
      final List<OcrIdCardField>? address,
      final List<OcrIdCardField>? issueDate,
      final List<OcrIdCardField>? authority})
      : _name = name,
        _personalNum = personalNum,
        _address = address,
        _issueDate = issueDate,
        _authority = authority;
  factory _OcrIdCardIC.fromJson(Map<String, dynamic> json) =>
      _$OcrIdCardICFromJson(json);

  final List<OcrIdCardField>? _name;
  @override
  List<OcrIdCardField>? get name {
    final value = _name;
    if (value == null) return null;
    if (_name is EqualUnmodifiableListView) return _name;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<OcrIdCardField>? _personalNum;
  @override
  List<OcrIdCardField>? get personalNum {
    final value = _personalNum;
    if (value == null) return null;
    if (_personalNum is EqualUnmodifiableListView) return _personalNum;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<OcrIdCardField>? _address;
  @override
  List<OcrIdCardField>? get address {
    final value = _address;
    if (value == null) return null;
    if (_address is EqualUnmodifiableListView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<OcrIdCardField>? _issueDate;
  @override
  List<OcrIdCardField>? get issueDate {
    final value = _issueDate;
    if (value == null) return null;
    if (_issueDate is EqualUnmodifiableListView) return _issueDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<OcrIdCardField>? _authority;
  @override
  List<OcrIdCardField>? get authority {
    final value = _authority;
    if (value == null) return null;
    if (_authority is EqualUnmodifiableListView) return _authority;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of OcrIdCardIC
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrIdCardICCopyWith<_OcrIdCardIC> get copyWith =>
      __$OcrIdCardICCopyWithImpl<_OcrIdCardIC>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrIdCardICToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrIdCardIC &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            const DeepCollectionEquality()
                .equals(other._personalNum, _personalNum) &&
            const DeepCollectionEquality().equals(other._address, _address) &&
            const DeepCollectionEquality()
                .equals(other._issueDate, _issueDate) &&
            const DeepCollectionEquality()
                .equals(other._authority, _authority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_name),
      const DeepCollectionEquality().hash(_personalNum),
      const DeepCollectionEquality().hash(_address),
      const DeepCollectionEquality().hash(_issueDate),
      const DeepCollectionEquality().hash(_authority));

  @override
  String toString() {
    return 'OcrIdCardIC(name: $name, personalNum: $personalNum, address: $address, issueDate: $issueDate, authority: $authority)';
  }
}

/// @nodoc
abstract mixin class _$OcrIdCardICCopyWith<$Res>
    implements $OcrIdCardICCopyWith<$Res> {
  factory _$OcrIdCardICCopyWith(
          _OcrIdCardIC value, $Res Function(_OcrIdCardIC) _then) =
      __$OcrIdCardICCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<OcrIdCardField>? name,
      List<OcrIdCardField>? personalNum,
      List<OcrIdCardField>? address,
      List<OcrIdCardField>? issueDate,
      List<OcrIdCardField>? authority});
}

/// @nodoc
class __$OcrIdCardICCopyWithImpl<$Res> implements _$OcrIdCardICCopyWith<$Res> {
  __$OcrIdCardICCopyWithImpl(this._self, this._then);

  final _OcrIdCardIC _self;
  final $Res Function(_OcrIdCardIC) _then;

  /// Create a copy of OcrIdCardIC
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? personalNum = freezed,
    Object? address = freezed,
    Object? issueDate = freezed,
    Object? authority = freezed,
  }) {
    return _then(_OcrIdCardIC(
      name: freezed == name
          ? _self._name
          : name // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      personalNum: freezed == personalNum
          ? _self._personalNum
          : personalNum // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      address: freezed == address
          ? _self._address
          : address // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      issueDate: freezed == issueDate
          ? _self._issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      authority: freezed == authority
          ? _self._authority
          : authority // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
    ));
  }
}

/// @nodoc
mixin _$OcrIdCardDL {
  List<OcrIdCardField>? get type; // 1종대형, 2종보통...
  List<OcrIdCardField>? get num; // 21-19-174133-01
  List<OcrIdCardField>? get name; // 홍길순
  List<OcrIdCardField>? get personalNum; // 000829-2134567
  List<OcrIdCardField>? get address; // 서울시 서대문구 ...
  List<OcrIdCardField>? get renewStartDate; // 2029.01.01
  List<OcrIdCardField>? get renewEndDate; // 2029.12.31
  List<OcrIdCardField>? get condition; // A
  List<OcrIdCardField>? get code; // 8H1X3Y
  List<OcrIdCardField>? get organDonation; // 장기 조직기증
  List<OcrIdCardField>? get issueDate; // 2019.09.10
  List<OcrIdCardField>? get authority;

  /// Create a copy of OcrIdCardDL
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrIdCardDLCopyWith<OcrIdCardDL> get copyWith =>
      _$OcrIdCardDLCopyWithImpl<OcrIdCardDL>(this as OcrIdCardDL, _$identity);

  /// Serializes this OcrIdCardDL to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrIdCardDL &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.num, num) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.personalNum, personalNum) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.renewStartDate, renewStartDate) &&
            const DeepCollectionEquality()
                .equals(other.renewEndDate, renewEndDate) &&
            const DeepCollectionEquality().equals(other.condition, condition) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.organDonation, organDonation) &&
            const DeepCollectionEquality().equals(other.issueDate, issueDate) &&
            const DeepCollectionEquality().equals(other.authority, authority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(num),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(personalNum),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(renewStartDate),
      const DeepCollectionEquality().hash(renewEndDate),
      const DeepCollectionEquality().hash(condition),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(organDonation),
      const DeepCollectionEquality().hash(issueDate),
      const DeepCollectionEquality().hash(authority));

  @override
  String toString() {
    return 'OcrIdCardDL(type: $type, num: $num, name: $name, personalNum: $personalNum, address: $address, renewStartDate: $renewStartDate, renewEndDate: $renewEndDate, condition: $condition, code: $code, organDonation: $organDonation, issueDate: $issueDate, authority: $authority)';
  }
}

/// @nodoc
abstract mixin class $OcrIdCardDLCopyWith<$Res> {
  factory $OcrIdCardDLCopyWith(
          OcrIdCardDL value, $Res Function(OcrIdCardDL) _then) =
      _$OcrIdCardDLCopyWithImpl;
  @useResult
  $Res call(
      {List<OcrIdCardField>? type,
      List<OcrIdCardField>? num,
      List<OcrIdCardField>? name,
      List<OcrIdCardField>? personalNum,
      List<OcrIdCardField>? address,
      List<OcrIdCardField>? renewStartDate,
      List<OcrIdCardField>? renewEndDate,
      List<OcrIdCardField>? condition,
      List<OcrIdCardField>? code,
      List<OcrIdCardField>? organDonation,
      List<OcrIdCardField>? issueDate,
      List<OcrIdCardField>? authority});
}

/// @nodoc
class _$OcrIdCardDLCopyWithImpl<$Res> implements $OcrIdCardDLCopyWith<$Res> {
  _$OcrIdCardDLCopyWithImpl(this._self, this._then);

  final OcrIdCardDL _self;
  final $Res Function(OcrIdCardDL) _then;

  /// Create a copy of OcrIdCardDL
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? num = freezed,
    Object? name = freezed,
    Object? personalNum = freezed,
    Object? address = freezed,
    Object? renewStartDate = freezed,
    Object? renewEndDate = freezed,
    Object? condition = freezed,
    Object? code = freezed,
    Object? organDonation = freezed,
    Object? issueDate = freezed,
    Object? authority = freezed,
  }) {
    return _then(_self.copyWith(
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      num: freezed == num
          ? _self.num
          : num // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      personalNum: freezed == personalNum
          ? _self.personalNum
          : personalNum // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      renewStartDate: freezed == renewStartDate
          ? _self.renewStartDate
          : renewStartDate // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      renewEndDate: freezed == renewEndDate
          ? _self.renewEndDate
          : renewEndDate // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      condition: freezed == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      organDonation: freezed == organDonation
          ? _self.organDonation
          : organDonation // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      issueDate: freezed == issueDate
          ? _self.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      authority: freezed == authority
          ? _self.authority
          : authority // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OcrIdCardDL].
extension OcrIdCardDLPatterns on OcrIdCardDL {
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
    TResult Function(_OcrIdCardDL value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardDL() when $default != null:
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
    TResult Function(_OcrIdCardDL value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardDL():
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
    TResult? Function(_OcrIdCardDL value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardDL() when $default != null:
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
            List<OcrIdCardField>? type,
            List<OcrIdCardField>? num,
            List<OcrIdCardField>? name,
            List<OcrIdCardField>? personalNum,
            List<OcrIdCardField>? address,
            List<OcrIdCardField>? renewStartDate,
            List<OcrIdCardField>? renewEndDate,
            List<OcrIdCardField>? condition,
            List<OcrIdCardField>? code,
            List<OcrIdCardField>? organDonation,
            List<OcrIdCardField>? issueDate,
            List<OcrIdCardField>? authority)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardDL() when $default != null:
        return $default(
            _that.type,
            _that.num,
            _that.name,
            _that.personalNum,
            _that.address,
            _that.renewStartDate,
            _that.renewEndDate,
            _that.condition,
            _that.code,
            _that.organDonation,
            _that.issueDate,
            _that.authority);
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
            List<OcrIdCardField>? type,
            List<OcrIdCardField>? num,
            List<OcrIdCardField>? name,
            List<OcrIdCardField>? personalNum,
            List<OcrIdCardField>? address,
            List<OcrIdCardField>? renewStartDate,
            List<OcrIdCardField>? renewEndDate,
            List<OcrIdCardField>? condition,
            List<OcrIdCardField>? code,
            List<OcrIdCardField>? organDonation,
            List<OcrIdCardField>? issueDate,
            List<OcrIdCardField>? authority)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardDL():
        return $default(
            _that.type,
            _that.num,
            _that.name,
            _that.personalNum,
            _that.address,
            _that.renewStartDate,
            _that.renewEndDate,
            _that.condition,
            _that.code,
            _that.organDonation,
            _that.issueDate,
            _that.authority);
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
            List<OcrIdCardField>? type,
            List<OcrIdCardField>? num,
            List<OcrIdCardField>? name,
            List<OcrIdCardField>? personalNum,
            List<OcrIdCardField>? address,
            List<OcrIdCardField>? renewStartDate,
            List<OcrIdCardField>? renewEndDate,
            List<OcrIdCardField>? condition,
            List<OcrIdCardField>? code,
            List<OcrIdCardField>? organDonation,
            List<OcrIdCardField>? issueDate,
            List<OcrIdCardField>? authority)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardDL() when $default != null:
        return $default(
            _that.type,
            _that.num,
            _that.name,
            _that.personalNum,
            _that.address,
            _that.renewStartDate,
            _that.renewEndDate,
            _that.condition,
            _that.code,
            _that.organDonation,
            _that.issueDate,
            _that.authority);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrIdCardDL implements OcrIdCardDL {
  const _OcrIdCardDL(
      {final List<OcrIdCardField>? type,
      final List<OcrIdCardField>? num,
      final List<OcrIdCardField>? name,
      final List<OcrIdCardField>? personalNum,
      final List<OcrIdCardField>? address,
      final List<OcrIdCardField>? renewStartDate,
      final List<OcrIdCardField>? renewEndDate,
      final List<OcrIdCardField>? condition,
      final List<OcrIdCardField>? code,
      final List<OcrIdCardField>? organDonation,
      final List<OcrIdCardField>? issueDate,
      final List<OcrIdCardField>? authority})
      : _type = type,
        _num = num,
        _name = name,
        _personalNum = personalNum,
        _address = address,
        _renewStartDate = renewStartDate,
        _renewEndDate = renewEndDate,
        _condition = condition,
        _code = code,
        _organDonation = organDonation,
        _issueDate = issueDate,
        _authority = authority;
  factory _OcrIdCardDL.fromJson(Map<String, dynamic> json) =>
      _$OcrIdCardDLFromJson(json);

  final List<OcrIdCardField>? _type;
  @override
  List<OcrIdCardField>? get type {
    final value = _type;
    if (value == null) return null;
    if (_type is EqualUnmodifiableListView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 1종대형, 2종보통...
  final List<OcrIdCardField>? _num;
// 1종대형, 2종보통...
  @override
  List<OcrIdCardField>? get num {
    final value = _num;
    if (value == null) return null;
    if (_num is EqualUnmodifiableListView) return _num;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 21-19-174133-01
  final List<OcrIdCardField>? _name;
// 21-19-174133-01
  @override
  List<OcrIdCardField>? get name {
    final value = _name;
    if (value == null) return null;
    if (_name is EqualUnmodifiableListView) return _name;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 홍길순
  final List<OcrIdCardField>? _personalNum;
// 홍길순
  @override
  List<OcrIdCardField>? get personalNum {
    final value = _personalNum;
    if (value == null) return null;
    if (_personalNum is EqualUnmodifiableListView) return _personalNum;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 000829-2134567
  final List<OcrIdCardField>? _address;
// 000829-2134567
  @override
  List<OcrIdCardField>? get address {
    final value = _address;
    if (value == null) return null;
    if (_address is EqualUnmodifiableListView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 서울시 서대문구 ...
  final List<OcrIdCardField>? _renewStartDate;
// 서울시 서대문구 ...
  @override
  List<OcrIdCardField>? get renewStartDate {
    final value = _renewStartDate;
    if (value == null) return null;
    if (_renewStartDate is EqualUnmodifiableListView) return _renewStartDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 2029.01.01
  final List<OcrIdCardField>? _renewEndDate;
// 2029.01.01
  @override
  List<OcrIdCardField>? get renewEndDate {
    final value = _renewEndDate;
    if (value == null) return null;
    if (_renewEndDate is EqualUnmodifiableListView) return _renewEndDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 2029.12.31
  final List<OcrIdCardField>? _condition;
// 2029.12.31
  @override
  List<OcrIdCardField>? get condition {
    final value = _condition;
    if (value == null) return null;
    if (_condition is EqualUnmodifiableListView) return _condition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// A
  final List<OcrIdCardField>? _code;
// A
  @override
  List<OcrIdCardField>? get code {
    final value = _code;
    if (value == null) return null;
    if (_code is EqualUnmodifiableListView) return _code;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 8H1X3Y
  final List<OcrIdCardField>? _organDonation;
// 8H1X3Y
  @override
  List<OcrIdCardField>? get organDonation {
    final value = _organDonation;
    if (value == null) return null;
    if (_organDonation is EqualUnmodifiableListView) return _organDonation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 장기 조직기증
  final List<OcrIdCardField>? _issueDate;
// 장기 조직기증
  @override
  List<OcrIdCardField>? get issueDate {
    final value = _issueDate;
    if (value == null) return null;
    if (_issueDate is EqualUnmodifiableListView) return _issueDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 2019.09.10
  final List<OcrIdCardField>? _authority;
// 2019.09.10
  @override
  List<OcrIdCardField>? get authority {
    final value = _authority;
    if (value == null) return null;
    if (_authority is EqualUnmodifiableListView) return _authority;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of OcrIdCardDL
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrIdCardDLCopyWith<_OcrIdCardDL> get copyWith =>
      __$OcrIdCardDLCopyWithImpl<_OcrIdCardDL>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrIdCardDLToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrIdCardDL &&
            const DeepCollectionEquality().equals(other._type, _type) &&
            const DeepCollectionEquality().equals(other._num, _num) &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            const DeepCollectionEquality()
                .equals(other._personalNum, _personalNum) &&
            const DeepCollectionEquality().equals(other._address, _address) &&
            const DeepCollectionEquality()
                .equals(other._renewStartDate, _renewStartDate) &&
            const DeepCollectionEquality()
                .equals(other._renewEndDate, _renewEndDate) &&
            const DeepCollectionEquality()
                .equals(other._condition, _condition) &&
            const DeepCollectionEquality().equals(other._code, _code) &&
            const DeepCollectionEquality()
                .equals(other._organDonation, _organDonation) &&
            const DeepCollectionEquality()
                .equals(other._issueDate, _issueDate) &&
            const DeepCollectionEquality()
                .equals(other._authority, _authority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_type),
      const DeepCollectionEquality().hash(_num),
      const DeepCollectionEquality().hash(_name),
      const DeepCollectionEquality().hash(_personalNum),
      const DeepCollectionEquality().hash(_address),
      const DeepCollectionEquality().hash(_renewStartDate),
      const DeepCollectionEquality().hash(_renewEndDate),
      const DeepCollectionEquality().hash(_condition),
      const DeepCollectionEquality().hash(_code),
      const DeepCollectionEquality().hash(_organDonation),
      const DeepCollectionEquality().hash(_issueDate),
      const DeepCollectionEquality().hash(_authority));

  @override
  String toString() {
    return 'OcrIdCardDL(type: $type, num: $num, name: $name, personalNum: $personalNum, address: $address, renewStartDate: $renewStartDate, renewEndDate: $renewEndDate, condition: $condition, code: $code, organDonation: $organDonation, issueDate: $issueDate, authority: $authority)';
  }
}

/// @nodoc
abstract mixin class _$OcrIdCardDLCopyWith<$Res>
    implements $OcrIdCardDLCopyWith<$Res> {
  factory _$OcrIdCardDLCopyWith(
          _OcrIdCardDL value, $Res Function(_OcrIdCardDL) _then) =
      __$OcrIdCardDLCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<OcrIdCardField>? type,
      List<OcrIdCardField>? num,
      List<OcrIdCardField>? name,
      List<OcrIdCardField>? personalNum,
      List<OcrIdCardField>? address,
      List<OcrIdCardField>? renewStartDate,
      List<OcrIdCardField>? renewEndDate,
      List<OcrIdCardField>? condition,
      List<OcrIdCardField>? code,
      List<OcrIdCardField>? organDonation,
      List<OcrIdCardField>? issueDate,
      List<OcrIdCardField>? authority});
}

/// @nodoc
class __$OcrIdCardDLCopyWithImpl<$Res> implements _$OcrIdCardDLCopyWith<$Res> {
  __$OcrIdCardDLCopyWithImpl(this._self, this._then);

  final _OcrIdCardDL _self;
  final $Res Function(_OcrIdCardDL) _then;

  /// Create a copy of OcrIdCardDL
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = freezed,
    Object? num = freezed,
    Object? name = freezed,
    Object? personalNum = freezed,
    Object? address = freezed,
    Object? renewStartDate = freezed,
    Object? renewEndDate = freezed,
    Object? condition = freezed,
    Object? code = freezed,
    Object? organDonation = freezed,
    Object? issueDate = freezed,
    Object? authority = freezed,
  }) {
    return _then(_OcrIdCardDL(
      type: freezed == type
          ? _self._type
          : type // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      num: freezed == num
          ? _self._num
          : num // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      name: freezed == name
          ? _self._name
          : name // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      personalNum: freezed == personalNum
          ? _self._personalNum
          : personalNum // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      address: freezed == address
          ? _self._address
          : address // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      renewStartDate: freezed == renewStartDate
          ? _self._renewStartDate
          : renewStartDate // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      renewEndDate: freezed == renewEndDate
          ? _self._renewEndDate
          : renewEndDate // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      condition: freezed == condition
          ? _self._condition
          : condition // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      code: freezed == code
          ? _self._code
          : code // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      organDonation: freezed == organDonation
          ? _self._organDonation
          : organDonation // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      issueDate: freezed == issueDate
          ? _self._issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
      authority: freezed == authority
          ? _self._authority
          : authority // ignore: cast_nullable_to_non_nullable
              as List<OcrIdCardField>?,
    ));
  }
}

/// @nodoc
mixin _$OcrIdCardField {
  String? get text;
  OcrFormattedValue? get formatted;
  double? get confidenceScore;

  /// Create a copy of OcrIdCardField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrIdCardFieldCopyWith<OcrIdCardField> get copyWith =>
      _$OcrIdCardFieldCopyWithImpl<OcrIdCardField>(
          this as OcrIdCardField, _$identity);

  /// Serializes this OcrIdCardField to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrIdCardField &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.formatted, formatted) ||
                other.formatted == formatted) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, text, formatted, confidenceScore);

  @override
  String toString() {
    return 'OcrIdCardField(text: $text, formatted: $formatted, confidenceScore: $confidenceScore)';
  }
}

/// @nodoc
abstract mixin class $OcrIdCardFieldCopyWith<$Res> {
  factory $OcrIdCardFieldCopyWith(
          OcrIdCardField value, $Res Function(OcrIdCardField) _then) =
      _$OcrIdCardFieldCopyWithImpl;
  @useResult
  $Res call(
      {String? text, OcrFormattedValue? formatted, double? confidenceScore});

  $OcrFormattedValueCopyWith<$Res>? get formatted;
}

/// @nodoc
class _$OcrIdCardFieldCopyWithImpl<$Res>
    implements $OcrIdCardFieldCopyWith<$Res> {
  _$OcrIdCardFieldCopyWithImpl(this._self, this._then);

  final OcrIdCardField _self;
  final $Res Function(OcrIdCardField) _then;

  /// Create a copy of OcrIdCardField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? formatted = freezed,
    Object? confidenceScore = freezed,
  }) {
    return _then(_self.copyWith(
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      formatted: freezed == formatted
          ? _self.formatted
          : formatted // ignore: cast_nullable_to_non_nullable
              as OcrFormattedValue?,
      confidenceScore: freezed == confidenceScore
          ? _self.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of OcrIdCardField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrFormattedValueCopyWith<$Res>? get formatted {
    if (_self.formatted == null) {
      return null;
    }

    return $OcrFormattedValueCopyWith<$Res>(_self.formatted!, (value) {
      return _then(_self.copyWith(formatted: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OcrIdCardField].
extension OcrIdCardFieldPatterns on OcrIdCardField {
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
    TResult Function(_OcrIdCardField value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardField() when $default != null:
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
    TResult Function(_OcrIdCardField value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardField():
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
    TResult? Function(_OcrIdCardField value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardField() when $default != null:
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
    TResult Function(String? text, OcrFormattedValue? formatted,
            double? confidenceScore)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardField() when $default != null:
        return $default(_that.text, _that.formatted, _that.confidenceScore);
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
            String? text, OcrFormattedValue? formatted, double? confidenceScore)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardField():
        return $default(_that.text, _that.formatted, _that.confidenceScore);
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
    TResult? Function(String? text, OcrFormattedValue? formatted,
            double? confidenceScore)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrIdCardField() when $default != null:
        return $default(_that.text, _that.formatted, _that.confidenceScore);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrIdCardField implements OcrIdCardField {
  const _OcrIdCardField({this.text, this.formatted, this.confidenceScore});
  factory _OcrIdCardField.fromJson(Map<String, dynamic> json) =>
      _$OcrIdCardFieldFromJson(json);

  @override
  final String? text;
  @override
  final OcrFormattedValue? formatted;
  @override
  final double? confidenceScore;

  /// Create a copy of OcrIdCardField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrIdCardFieldCopyWith<_OcrIdCardField> get copyWith =>
      __$OcrIdCardFieldCopyWithImpl<_OcrIdCardField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrIdCardFieldToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrIdCardField &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.formatted, formatted) ||
                other.formatted == formatted) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, text, formatted, confidenceScore);

  @override
  String toString() {
    return 'OcrIdCardField(text: $text, formatted: $formatted, confidenceScore: $confidenceScore)';
  }
}

/// @nodoc
abstract mixin class _$OcrIdCardFieldCopyWith<$Res>
    implements $OcrIdCardFieldCopyWith<$Res> {
  factory _$OcrIdCardFieldCopyWith(
          _OcrIdCardField value, $Res Function(_OcrIdCardField) _then) =
      __$OcrIdCardFieldCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? text, OcrFormattedValue? formatted, double? confidenceScore});

  @override
  $OcrFormattedValueCopyWith<$Res>? get formatted;
}

/// @nodoc
class __$OcrIdCardFieldCopyWithImpl<$Res>
    implements _$OcrIdCardFieldCopyWith<$Res> {
  __$OcrIdCardFieldCopyWithImpl(this._self, this._then);

  final _OcrIdCardField _self;
  final $Res Function(_OcrIdCardField) _then;

  /// Create a copy of OcrIdCardField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = freezed,
    Object? formatted = freezed,
    Object? confidenceScore = freezed,
  }) {
    return _then(_OcrIdCardField(
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      formatted: freezed == formatted
          ? _self.formatted
          : formatted // ignore: cast_nullable_to_non_nullable
              as OcrFormattedValue?,
      confidenceScore: freezed == confidenceScore
          ? _self.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of OcrIdCardField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrFormattedValueCopyWith<$Res>? get formatted {
    if (_self.formatted == null) {
      return null;
    }

    return $OcrFormattedValueCopyWith<$Res>(_self.formatted!, (value) {
      return _then(_self.copyWith(formatted: value));
    });
  }
}

/// @nodoc
mixin _$OcrFormattedValue {
  dynamic get value;
  String? get year;
  String? get month;
  String? get day;

  /// Create a copy of OcrFormattedValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrFormattedValueCopyWith<OcrFormattedValue> get copyWith =>
      _$OcrFormattedValueCopyWithImpl<OcrFormattedValue>(
          this as OcrFormattedValue, _$identity);

  /// Serializes this OcrFormattedValue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrFormattedValue &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(value), year, month, day);

  @override
  String toString() {
    return 'OcrFormattedValue(value: $value, year: $year, month: $month, day: $day)';
  }
}

/// @nodoc
abstract mixin class $OcrFormattedValueCopyWith<$Res> {
  factory $OcrFormattedValueCopyWith(
          OcrFormattedValue value, $Res Function(OcrFormattedValue) _then) =
      _$OcrFormattedValueCopyWithImpl;
  @useResult
  $Res call({dynamic value, String? year, String? month, String? day});
}

/// @nodoc
class _$OcrFormattedValueCopyWithImpl<$Res>
    implements $OcrFormattedValueCopyWith<$Res> {
  _$OcrFormattedValueCopyWithImpl(this._self, this._then);

  final OcrFormattedValue _self;
  final $Res Function(OcrFormattedValue) _then;

  /// Create a copy of OcrFormattedValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
  }) {
    return _then(_self.copyWith(
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      year: freezed == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      month: freezed == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      day: freezed == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OcrFormattedValue].
extension OcrFormattedValuePatterns on OcrFormattedValue {
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
    TResult Function(_OcrFormattedValue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrFormattedValue() when $default != null:
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
    TResult Function(_OcrFormattedValue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrFormattedValue():
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
    TResult? Function(_OcrFormattedValue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrFormattedValue() when $default != null:
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
    TResult Function(dynamic value, String? year, String? month, String? day)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrFormattedValue() when $default != null:
        return $default(_that.value, _that.year, _that.month, _that.day);
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
    TResult Function(dynamic value, String? year, String? month, String? day)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrFormattedValue():
        return $default(_that.value, _that.year, _that.month, _that.day);
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
    TResult? Function(dynamic value, String? year, String? month, String? day)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrFormattedValue() when $default != null:
        return $default(_that.value, _that.year, _that.month, _that.day);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrFormattedValue implements OcrFormattedValue {
  const _OcrFormattedValue({this.value, this.year, this.month, this.day});
  factory _OcrFormattedValue.fromJson(Map<String, dynamic> json) =>
      _$OcrFormattedValueFromJson(json);

  @override
  final dynamic value;
  @override
  final String? year;
  @override
  final String? month;
  @override
  final String? day;

  /// Create a copy of OcrFormattedValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrFormattedValueCopyWith<_OcrFormattedValue> get copyWith =>
      __$OcrFormattedValueCopyWithImpl<_OcrFormattedValue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrFormattedValueToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrFormattedValue &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(value), year, month, day);

  @override
  String toString() {
    return 'OcrFormattedValue(value: $value, year: $year, month: $month, day: $day)';
  }
}

/// @nodoc
abstract mixin class _$OcrFormattedValueCopyWith<$Res>
    implements $OcrFormattedValueCopyWith<$Res> {
  factory _$OcrFormattedValueCopyWith(
          _OcrFormattedValue value, $Res Function(_OcrFormattedValue) _then) =
      __$OcrFormattedValueCopyWithImpl;
  @override
  @useResult
  $Res call({dynamic value, String? year, String? month, String? day});
}

/// @nodoc
class __$OcrFormattedValueCopyWithImpl<$Res>
    implements _$OcrFormattedValueCopyWith<$Res> {
  __$OcrFormattedValueCopyWithImpl(this._self, this._then);

  final _OcrFormattedValue _self;
  final $Res Function(_OcrFormattedValue) _then;

  /// Create a copy of OcrFormattedValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
  }) {
    return _then(_OcrFormattedValue(
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      year: freezed == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      month: freezed == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      day: freezed == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

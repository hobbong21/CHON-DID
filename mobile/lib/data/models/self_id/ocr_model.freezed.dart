// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ocr_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OcrResponse {
  List<OcrImage>? get images;

  /// Create a copy of OcrResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrResponseCopyWith<OcrResponse> get copyWith =>
      _$OcrResponseCopyWithImpl<OcrResponse>(this as OcrResponse, _$identity);

  /// Serializes this OcrResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrResponse &&
            const DeepCollectionEquality().equals(other.images, images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(images));

  @override
  String toString() {
    return 'OcrResponse(images: $images)';
  }
}

/// @nodoc
abstract mixin class $OcrResponseCopyWith<$Res> {
  factory $OcrResponseCopyWith(
          OcrResponse value, $Res Function(OcrResponse) _then) =
      _$OcrResponseCopyWithImpl;
  @useResult
  $Res call({List<OcrImage>? images});
}

/// @nodoc
class _$OcrResponseCopyWithImpl<$Res> implements $OcrResponseCopyWith<$Res> {
  _$OcrResponseCopyWithImpl(this._self, this._then);

  final OcrResponse _self;
  final $Res Function(OcrResponse) _then;

  /// Create a copy of OcrResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = freezed,
  }) {
    return _then(_self.copyWith(
      images: freezed == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<OcrImage>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OcrResponse].
extension OcrResponsePatterns on OcrResponse {
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
    TResult Function(_OcrResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrResponse() when $default != null:
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
    TResult Function(_OcrResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrResponse():
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
    TResult? Function(_OcrResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrResponse() when $default != null:
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
    TResult Function(List<OcrImage>? images)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrResponse() when $default != null:
        return $default(_that.images);
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
    TResult Function(List<OcrImage>? images) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrResponse():
        return $default(_that.images);
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
    TResult? Function(List<OcrImage>? images)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrResponse() when $default != null:
        return $default(_that.images);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrResponse implements OcrResponse {
  const _OcrResponse({final List<OcrImage>? images}) : _images = images;
  factory _OcrResponse.fromJson(Map<String, dynamic> json) =>
      _$OcrResponseFromJson(json);

  final List<OcrImage>? _images;
  @override
  List<OcrImage>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of OcrResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrResponseCopyWith<_OcrResponse> get copyWith =>
      __$OcrResponseCopyWithImpl<_OcrResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrResponse &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  @override
  String toString() {
    return 'OcrResponse(images: $images)';
  }
}

/// @nodoc
abstract mixin class _$OcrResponseCopyWith<$Res>
    implements $OcrResponseCopyWith<$Res> {
  factory _$OcrResponseCopyWith(
          _OcrResponse value, $Res Function(_OcrResponse) _then) =
      __$OcrResponseCopyWithImpl;
  @override
  @useResult
  $Res call({List<OcrImage>? images});
}

/// @nodoc
class __$OcrResponseCopyWithImpl<$Res> implements _$OcrResponseCopyWith<$Res> {
  __$OcrResponseCopyWithImpl(this._self, this._then);

  final _OcrResponse _self;
  final $Res Function(_OcrResponse) _then;

  /// Create a copy of OcrResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? images = freezed,
  }) {
    return _then(_OcrResponse(
      images: freezed == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<OcrImage>?,
    ));
  }
}

/// @nodoc
mixin _$OcrImage {
  String? get inferResult;
  List<OcrField>? get fields;

  /// Create a copy of OcrImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrImageCopyWith<OcrImage> get copyWith =>
      _$OcrImageCopyWithImpl<OcrImage>(this as OcrImage, _$identity);

  /// Serializes this OcrImage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrImage &&
            (identical(other.inferResult, inferResult) ||
                other.inferResult == inferResult) &&
            const DeepCollectionEquality().equals(other.fields, fields));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, inferResult, const DeepCollectionEquality().hash(fields));

  @override
  String toString() {
    return 'OcrImage(inferResult: $inferResult, fields: $fields)';
  }
}

/// @nodoc
abstract mixin class $OcrImageCopyWith<$Res> {
  factory $OcrImageCopyWith(OcrImage value, $Res Function(OcrImage) _then) =
      _$OcrImageCopyWithImpl;
  @useResult
  $Res call({String? inferResult, List<OcrField>? fields});
}

/// @nodoc
class _$OcrImageCopyWithImpl<$Res> implements $OcrImageCopyWith<$Res> {
  _$OcrImageCopyWithImpl(this._self, this._then);

  final OcrImage _self;
  final $Res Function(OcrImage) _then;

  /// Create a copy of OcrImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inferResult = freezed,
    Object? fields = freezed,
  }) {
    return _then(_self.copyWith(
      inferResult: freezed == inferResult
          ? _self.inferResult
          : inferResult // ignore: cast_nullable_to_non_nullable
              as String?,
      fields: freezed == fields
          ? _self.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<OcrField>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OcrImage].
extension OcrImagePatterns on OcrImage {
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
    TResult Function(_OcrImage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrImage() when $default != null:
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
    TResult Function(_OcrImage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrImage():
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
    TResult? Function(_OcrImage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrImage() when $default != null:
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
    TResult Function(String? inferResult, List<OcrField>? fields)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrImage() when $default != null:
        return $default(_that.inferResult, _that.fields);
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
    TResult Function(String? inferResult, List<OcrField>? fields) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrImage():
        return $default(_that.inferResult, _that.fields);
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
    TResult? Function(String? inferResult, List<OcrField>? fields)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrImage() when $default != null:
        return $default(_that.inferResult, _that.fields);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrImage implements OcrImage {
  const _OcrImage({this.inferResult, final List<OcrField>? fields})
      : _fields = fields;
  factory _OcrImage.fromJson(Map<String, dynamic> json) =>
      _$OcrImageFromJson(json);

  @override
  final String? inferResult;
  final List<OcrField>? _fields;
  @override
  List<OcrField>? get fields {
    final value = _fields;
    if (value == null) return null;
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of OcrImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrImageCopyWith<_OcrImage> get copyWith =>
      __$OcrImageCopyWithImpl<_OcrImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrImageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrImage &&
            (identical(other.inferResult, inferResult) ||
                other.inferResult == inferResult) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, inferResult, const DeepCollectionEquality().hash(_fields));

  @override
  String toString() {
    return 'OcrImage(inferResult: $inferResult, fields: $fields)';
  }
}

/// @nodoc
abstract mixin class _$OcrImageCopyWith<$Res>
    implements $OcrImageCopyWith<$Res> {
  factory _$OcrImageCopyWith(_OcrImage value, $Res Function(_OcrImage) _then) =
      __$OcrImageCopyWithImpl;
  @override
  @useResult
  $Res call({String? inferResult, List<OcrField>? fields});
}

/// @nodoc
class __$OcrImageCopyWithImpl<$Res> implements _$OcrImageCopyWith<$Res> {
  __$OcrImageCopyWithImpl(this._self, this._then);

  final _OcrImage _self;
  final $Res Function(_OcrImage) _then;

  /// Create a copy of OcrImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? inferResult = freezed,
    Object? fields = freezed,
  }) {
    return _then(_OcrImage(
      inferResult: freezed == inferResult
          ? _self.inferResult
          : inferResult // ignore: cast_nullable_to_non_nullable
              as String?,
      fields: freezed == fields
          ? _self._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<OcrField>?,
    ));
  }
}

/// @nodoc
mixin _$OcrField {
  String? get valueType;
  BoundingPoly? get boundingPoly;
  String? get inferText;
  String? get type;
  bool? get lineBreak;
  @JsonKey(fromJson: _numToDouble)
  double get inferConfidence;

  /// Create a copy of OcrField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrFieldCopyWith<OcrField> get copyWith =>
      _$OcrFieldCopyWithImpl<OcrField>(this as OcrField, _$identity);

  /// Serializes this OcrField to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrField &&
            (identical(other.valueType, valueType) ||
                other.valueType == valueType) &&
            (identical(other.boundingPoly, boundingPoly) ||
                other.boundingPoly == boundingPoly) &&
            (identical(other.inferText, inferText) ||
                other.inferText == inferText) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.lineBreak, lineBreak) ||
                other.lineBreak == lineBreak) &&
            (identical(other.inferConfidence, inferConfidence) ||
                other.inferConfidence == inferConfidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, valueType, boundingPoly,
      inferText, type, lineBreak, inferConfidence);

  @override
  String toString() {
    return 'OcrField(valueType: $valueType, boundingPoly: $boundingPoly, inferText: $inferText, type: $type, lineBreak: $lineBreak, inferConfidence: $inferConfidence)';
  }
}

/// @nodoc
abstract mixin class $OcrFieldCopyWith<$Res> {
  factory $OcrFieldCopyWith(OcrField value, $Res Function(OcrField) _then) =
      _$OcrFieldCopyWithImpl;
  @useResult
  $Res call(
      {String? valueType,
      BoundingPoly? boundingPoly,
      String? inferText,
      String? type,
      bool? lineBreak,
      @JsonKey(fromJson: _numToDouble) double inferConfidence});

  $BoundingPolyCopyWith<$Res>? get boundingPoly;
}

/// @nodoc
class _$OcrFieldCopyWithImpl<$Res> implements $OcrFieldCopyWith<$Res> {
  _$OcrFieldCopyWithImpl(this._self, this._then);

  final OcrField _self;
  final $Res Function(OcrField) _then;

  /// Create a copy of OcrField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueType = freezed,
    Object? boundingPoly = freezed,
    Object? inferText = freezed,
    Object? type = freezed,
    Object? lineBreak = freezed,
    Object? inferConfidence = null,
  }) {
    return _then(_self.copyWith(
      valueType: freezed == valueType
          ? _self.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as String?,
      boundingPoly: freezed == boundingPoly
          ? _self.boundingPoly
          : boundingPoly // ignore: cast_nullable_to_non_nullable
              as BoundingPoly?,
      inferText: freezed == inferText
          ? _self.inferText
          : inferText // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      lineBreak: freezed == lineBreak
          ? _self.lineBreak
          : lineBreak // ignore: cast_nullable_to_non_nullable
              as bool?,
      inferConfidence: null == inferConfidence
          ? _self.inferConfidence
          : inferConfidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of OcrField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoundingPolyCopyWith<$Res>? get boundingPoly {
    if (_self.boundingPoly == null) {
      return null;
    }

    return $BoundingPolyCopyWith<$Res>(_self.boundingPoly!, (value) {
      return _then(_self.copyWith(boundingPoly: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OcrField].
extension OcrFieldPatterns on OcrField {
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
    TResult Function(_OcrField value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrField() when $default != null:
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
    TResult Function(_OcrField value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrField():
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
    TResult? Function(_OcrField value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrField() when $default != null:
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
            String? valueType,
            BoundingPoly? boundingPoly,
            String? inferText,
            String? type,
            bool? lineBreak,
            @JsonKey(fromJson: _numToDouble) double inferConfidence)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrField() when $default != null:
        return $default(_that.valueType, _that.boundingPoly, _that.inferText,
            _that.type, _that.lineBreak, _that.inferConfidence);
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
            String? valueType,
            BoundingPoly? boundingPoly,
            String? inferText,
            String? type,
            bool? lineBreak,
            @JsonKey(fromJson: _numToDouble) double inferConfidence)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrField():
        return $default(_that.valueType, _that.boundingPoly, _that.inferText,
            _that.type, _that.lineBreak, _that.inferConfidence);
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
            String? valueType,
            BoundingPoly? boundingPoly,
            String? inferText,
            String? type,
            bool? lineBreak,
            @JsonKey(fromJson: _numToDouble) double inferConfidence)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrField() when $default != null:
        return $default(_that.valueType, _that.boundingPoly, _that.inferText,
            _that.type, _that.lineBreak, _that.inferConfidence);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrField implements OcrField {
  const _OcrField(
      {this.valueType,
      this.boundingPoly,
      this.inferText,
      this.type,
      this.lineBreak,
      @JsonKey(fromJson: _numToDouble) required this.inferConfidence});
  factory _OcrField.fromJson(Map<String, dynamic> json) =>
      _$OcrFieldFromJson(json);

  @override
  final String? valueType;
  @override
  final BoundingPoly? boundingPoly;
  @override
  final String? inferText;
  @override
  final String? type;
  @override
  final bool? lineBreak;
  @override
  @JsonKey(fromJson: _numToDouble)
  final double inferConfidence;

  /// Create a copy of OcrField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrFieldCopyWith<_OcrField> get copyWith =>
      __$OcrFieldCopyWithImpl<_OcrField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrFieldToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrField &&
            (identical(other.valueType, valueType) ||
                other.valueType == valueType) &&
            (identical(other.boundingPoly, boundingPoly) ||
                other.boundingPoly == boundingPoly) &&
            (identical(other.inferText, inferText) ||
                other.inferText == inferText) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.lineBreak, lineBreak) ||
                other.lineBreak == lineBreak) &&
            (identical(other.inferConfidence, inferConfidence) ||
                other.inferConfidence == inferConfidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, valueType, boundingPoly,
      inferText, type, lineBreak, inferConfidence);

  @override
  String toString() {
    return 'OcrField(valueType: $valueType, boundingPoly: $boundingPoly, inferText: $inferText, type: $type, lineBreak: $lineBreak, inferConfidence: $inferConfidence)';
  }
}

/// @nodoc
abstract mixin class _$OcrFieldCopyWith<$Res>
    implements $OcrFieldCopyWith<$Res> {
  factory _$OcrFieldCopyWith(_OcrField value, $Res Function(_OcrField) _then) =
      __$OcrFieldCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? valueType,
      BoundingPoly? boundingPoly,
      String? inferText,
      String? type,
      bool? lineBreak,
      @JsonKey(fromJson: _numToDouble) double inferConfidence});

  @override
  $BoundingPolyCopyWith<$Res>? get boundingPoly;
}

/// @nodoc
class __$OcrFieldCopyWithImpl<$Res> implements _$OcrFieldCopyWith<$Res> {
  __$OcrFieldCopyWithImpl(this._self, this._then);

  final _OcrField _self;
  final $Res Function(_OcrField) _then;

  /// Create a copy of OcrField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? valueType = freezed,
    Object? boundingPoly = freezed,
    Object? inferText = freezed,
    Object? type = freezed,
    Object? lineBreak = freezed,
    Object? inferConfidence = null,
  }) {
    return _then(_OcrField(
      valueType: freezed == valueType
          ? _self.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as String?,
      boundingPoly: freezed == boundingPoly
          ? _self.boundingPoly
          : boundingPoly // ignore: cast_nullable_to_non_nullable
              as BoundingPoly?,
      inferText: freezed == inferText
          ? _self.inferText
          : inferText // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      lineBreak: freezed == lineBreak
          ? _self.lineBreak
          : lineBreak // ignore: cast_nullable_to_non_nullable
              as bool?,
      inferConfidence: null == inferConfidence
          ? _self.inferConfidence
          : inferConfidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of OcrField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoundingPolyCopyWith<$Res>? get boundingPoly {
    if (_self.boundingPoly == null) {
      return null;
    }

    return $BoundingPolyCopyWith<$Res>(_self.boundingPoly!, (value) {
      return _then(_self.copyWith(boundingPoly: value));
    });
  }
}

/// @nodoc
mixin _$BoundingPoly {
  List<Vertices>? get vertices;

  /// Create a copy of BoundingPoly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BoundingPolyCopyWith<BoundingPoly> get copyWith =>
      _$BoundingPolyCopyWithImpl<BoundingPoly>(
          this as BoundingPoly, _$identity);

  /// Serializes this BoundingPoly to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BoundingPoly &&
            const DeepCollectionEquality().equals(other.vertices, vertices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(vertices));

  @override
  String toString() {
    return 'BoundingPoly(vertices: $vertices)';
  }
}

/// @nodoc
abstract mixin class $BoundingPolyCopyWith<$Res> {
  factory $BoundingPolyCopyWith(
          BoundingPoly value, $Res Function(BoundingPoly) _then) =
      _$BoundingPolyCopyWithImpl;
  @useResult
  $Res call({List<Vertices>? vertices});
}

/// @nodoc
class _$BoundingPolyCopyWithImpl<$Res> implements $BoundingPolyCopyWith<$Res> {
  _$BoundingPolyCopyWithImpl(this._self, this._then);

  final BoundingPoly _self;
  final $Res Function(BoundingPoly) _then;

  /// Create a copy of BoundingPoly
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vertices = freezed,
  }) {
    return _then(_self.copyWith(
      vertices: freezed == vertices
          ? _self.vertices
          : vertices // ignore: cast_nullable_to_non_nullable
              as List<Vertices>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BoundingPoly].
extension BoundingPolyPatterns on BoundingPoly {
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
    TResult Function(_BoundingPoly value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BoundingPoly() when $default != null:
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
    TResult Function(_BoundingPoly value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BoundingPoly():
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
    TResult? Function(_BoundingPoly value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BoundingPoly() when $default != null:
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
    TResult Function(List<Vertices>? vertices)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BoundingPoly() when $default != null:
        return $default(_that.vertices);
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
    TResult Function(List<Vertices>? vertices) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BoundingPoly():
        return $default(_that.vertices);
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
    TResult? Function(List<Vertices>? vertices)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BoundingPoly() when $default != null:
        return $default(_that.vertices);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BoundingPoly implements BoundingPoly {
  const _BoundingPoly({final List<Vertices>? vertices}) : _vertices = vertices;
  factory _BoundingPoly.fromJson(Map<String, dynamic> json) =>
      _$BoundingPolyFromJson(json);

  final List<Vertices>? _vertices;
  @override
  List<Vertices>? get vertices {
    final value = _vertices;
    if (value == null) return null;
    if (_vertices is EqualUnmodifiableListView) return _vertices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of BoundingPoly
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BoundingPolyCopyWith<_BoundingPoly> get copyWith =>
      __$BoundingPolyCopyWithImpl<_BoundingPoly>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BoundingPolyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BoundingPoly &&
            const DeepCollectionEquality().equals(other._vertices, _vertices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_vertices));

  @override
  String toString() {
    return 'BoundingPoly(vertices: $vertices)';
  }
}

/// @nodoc
abstract mixin class _$BoundingPolyCopyWith<$Res>
    implements $BoundingPolyCopyWith<$Res> {
  factory _$BoundingPolyCopyWith(
          _BoundingPoly value, $Res Function(_BoundingPoly) _then) =
      __$BoundingPolyCopyWithImpl;
  @override
  @useResult
  $Res call({List<Vertices>? vertices});
}

/// @nodoc
class __$BoundingPolyCopyWithImpl<$Res>
    implements _$BoundingPolyCopyWith<$Res> {
  __$BoundingPolyCopyWithImpl(this._self, this._then);

  final _BoundingPoly _self;
  final $Res Function(_BoundingPoly) _then;

  /// Create a copy of BoundingPoly
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vertices = freezed,
  }) {
    return _then(_BoundingPoly(
      vertices: freezed == vertices
          ? _self._vertices
          : vertices // ignore: cast_nullable_to_non_nullable
              as List<Vertices>?,
    ));
  }
}

/// @nodoc
mixin _$Vertices {
  double? get x;
  double? get y;

  /// Create a copy of Vertices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerticesCopyWith<Vertices> get copyWith =>
      _$VerticesCopyWithImpl<Vertices>(this as Vertices, _$identity);

  /// Serializes this Vertices to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Vertices &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @override
  String toString() {
    return 'Vertices(x: $x, y: $y)';
  }
}

/// @nodoc
abstract mixin class $VerticesCopyWith<$Res> {
  factory $VerticesCopyWith(Vertices value, $Res Function(Vertices) _then) =
      _$VerticesCopyWithImpl;
  @useResult
  $Res call({double? x, double? y});
}

/// @nodoc
class _$VerticesCopyWithImpl<$Res> implements $VerticesCopyWith<$Res> {
  _$VerticesCopyWithImpl(this._self, this._then);

  final Vertices _self;
  final $Res Function(Vertices) _then;

  /// Create a copy of Vertices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_self.copyWith(
      x: freezed == x
          ? _self.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _self.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Vertices].
extension VerticesPatterns on Vertices {
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
    TResult Function(_Vertices value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Vertices() when $default != null:
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
    TResult Function(_Vertices value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Vertices():
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
    TResult? Function(_Vertices value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Vertices() when $default != null:
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
    TResult Function(double? x, double? y)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Vertices() when $default != null:
        return $default(_that.x, _that.y);
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
    TResult Function(double? x, double? y) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Vertices():
        return $default(_that.x, _that.y);
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
    TResult? Function(double? x, double? y)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Vertices() when $default != null:
        return $default(_that.x, _that.y);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Vertices implements Vertices {
  const _Vertices({this.x, this.y});
  factory _Vertices.fromJson(Map<String, dynamic> json) =>
      _$VerticesFromJson(json);

  @override
  final double? x;
  @override
  final double? y;

  /// Create a copy of Vertices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VerticesCopyWith<_Vertices> get copyWith =>
      __$VerticesCopyWithImpl<_Vertices>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VerticesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Vertices &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @override
  String toString() {
    return 'Vertices(x: $x, y: $y)';
  }
}

/// @nodoc
abstract mixin class _$VerticesCopyWith<$Res>
    implements $VerticesCopyWith<$Res> {
  factory _$VerticesCopyWith(_Vertices value, $Res Function(_Vertices) _then) =
      __$VerticesCopyWithImpl;
  @override
  @useResult
  $Res call({double? x, double? y});
}

/// @nodoc
class __$VerticesCopyWithImpl<$Res> implements _$VerticesCopyWith<$Res> {
  __$VerticesCopyWithImpl(this._self, this._then);

  final _Vertices _self;
  final $Res Function(_Vertices) _then;

  /// Create a copy of Vertices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_Vertices(
      x: freezed == x
          ? _self.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _self.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$OcrMessage {
  String get version;
  String get requestId;
  int get timestamp;
  List<OcrImageMessage> get images;
  bool get enableTableDetection;

  /// Create a copy of OcrMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrMessageCopyWith<OcrMessage> get copyWith =>
      _$OcrMessageCopyWithImpl<OcrMessage>(this as OcrMessage, _$identity);

  /// Serializes this OcrMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrMessage &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.enableTableDetection, enableTableDetection) ||
                other.enableTableDetection == enableTableDetection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, version, requestId, timestamp,
      const DeepCollectionEquality().hash(images), enableTableDetection);

  @override
  String toString() {
    return 'OcrMessage(version: $version, requestId: $requestId, timestamp: $timestamp, images: $images, enableTableDetection: $enableTableDetection)';
  }
}

/// @nodoc
abstract mixin class $OcrMessageCopyWith<$Res> {
  factory $OcrMessageCopyWith(
          OcrMessage value, $Res Function(OcrMessage) _then) =
      _$OcrMessageCopyWithImpl;
  @useResult
  $Res call(
      {String version,
      String requestId,
      int timestamp,
      List<OcrImageMessage> images,
      bool enableTableDetection});
}

/// @nodoc
class _$OcrMessageCopyWithImpl<$Res> implements $OcrMessageCopyWith<$Res> {
  _$OcrMessageCopyWithImpl(this._self, this._then);

  final OcrMessage _self;
  final $Res Function(OcrMessage) _then;

  /// Create a copy of OcrMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? requestId = null,
    Object? timestamp = null,
    Object? images = null,
    Object? enableTableDetection = null,
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
              as List<OcrImageMessage>,
      enableTableDetection: null == enableTableDetection
          ? _self.enableTableDetection
          : enableTableDetection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [OcrMessage].
extension OcrMessagePatterns on OcrMessage {
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
    TResult Function(_OcrMessage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrMessage() when $default != null:
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
    TResult Function(_OcrMessage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrMessage():
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
    TResult? Function(_OcrMessage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrMessage() when $default != null:
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
            List<OcrImageMessage> images, bool enableTableDetection)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrMessage() when $default != null:
        return $default(_that.version, _that.requestId, _that.timestamp,
            _that.images, _that.enableTableDetection);
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
            List<OcrImageMessage> images, bool enableTableDetection)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrMessage():
        return $default(_that.version, _that.requestId, _that.timestamp,
            _that.images, _that.enableTableDetection);
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
            List<OcrImageMessage> images, bool enableTableDetection)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrMessage() when $default != null:
        return $default(_that.version, _that.requestId, _that.timestamp,
            _that.images, _that.enableTableDetection);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrMessage implements OcrMessage {
  const _OcrMessage(
      {required this.version,
      required this.requestId,
      required this.timestamp,
      required final List<OcrImageMessage> images,
      this.enableTableDetection = false})
      : _images = images;
  factory _OcrMessage.fromJson(Map<String, dynamic> json) =>
      _$OcrMessageFromJson(json);

  @override
  final String version;
  @override
  final String requestId;
  @override
  final int timestamp;
  final List<OcrImageMessage> _images;
  @override
  List<OcrImageMessage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final bool enableTableDetection;

  /// Create a copy of OcrMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrMessageCopyWith<_OcrMessage> get copyWith =>
      __$OcrMessageCopyWithImpl<_OcrMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrMessage &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.enableTableDetection, enableTableDetection) ||
                other.enableTableDetection == enableTableDetection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, version, requestId, timestamp,
      const DeepCollectionEquality().hash(_images), enableTableDetection);

  @override
  String toString() {
    return 'OcrMessage(version: $version, requestId: $requestId, timestamp: $timestamp, images: $images, enableTableDetection: $enableTableDetection)';
  }
}

/// @nodoc
abstract mixin class _$OcrMessageCopyWith<$Res>
    implements $OcrMessageCopyWith<$Res> {
  factory _$OcrMessageCopyWith(
          _OcrMessage value, $Res Function(_OcrMessage) _then) =
      __$OcrMessageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String version,
      String requestId,
      int timestamp,
      List<OcrImageMessage> images,
      bool enableTableDetection});
}

/// @nodoc
class __$OcrMessageCopyWithImpl<$Res> implements _$OcrMessageCopyWith<$Res> {
  __$OcrMessageCopyWithImpl(this._self, this._then);

  final _OcrMessage _self;
  final $Res Function(_OcrMessage) _then;

  /// Create a copy of OcrMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
    Object? requestId = null,
    Object? timestamp = null,
    Object? images = null,
    Object? enableTableDetection = null,
  }) {
    return _then(_OcrMessage(
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
              as List<OcrImageMessage>,
      enableTableDetection: null == enableTableDetection
          ? _self.enableTableDetection
          : enableTableDetection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$OcrImageMessage {
  String get format;
  String get name;

  /// Create a copy of OcrImageMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OcrImageMessageCopyWith<OcrImageMessage> get copyWith =>
      _$OcrImageMessageCopyWithImpl<OcrImageMessage>(
          this as OcrImageMessage, _$identity);

  /// Serializes this OcrImageMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OcrImageMessage &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, format, name);

  @override
  String toString() {
    return 'OcrImageMessage(format: $format, name: $name)';
  }
}

/// @nodoc
abstract mixin class $OcrImageMessageCopyWith<$Res> {
  factory $OcrImageMessageCopyWith(
          OcrImageMessage value, $Res Function(OcrImageMessage) _then) =
      _$OcrImageMessageCopyWithImpl;
  @useResult
  $Res call({String format, String name});
}

/// @nodoc
class _$OcrImageMessageCopyWithImpl<$Res>
    implements $OcrImageMessageCopyWith<$Res> {
  _$OcrImageMessageCopyWithImpl(this._self, this._then);

  final OcrImageMessage _self;
  final $Res Function(OcrImageMessage) _then;

  /// Create a copy of OcrImageMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [OcrImageMessage].
extension OcrImageMessagePatterns on OcrImageMessage {
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
    TResult Function(_OcrImageMessage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrImageMessage() when $default != null:
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
    TResult Function(_OcrImageMessage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrImageMessage():
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
    TResult? Function(_OcrImageMessage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrImageMessage() when $default != null:
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
    TResult Function(String format, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OcrImageMessage() when $default != null:
        return $default(_that.format, _that.name);
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
    TResult Function(String format, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrImageMessage():
        return $default(_that.format, _that.name);
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
    TResult? Function(String format, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OcrImageMessage() when $default != null:
        return $default(_that.format, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OcrImageMessage implements OcrImageMessage {
  const _OcrImageMessage({required this.format, required this.name});
  factory _OcrImageMessage.fromJson(Map<String, dynamic> json) =>
      _$OcrImageMessageFromJson(json);

  @override
  final String format;
  @override
  final String name;

  /// Create a copy of OcrImageMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OcrImageMessageCopyWith<_OcrImageMessage> get copyWith =>
      __$OcrImageMessageCopyWithImpl<_OcrImageMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OcrImageMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OcrImageMessage &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, format, name);

  @override
  String toString() {
    return 'OcrImageMessage(format: $format, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$OcrImageMessageCopyWith<$Res>
    implements $OcrImageMessageCopyWith<$Res> {
  factory _$OcrImageMessageCopyWith(
          _OcrImageMessage value, $Res Function(_OcrImageMessage) _then) =
      __$OcrImageMessageCopyWithImpl;
  @override
  @useResult
  $Res call({String format, String name});
}

/// @nodoc
class __$OcrImageMessageCopyWithImpl<$Res>
    implements _$OcrImageMessageCopyWith<$Res> {
  __$OcrImageMessageCopyWithImpl(this._self, this._then);

  final _OcrImageMessage _self;
  final $Res Function(_OcrImageMessage) _then;

  /// Create a copy of OcrImageMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? format = null,
    Object? name = null,
  }) {
    return _then(_OcrImageMessage(
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

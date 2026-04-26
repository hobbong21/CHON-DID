// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_card_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListCardInfoRequest {
  @JsonKey(name: 'pageIndex')
  int? get page;
  @JsonKey(name: 'pageSize')
  int? get size;
  @JsonKey(name: 'isVerified')
  bool? get status;

  /// Create a copy of ListCardInfoRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListCardInfoRequestCopyWith<ListCardInfoRequest> get copyWith =>
      _$ListCardInfoRequestCopyWithImpl<ListCardInfoRequest>(
          this as ListCardInfoRequest, _$identity);

  /// Serializes this ListCardInfoRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListCardInfoRequest &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, size, status);

  @override
  String toString() {
    return 'ListCardInfoRequest(page: $page, size: $size, status: $status)';
  }
}

/// @nodoc
abstract mixin class $ListCardInfoRequestCopyWith<$Res> {
  factory $ListCardInfoRequestCopyWith(
          ListCardInfoRequest value, $Res Function(ListCardInfoRequest) _then) =
      _$ListCardInfoRequestCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'pageIndex') int? page,
      @JsonKey(name: 'pageSize') int? size,
      @JsonKey(name: 'isVerified') bool? status});
}

/// @nodoc
class _$ListCardInfoRequestCopyWithImpl<$Res>
    implements $ListCardInfoRequestCopyWith<$Res> {
  _$ListCardInfoRequestCopyWithImpl(this._self, this._then);

  final ListCardInfoRequest _self;
  final $Res Function(ListCardInfoRequest) _then;

  /// Create a copy of ListCardInfoRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? size = freezed,
    Object? status = freezed,
  }) {
    return _then(_self.copyWith(
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ListCardInfoRequest].
extension ListCardInfoRequestPatterns on ListCardInfoRequest {
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
    TResult Function(_ListCardInfoRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoRequest() when $default != null:
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
    TResult Function(_ListCardInfoRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoRequest():
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
    TResult? Function(_ListCardInfoRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoRequest() when $default != null:
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
            @JsonKey(name: 'pageIndex') int? page,
            @JsonKey(name: 'pageSize') int? size,
            @JsonKey(name: 'isVerified') bool? status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoRequest() when $default != null:
        return $default(_that.page, _that.size, _that.status);
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
            @JsonKey(name: 'pageIndex') int? page,
            @JsonKey(name: 'pageSize') int? size,
            @JsonKey(name: 'isVerified') bool? status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoRequest():
        return $default(_that.page, _that.size, _that.status);
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
            @JsonKey(name: 'pageIndex') int? page,
            @JsonKey(name: 'pageSize') int? size,
            @JsonKey(name: 'isVerified') bool? status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoRequest() when $default != null:
        return $default(_that.page, _that.size, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ListCardInfoRequest implements ListCardInfoRequest {
  const _ListCardInfoRequest(
      {@JsonKey(name: 'pageIndex') this.page,
      @JsonKey(name: 'pageSize') this.size,
      @JsonKey(name: 'isVerified') this.status});
  factory _ListCardInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$ListCardInfoRequestFromJson(json);

  @override
  @JsonKey(name: 'pageIndex')
  final int? page;
  @override
  @JsonKey(name: 'pageSize')
  final int? size;
  @override
  @JsonKey(name: 'isVerified')
  final bool? status;

  /// Create a copy of ListCardInfoRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListCardInfoRequestCopyWith<_ListCardInfoRequest> get copyWith =>
      __$ListCardInfoRequestCopyWithImpl<_ListCardInfoRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListCardInfoRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListCardInfoRequest &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, size, status);

  @override
  String toString() {
    return 'ListCardInfoRequest(page: $page, size: $size, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$ListCardInfoRequestCopyWith<$Res>
    implements $ListCardInfoRequestCopyWith<$Res> {
  factory _$ListCardInfoRequestCopyWith(_ListCardInfoRequest value,
          $Res Function(_ListCardInfoRequest) _then) =
      __$ListCardInfoRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pageIndex') int? page,
      @JsonKey(name: 'pageSize') int? size,
      @JsonKey(name: 'isVerified') bool? status});
}

/// @nodoc
class __$ListCardInfoRequestCopyWithImpl<$Res>
    implements _$ListCardInfoRequestCopyWith<$Res> {
  __$ListCardInfoRequestCopyWithImpl(this._self, this._then);

  final _ListCardInfoRequest _self;
  final $Res Function(_ListCardInfoRequest) _then;

  /// Create a copy of ListCardInfoRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = freezed,
    Object? size = freezed,
    Object? status = freezed,
  }) {
    return _then(_ListCardInfoRequest(
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$ListCardInfoResponse {
  @JsonKey(name: 'status')
  int? get status;
  @JsonKey(name: 'errorCode')
  String? get errorCode;
  @JsonKey(name: 'errorDesc')
  String? get errorDesc;
  @JsonKey(name: 'clientMessageId')
  String? get clientMessageId;
  @JsonKey(name: 'data')
  ListCardInfoData? get data;

  /// Create a copy of ListCardInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListCardInfoResponseCopyWith<ListCardInfoResponse> get copyWith =>
      _$ListCardInfoResponseCopyWithImpl<ListCardInfoResponse>(
          this as ListCardInfoResponse, _$identity);

  /// Serializes this ListCardInfoResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListCardInfoResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.errorDesc, errorDesc) ||
                other.errorDesc == errorDesc) &&
            (identical(other.clientMessageId, clientMessageId) ||
                other.clientMessageId == clientMessageId) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, errorCode, errorDesc, clientMessageId, data);

  @override
  String toString() {
    return 'ListCardInfoResponse(status: $status, errorCode: $errorCode, errorDesc: $errorDesc, clientMessageId: $clientMessageId, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ListCardInfoResponseCopyWith<$Res> {
  factory $ListCardInfoResponseCopyWith(ListCardInfoResponse value,
          $Res Function(ListCardInfoResponse) _then) =
      _$ListCardInfoResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'errorCode') String? errorCode,
      @JsonKey(name: 'errorDesc') String? errorDesc,
      @JsonKey(name: 'clientMessageId') String? clientMessageId,
      @JsonKey(name: 'data') ListCardInfoData? data});

  $ListCardInfoDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ListCardInfoResponseCopyWithImpl<$Res>
    implements $ListCardInfoResponseCopyWith<$Res> {
  _$ListCardInfoResponseCopyWithImpl(this._self, this._then);

  final ListCardInfoResponse _self;
  final $Res Function(ListCardInfoResponse) _then;

  /// Create a copy of ListCardInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? errorCode = freezed,
    Object? errorDesc = freezed,
    Object? clientMessageId = freezed,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      errorCode: freezed == errorCode
          ? _self.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      errorDesc: freezed == errorDesc
          ? _self.errorDesc
          : errorDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      clientMessageId: freezed == clientMessageId
          ? _self.clientMessageId
          : clientMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ListCardInfoData?,
    ));
  }

  /// Create a copy of ListCardInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ListCardInfoDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ListCardInfoDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ListCardInfoResponse].
extension ListCardInfoResponsePatterns on ListCardInfoResponse {
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
    TResult Function(_ListCardInfoResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoResponse() when $default != null:
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
    TResult Function(_ListCardInfoResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoResponse():
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
    TResult? Function(_ListCardInfoResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoResponse() when $default != null:
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
            @JsonKey(name: 'status') int? status,
            @JsonKey(name: 'errorCode') String? errorCode,
            @JsonKey(name: 'errorDesc') String? errorDesc,
            @JsonKey(name: 'clientMessageId') String? clientMessageId,
            @JsonKey(name: 'data') ListCardInfoData? data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoResponse() when $default != null:
        return $default(_that.status, _that.errorCode, _that.errorDesc,
            _that.clientMessageId, _that.data);
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
            @JsonKey(name: 'status') int? status,
            @JsonKey(name: 'errorCode') String? errorCode,
            @JsonKey(name: 'errorDesc') String? errorDesc,
            @JsonKey(name: 'clientMessageId') String? clientMessageId,
            @JsonKey(name: 'data') ListCardInfoData? data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoResponse():
        return $default(_that.status, _that.errorCode, _that.errorDesc,
            _that.clientMessageId, _that.data);
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
            @JsonKey(name: 'status') int? status,
            @JsonKey(name: 'errorCode') String? errorCode,
            @JsonKey(name: 'errorDesc') String? errorDesc,
            @JsonKey(name: 'clientMessageId') String? clientMessageId,
            @JsonKey(name: 'data') ListCardInfoData? data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoResponse() when $default != null:
        return $default(_that.status, _that.errorCode, _that.errorDesc,
            _that.clientMessageId, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ListCardInfoResponse implements ListCardInfoResponse {
  const _ListCardInfoResponse(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'errorCode') this.errorCode,
      @JsonKey(name: 'errorDesc') this.errorDesc,
      @JsonKey(name: 'clientMessageId') this.clientMessageId,
      @JsonKey(name: 'data') this.data});
  factory _ListCardInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCardInfoResponseFromJson(json);

  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'errorCode')
  final String? errorCode;
  @override
  @JsonKey(name: 'errorDesc')
  final String? errorDesc;
  @override
  @JsonKey(name: 'clientMessageId')
  final String? clientMessageId;
  @override
  @JsonKey(name: 'data')
  final ListCardInfoData? data;

  /// Create a copy of ListCardInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListCardInfoResponseCopyWith<_ListCardInfoResponse> get copyWith =>
      __$ListCardInfoResponseCopyWithImpl<_ListCardInfoResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListCardInfoResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListCardInfoResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.errorDesc, errorDesc) ||
                other.errorDesc == errorDesc) &&
            (identical(other.clientMessageId, clientMessageId) ||
                other.clientMessageId == clientMessageId) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, errorCode, errorDesc, clientMessageId, data);

  @override
  String toString() {
    return 'ListCardInfoResponse(status: $status, errorCode: $errorCode, errorDesc: $errorDesc, clientMessageId: $clientMessageId, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ListCardInfoResponseCopyWith<$Res>
    implements $ListCardInfoResponseCopyWith<$Res> {
  factory _$ListCardInfoResponseCopyWith(_ListCardInfoResponse value,
          $Res Function(_ListCardInfoResponse) _then) =
      __$ListCardInfoResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'errorCode') String? errorCode,
      @JsonKey(name: 'errorDesc') String? errorDesc,
      @JsonKey(name: 'clientMessageId') String? clientMessageId,
      @JsonKey(name: 'data') ListCardInfoData? data});

  @override
  $ListCardInfoDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$ListCardInfoResponseCopyWithImpl<$Res>
    implements _$ListCardInfoResponseCopyWith<$Res> {
  __$ListCardInfoResponseCopyWithImpl(this._self, this._then);

  final _ListCardInfoResponse _self;
  final $Res Function(_ListCardInfoResponse) _then;

  /// Create a copy of ListCardInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = freezed,
    Object? errorCode = freezed,
    Object? errorDesc = freezed,
    Object? clientMessageId = freezed,
    Object? data = freezed,
  }) {
    return _then(_ListCardInfoResponse(
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      errorCode: freezed == errorCode
          ? _self.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      errorDesc: freezed == errorDesc
          ? _self.errorDesc
          : errorDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      clientMessageId: freezed == clientMessageId
          ? _self.clientMessageId
          : clientMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ListCardInfoData?,
    ));
  }

  /// Create a copy of ListCardInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ListCardInfoDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ListCardInfoDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$ListCardInfoData {
  @JsonKey(name: 'list')
  List<CardInfoItem>? get list;
  @JsonKey(name: 'count')
  int? get count;

  /// Create a copy of ListCardInfoData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListCardInfoDataCopyWith<ListCardInfoData> get copyWith =>
      _$ListCardInfoDataCopyWithImpl<ListCardInfoData>(
          this as ListCardInfoData, _$identity);

  /// Serializes this ListCardInfoData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListCardInfoData &&
            const DeepCollectionEquality().equals(other.list, list) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(list), count);

  @override
  String toString() {
    return 'ListCardInfoData(list: $list, count: $count)';
  }
}

/// @nodoc
abstract mixin class $ListCardInfoDataCopyWith<$Res> {
  factory $ListCardInfoDataCopyWith(
          ListCardInfoData value, $Res Function(ListCardInfoData) _then) =
      _$ListCardInfoDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'list') List<CardInfoItem>? list,
      @JsonKey(name: 'count') int? count});
}

/// @nodoc
class _$ListCardInfoDataCopyWithImpl<$Res>
    implements $ListCardInfoDataCopyWith<$Res> {
  _$ListCardInfoDataCopyWithImpl(this._self, this._then);

  final ListCardInfoData _self;
  final $Res Function(ListCardInfoData) _then;

  /// Create a copy of ListCardInfoData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = freezed,
    Object? count = freezed,
  }) {
    return _then(_self.copyWith(
      list: freezed == list
          ? _self.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<CardInfoItem>?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ListCardInfoData].
extension ListCardInfoDataPatterns on ListCardInfoData {
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
    TResult Function(_ListCardInfoData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoData() when $default != null:
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
    TResult Function(_ListCardInfoData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoData():
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
    TResult? Function(_ListCardInfoData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoData() when $default != null:
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
    TResult Function(@JsonKey(name: 'list') List<CardInfoItem>? list,
            @JsonKey(name: 'count') int? count)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoData() when $default != null:
        return $default(_that.list, _that.count);
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
    TResult Function(@JsonKey(name: 'list') List<CardInfoItem>? list,
            @JsonKey(name: 'count') int? count)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoData():
        return $default(_that.list, _that.count);
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
    TResult? Function(@JsonKey(name: 'list') List<CardInfoItem>? list,
            @JsonKey(name: 'count') int? count)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListCardInfoData() when $default != null:
        return $default(_that.list, _that.count);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ListCardInfoData implements ListCardInfoData {
  const _ListCardInfoData(
      {@JsonKey(name: 'list') final List<CardInfoItem>? list,
      @JsonKey(name: 'count') this.count})
      : _list = list;
  factory _ListCardInfoData.fromJson(Map<String, dynamic> json) =>
      _$ListCardInfoDataFromJson(json);

  final List<CardInfoItem>? _list;
  @override
  @JsonKey(name: 'list')
  List<CardInfoItem>? get list {
    final value = _list;
    if (value == null) return null;
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'count')
  final int? count;

  /// Create a copy of ListCardInfoData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListCardInfoDataCopyWith<_ListCardInfoData> get copyWith =>
      __$ListCardInfoDataCopyWithImpl<_ListCardInfoData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListCardInfoDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListCardInfoData &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), count);

  @override
  String toString() {
    return 'ListCardInfoData(list: $list, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$ListCardInfoDataCopyWith<$Res>
    implements $ListCardInfoDataCopyWith<$Res> {
  factory _$ListCardInfoDataCopyWith(
          _ListCardInfoData value, $Res Function(_ListCardInfoData) _then) =
      __$ListCardInfoDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'list') List<CardInfoItem>? list,
      @JsonKey(name: 'count') int? count});
}

/// @nodoc
class __$ListCardInfoDataCopyWithImpl<$Res>
    implements _$ListCardInfoDataCopyWith<$Res> {
  __$ListCardInfoDataCopyWithImpl(this._self, this._then);

  final _ListCardInfoData _self;
  final $Res Function(_ListCardInfoData) _then;

  /// Create a copy of ListCardInfoData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? list = freezed,
    Object? count = freezed,
  }) {
    return _then(_ListCardInfoData(
      list: freezed == list
          ? _self._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<CardInfoItem>?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$CardInfoItem {
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'pointVerify')
  int? get pointVerify;
  @JsonKey(name: 'imgPath')
  String? get imgPath;
  @JsonKey(name: 'name')
  String? get name;
  @JsonKey(name: 'status')
  CardStatusE? get status;
  @JsonKey(name: 'idNumber')
  String? get idNumber;
  @JsonKey(name: 'gender')
  GenderCardE? get gender;
  @JsonKey(name: 'nationality')
  String? get nationality;
  @JsonKey(name: 'refVisaType')
  String? get refVisaType;
  @JsonKey(name: 'issuedDate')
  String? get issuedDate;
  @JsonKey(name: 'digitalSignature')
  String? get digitalSignature;
  @JsonKey(name: 'phoneNumber')
  String? get phoneNumber;
  @JsonKey(name: 'qrCode')
  String? get qrCode;
  @JsonKey(name: 'shareLink')
  String? get shareLink;
  @JsonKey(name: 'address')
  String? get address;
  @JsonKey(name: 'issuingAuthority')
  String? get issuingAuthority;
  @JsonKey(name: 'blockHeight')
  String? get blockHeight;
  @JsonKey(name: 'txId')
  String? get txId;
  @JsonKey(name: 'did')
  String? get did;

  /// Create a copy of CardInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CardInfoItemCopyWith<CardInfoItem> get copyWith =>
      _$CardInfoItemCopyWithImpl<CardInfoItem>(
          this as CardInfoItem, _$identity);

  /// Serializes this CardInfoItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CardInfoItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pointVerify, pointVerify) ||
                other.pointVerify == pointVerify) &&
            (identical(other.imgPath, imgPath) || other.imgPath == imgPath) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.refVisaType, refVisaType) ||
                other.refVisaType == refVisaType) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.digitalSignature, digitalSignature) ||
                other.digitalSignature == digitalSignature) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.shareLink, shareLink) ||
                other.shareLink == shareLink) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.issuingAuthority, issuingAuthority) ||
                other.issuingAuthority == issuingAuthority) &&
            (identical(other.blockHeight, blockHeight) ||
                other.blockHeight == blockHeight) &&
            (identical(other.txId, txId) || other.txId == txId) &&
            (identical(other.did, did) || other.did == did));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        pointVerify,
        imgPath,
        name,
        status,
        idNumber,
        gender,
        nationality,
        refVisaType,
        issuedDate,
        digitalSignature,
        phoneNumber,
        qrCode,
        shareLink,
        address,
        issuingAuthority,
        blockHeight,
        txId,
        did
      ]);

  @override
  String toString() {
    return 'CardInfoItem(id: $id, pointVerify: $pointVerify, imgPath: $imgPath, name: $name, status: $status, idNumber: $idNumber, gender: $gender, nationality: $nationality, refVisaType: $refVisaType, issuedDate: $issuedDate, digitalSignature: $digitalSignature, phoneNumber: $phoneNumber, qrCode: $qrCode, shareLink: $shareLink, address: $address, issuingAuthority: $issuingAuthority, blockHeight: $blockHeight, txId: $txId, did: $did)';
  }
}

/// @nodoc
abstract mixin class $CardInfoItemCopyWith<$Res> {
  factory $CardInfoItemCopyWith(
          CardInfoItem value, $Res Function(CardInfoItem) _then) =
      _$CardInfoItemCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'pointVerify') int? pointVerify,
      @JsonKey(name: 'imgPath') String? imgPath,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'status') CardStatusE? status,
      @JsonKey(name: 'idNumber') String? idNumber,
      @JsonKey(name: 'gender') GenderCardE? gender,
      @JsonKey(name: 'nationality') String? nationality,
      @JsonKey(name: 'refVisaType') String? refVisaType,
      @JsonKey(name: 'issuedDate') String? issuedDate,
      @JsonKey(name: 'digitalSignature') String? digitalSignature,
      @JsonKey(name: 'phoneNumber') String? phoneNumber,
      @JsonKey(name: 'qrCode') String? qrCode,
      @JsonKey(name: 'shareLink') String? shareLink,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'issuingAuthority') String? issuingAuthority,
      @JsonKey(name: 'blockHeight') String? blockHeight,
      @JsonKey(name: 'txId') String? txId,
      @JsonKey(name: 'did') String? did});
}

/// @nodoc
class _$CardInfoItemCopyWithImpl<$Res> implements $CardInfoItemCopyWith<$Res> {
  _$CardInfoItemCopyWithImpl(this._self, this._then);

  final CardInfoItem _self;
  final $Res Function(CardInfoItem) _then;

  /// Create a copy of CardInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pointVerify = freezed,
    Object? imgPath = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? idNumber = freezed,
    Object? gender = freezed,
    Object? nationality = freezed,
    Object? refVisaType = freezed,
    Object? issuedDate = freezed,
    Object? digitalSignature = freezed,
    Object? phoneNumber = freezed,
    Object? qrCode = freezed,
    Object? shareLink = freezed,
    Object? address = freezed,
    Object? issuingAuthority = freezed,
    Object? blockHeight = freezed,
    Object? txId = freezed,
    Object? did = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pointVerify: freezed == pointVerify
          ? _self.pointVerify
          : pointVerify // ignore: cast_nullable_to_non_nullable
              as int?,
      imgPath: freezed == imgPath
          ? _self.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CardStatusE?,
      idNumber: freezed == idNumber
          ? _self.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderCardE?,
      nationality: freezed == nationality
          ? _self.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      refVisaType: freezed == refVisaType
          ? _self.refVisaType
          : refVisaType // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _self.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalSignature: freezed == digitalSignature
          ? _self.digitalSignature
          : digitalSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _self.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shareLink: freezed == shareLink
          ? _self.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      issuingAuthority: freezed == issuingAuthority
          ? _self.issuingAuthority
          : issuingAuthority // ignore: cast_nullable_to_non_nullable
              as String?,
      blockHeight: freezed == blockHeight
          ? _self.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as String?,
      txId: freezed == txId
          ? _self.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as String?,
      did: freezed == did
          ? _self.did
          : did // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CardInfoItem].
extension CardInfoItemPatterns on CardInfoItem {
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
    TResult Function(_CardInfoItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CardInfoItem() when $default != null:
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
    TResult Function(_CardInfoItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CardInfoItem():
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
    TResult? Function(_CardInfoItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CardInfoItem() when $default != null:
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
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'pointVerify') int? pointVerify,
            @JsonKey(name: 'imgPath') String? imgPath,
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'status') CardStatusE? status,
            @JsonKey(name: 'idNumber') String? idNumber,
            @JsonKey(name: 'gender') GenderCardE? gender,
            @JsonKey(name: 'nationality') String? nationality,
            @JsonKey(name: 'refVisaType') String? refVisaType,
            @JsonKey(name: 'issuedDate') String? issuedDate,
            @JsonKey(name: 'digitalSignature') String? digitalSignature,
            @JsonKey(name: 'phoneNumber') String? phoneNumber,
            @JsonKey(name: 'qrCode') String? qrCode,
            @JsonKey(name: 'shareLink') String? shareLink,
            @JsonKey(name: 'address') String? address,
            @JsonKey(name: 'issuingAuthority') String? issuingAuthority,
            @JsonKey(name: 'blockHeight') String? blockHeight,
            @JsonKey(name: 'txId') String? txId,
            @JsonKey(name: 'did') String? did)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CardInfoItem() when $default != null:
        return $default(
            _that.id,
            _that.pointVerify,
            _that.imgPath,
            _that.name,
            _that.status,
            _that.idNumber,
            _that.gender,
            _that.nationality,
            _that.refVisaType,
            _that.issuedDate,
            _that.digitalSignature,
            _that.phoneNumber,
            _that.qrCode,
            _that.shareLink,
            _that.address,
            _that.issuingAuthority,
            _that.blockHeight,
            _that.txId,
            _that.did);
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
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'pointVerify') int? pointVerify,
            @JsonKey(name: 'imgPath') String? imgPath,
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'status') CardStatusE? status,
            @JsonKey(name: 'idNumber') String? idNumber,
            @JsonKey(name: 'gender') GenderCardE? gender,
            @JsonKey(name: 'nationality') String? nationality,
            @JsonKey(name: 'refVisaType') String? refVisaType,
            @JsonKey(name: 'issuedDate') String? issuedDate,
            @JsonKey(name: 'digitalSignature') String? digitalSignature,
            @JsonKey(name: 'phoneNumber') String? phoneNumber,
            @JsonKey(name: 'qrCode') String? qrCode,
            @JsonKey(name: 'shareLink') String? shareLink,
            @JsonKey(name: 'address') String? address,
            @JsonKey(name: 'issuingAuthority') String? issuingAuthority,
            @JsonKey(name: 'blockHeight') String? blockHeight,
            @JsonKey(name: 'txId') String? txId,
            @JsonKey(name: 'did') String? did)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CardInfoItem():
        return $default(
            _that.id,
            _that.pointVerify,
            _that.imgPath,
            _that.name,
            _that.status,
            _that.idNumber,
            _that.gender,
            _that.nationality,
            _that.refVisaType,
            _that.issuedDate,
            _that.digitalSignature,
            _that.phoneNumber,
            _that.qrCode,
            _that.shareLink,
            _that.address,
            _that.issuingAuthority,
            _that.blockHeight,
            _that.txId,
            _that.did);
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
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'pointVerify') int? pointVerify,
            @JsonKey(name: 'imgPath') String? imgPath,
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'status') CardStatusE? status,
            @JsonKey(name: 'idNumber') String? idNumber,
            @JsonKey(name: 'gender') GenderCardE? gender,
            @JsonKey(name: 'nationality') String? nationality,
            @JsonKey(name: 'refVisaType') String? refVisaType,
            @JsonKey(name: 'issuedDate') String? issuedDate,
            @JsonKey(name: 'digitalSignature') String? digitalSignature,
            @JsonKey(name: 'phoneNumber') String? phoneNumber,
            @JsonKey(name: 'qrCode') String? qrCode,
            @JsonKey(name: 'shareLink') String? shareLink,
            @JsonKey(name: 'address') String? address,
            @JsonKey(name: 'issuingAuthority') String? issuingAuthority,
            @JsonKey(name: 'blockHeight') String? blockHeight,
            @JsonKey(name: 'txId') String? txId,
            @JsonKey(name: 'did') String? did)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CardInfoItem() when $default != null:
        return $default(
            _that.id,
            _that.pointVerify,
            _that.imgPath,
            _that.name,
            _that.status,
            _that.idNumber,
            _that.gender,
            _that.nationality,
            _that.refVisaType,
            _that.issuedDate,
            _that.digitalSignature,
            _that.phoneNumber,
            _that.qrCode,
            _that.shareLink,
            _that.address,
            _that.issuingAuthority,
            _that.blockHeight,
            _that.txId,
            _that.did);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CardInfoItem implements CardInfoItem {
  const _CardInfoItem(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'pointVerify') this.pointVerify,
      @JsonKey(name: 'imgPath') this.imgPath,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'idNumber') this.idNumber,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'nationality') this.nationality,
      @JsonKey(name: 'refVisaType') this.refVisaType,
      @JsonKey(name: 'issuedDate') this.issuedDate,
      @JsonKey(name: 'digitalSignature') this.digitalSignature,
      @JsonKey(name: 'phoneNumber') this.phoneNumber,
      @JsonKey(name: 'qrCode') this.qrCode,
      @JsonKey(name: 'shareLink') this.shareLink,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'issuingAuthority') this.issuingAuthority,
      @JsonKey(name: 'blockHeight') this.blockHeight,
      @JsonKey(name: 'txId') this.txId,
      @JsonKey(name: 'did') this.did});
  factory _CardInfoItem.fromJson(Map<String, dynamic> json) =>
      _$CardInfoItemFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'pointVerify')
  final int? pointVerify;
  @override
  @JsonKey(name: 'imgPath')
  final String? imgPath;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'status')
  final CardStatusE? status;
  @override
  @JsonKey(name: 'idNumber')
  final String? idNumber;
  @override
  @JsonKey(name: 'gender')
  final GenderCardE? gender;
  @override
  @JsonKey(name: 'nationality')
  final String? nationality;
  @override
  @JsonKey(name: 'refVisaType')
  final String? refVisaType;
  @override
  @JsonKey(name: 'issuedDate')
  final String? issuedDate;
  @override
  @JsonKey(name: 'digitalSignature')
  final String? digitalSignature;
  @override
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'qrCode')
  final String? qrCode;
  @override
  @JsonKey(name: 'shareLink')
  final String? shareLink;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'issuingAuthority')
  final String? issuingAuthority;
  @override
  @JsonKey(name: 'blockHeight')
  final String? blockHeight;
  @override
  @JsonKey(name: 'txId')
  final String? txId;
  @override
  @JsonKey(name: 'did')
  final String? did;

  /// Create a copy of CardInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CardInfoItemCopyWith<_CardInfoItem> get copyWith =>
      __$CardInfoItemCopyWithImpl<_CardInfoItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CardInfoItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CardInfoItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pointVerify, pointVerify) ||
                other.pointVerify == pointVerify) &&
            (identical(other.imgPath, imgPath) || other.imgPath == imgPath) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.refVisaType, refVisaType) ||
                other.refVisaType == refVisaType) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.digitalSignature, digitalSignature) ||
                other.digitalSignature == digitalSignature) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.shareLink, shareLink) ||
                other.shareLink == shareLink) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.issuingAuthority, issuingAuthority) ||
                other.issuingAuthority == issuingAuthority) &&
            (identical(other.blockHeight, blockHeight) ||
                other.blockHeight == blockHeight) &&
            (identical(other.txId, txId) || other.txId == txId) &&
            (identical(other.did, did) || other.did == did));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        pointVerify,
        imgPath,
        name,
        status,
        idNumber,
        gender,
        nationality,
        refVisaType,
        issuedDate,
        digitalSignature,
        phoneNumber,
        qrCode,
        shareLink,
        address,
        issuingAuthority,
        blockHeight,
        txId,
        did
      ]);

  @override
  String toString() {
    return 'CardInfoItem(id: $id, pointVerify: $pointVerify, imgPath: $imgPath, name: $name, status: $status, idNumber: $idNumber, gender: $gender, nationality: $nationality, refVisaType: $refVisaType, issuedDate: $issuedDate, digitalSignature: $digitalSignature, phoneNumber: $phoneNumber, qrCode: $qrCode, shareLink: $shareLink, address: $address, issuingAuthority: $issuingAuthority, blockHeight: $blockHeight, txId: $txId, did: $did)';
  }
}

/// @nodoc
abstract mixin class _$CardInfoItemCopyWith<$Res>
    implements $CardInfoItemCopyWith<$Res> {
  factory _$CardInfoItemCopyWith(
          _CardInfoItem value, $Res Function(_CardInfoItem) _then) =
      __$CardInfoItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'pointVerify') int? pointVerify,
      @JsonKey(name: 'imgPath') String? imgPath,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'status') CardStatusE? status,
      @JsonKey(name: 'idNumber') String? idNumber,
      @JsonKey(name: 'gender') GenderCardE? gender,
      @JsonKey(name: 'nationality') String? nationality,
      @JsonKey(name: 'refVisaType') String? refVisaType,
      @JsonKey(name: 'issuedDate') String? issuedDate,
      @JsonKey(name: 'digitalSignature') String? digitalSignature,
      @JsonKey(name: 'phoneNumber') String? phoneNumber,
      @JsonKey(name: 'qrCode') String? qrCode,
      @JsonKey(name: 'shareLink') String? shareLink,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'issuingAuthority') String? issuingAuthority,
      @JsonKey(name: 'blockHeight') String? blockHeight,
      @JsonKey(name: 'txId') String? txId,
      @JsonKey(name: 'did') String? did});
}

/// @nodoc
class __$CardInfoItemCopyWithImpl<$Res>
    implements _$CardInfoItemCopyWith<$Res> {
  __$CardInfoItemCopyWithImpl(this._self, this._then);

  final _CardInfoItem _self;
  final $Res Function(_CardInfoItem) _then;

  /// Create a copy of CardInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? pointVerify = freezed,
    Object? imgPath = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? idNumber = freezed,
    Object? gender = freezed,
    Object? nationality = freezed,
    Object? refVisaType = freezed,
    Object? issuedDate = freezed,
    Object? digitalSignature = freezed,
    Object? phoneNumber = freezed,
    Object? qrCode = freezed,
    Object? shareLink = freezed,
    Object? address = freezed,
    Object? issuingAuthority = freezed,
    Object? blockHeight = freezed,
    Object? txId = freezed,
    Object? did = freezed,
  }) {
    return _then(_CardInfoItem(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pointVerify: freezed == pointVerify
          ? _self.pointVerify
          : pointVerify // ignore: cast_nullable_to_non_nullable
              as int?,
      imgPath: freezed == imgPath
          ? _self.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CardStatusE?,
      idNumber: freezed == idNumber
          ? _self.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderCardE?,
      nationality: freezed == nationality
          ? _self.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      refVisaType: freezed == refVisaType
          ? _self.refVisaType
          : refVisaType // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _self.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalSignature: freezed == digitalSignature
          ? _self.digitalSignature
          : digitalSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _self.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shareLink: freezed == shareLink
          ? _self.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      issuingAuthority: freezed == issuingAuthority
          ? _self.issuingAuthority
          : issuingAuthority // ignore: cast_nullable_to_non_nullable
              as String?,
      blockHeight: freezed == blockHeight
          ? _self.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as String?,
      txId: freezed == txId
          ? _self.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as String?,
      did: freezed == did
          ? _self.did
          : did // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

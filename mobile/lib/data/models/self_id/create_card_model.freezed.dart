// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateCardRequest {
  @JsonKey(name: 'cardId')
  int? get cardId;
  @JsonKey(name: 'name')
  String? get name;
  @JsonKey(name: 'idNumber')
  String? get idNumber;
  @JsonKey(name: 'address')
  String? get address;
  @JsonKey(name: 'issuingAuthority')
  String? get issuingAuthority;
  @JsonKey(name: 'issuedDate')
  String? get issuedDate;
  @JsonKey(name: 'phoneNumber')
  String? get phoneNumber;
  @JsonKey(name: 'gender')
  GenderCardE? get gender;
  @JsonKey(name: 'imgBase64')
  String? get imgBase64;
  @JsonKey(name: 'licenseNumber')
  String? get licenseNumber;
  @JsonKey(name: 'licenseValidity')
  String? get licenseValidity;
  @JsonKey(name: 'expirationDatePassport')
  String? get expirationDatePassport;
  @JsonKey(name: 'dateOfBirth')
  String? get dateOfBirth;

  /// Create a copy of CreateCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateCardRequestCopyWith<CreateCardRequest> get copyWith =>
      _$CreateCardRequestCopyWithImpl<CreateCardRequest>(
          this as CreateCardRequest, _$identity);

  /// Serializes this CreateCardRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateCardRequest &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.issuingAuthority, issuingAuthority) ||
                other.issuingAuthority == issuingAuthority) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.imgBase64, imgBase64) ||
                other.imgBase64 == imgBase64) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.licenseValidity, licenseValidity) ||
                other.licenseValidity == licenseValidity) &&
            (identical(other.expirationDatePassport, expirationDatePassport) ||
                other.expirationDatePassport == expirationDatePassport) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cardId,
      name,
      idNumber,
      address,
      issuingAuthority,
      issuedDate,
      phoneNumber,
      gender,
      imgBase64,
      licenseNumber,
      licenseValidity,
      expirationDatePassport,
      dateOfBirth);

  @override
  String toString() {
    return 'CreateCardRequest(cardId: $cardId, name: $name, idNumber: $idNumber, address: $address, issuingAuthority: $issuingAuthority, issuedDate: $issuedDate, phoneNumber: $phoneNumber, gender: $gender, imgBase64: $imgBase64, licenseNumber: $licenseNumber, licenseValidity: $licenseValidity, expirationDatePassport: $expirationDatePassport, dateOfBirth: $dateOfBirth)';
  }
}

/// @nodoc
abstract mixin class $CreateCardRequestCopyWith<$Res> {
  factory $CreateCardRequestCopyWith(
          CreateCardRequest value, $Res Function(CreateCardRequest) _then) =
      _$CreateCardRequestCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'cardId') int? cardId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'idNumber') String? idNumber,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'issuingAuthority') String? issuingAuthority,
      @JsonKey(name: 'issuedDate') String? issuedDate,
      @JsonKey(name: 'phoneNumber') String? phoneNumber,
      @JsonKey(name: 'gender') GenderCardE? gender,
      @JsonKey(name: 'imgBase64') String? imgBase64,
      @JsonKey(name: 'licenseNumber') String? licenseNumber,
      @JsonKey(name: 'licenseValidity') String? licenseValidity,
      @JsonKey(name: 'expirationDatePassport') String? expirationDatePassport,
      @JsonKey(name: 'dateOfBirth') String? dateOfBirth});
}

/// @nodoc
class _$CreateCardRequestCopyWithImpl<$Res>
    implements $CreateCardRequestCopyWith<$Res> {
  _$CreateCardRequestCopyWithImpl(this._self, this._then);

  final CreateCardRequest _self;
  final $Res Function(CreateCardRequest) _then;

  /// Create a copy of CreateCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = freezed,
    Object? name = freezed,
    Object? idNumber = freezed,
    Object? address = freezed,
    Object? issuingAuthority = freezed,
    Object? issuedDate = freezed,
    Object? phoneNumber = freezed,
    Object? gender = freezed,
    Object? imgBase64 = freezed,
    Object? licenseNumber = freezed,
    Object? licenseValidity = freezed,
    Object? expirationDatePassport = freezed,
    Object? dateOfBirth = freezed,
  }) {
    return _then(_self.copyWith(
      cardId: freezed == cardId
          ? _self.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: freezed == idNumber
          ? _self.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      issuingAuthority: freezed == issuingAuthority
          ? _self.issuingAuthority
          : issuingAuthority // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _self.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderCardE?,
      imgBase64: freezed == imgBase64
          ? _self.imgBase64
          : imgBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _self.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseValidity: freezed == licenseValidity
          ? _self.licenseValidity
          : licenseValidity // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationDatePassport: freezed == expirationDatePassport
          ? _self.expirationDatePassport
          : expirationDatePassport // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateCardRequest].
extension CreateCardRequestPatterns on CreateCardRequest {
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
    TResult Function(_CreateCardRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateCardRequest() when $default != null:
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
    TResult Function(_CreateCardRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCardRequest():
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
    TResult? Function(_CreateCardRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCardRequest() when $default != null:
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
            @JsonKey(name: 'cardId') int? cardId,
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'idNumber') String? idNumber,
            @JsonKey(name: 'address') String? address,
            @JsonKey(name: 'issuingAuthority') String? issuingAuthority,
            @JsonKey(name: 'issuedDate') String? issuedDate,
            @JsonKey(name: 'phoneNumber') String? phoneNumber,
            @JsonKey(name: 'gender') GenderCardE? gender,
            @JsonKey(name: 'imgBase64') String? imgBase64,
            @JsonKey(name: 'licenseNumber') String? licenseNumber,
            @JsonKey(name: 'licenseValidity') String? licenseValidity,
            @JsonKey(name: 'expirationDatePassport')
            String? expirationDatePassport,
            @JsonKey(name: 'dateOfBirth') String? dateOfBirth)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateCardRequest() when $default != null:
        return $default(
            _that.cardId,
            _that.name,
            _that.idNumber,
            _that.address,
            _that.issuingAuthority,
            _that.issuedDate,
            _that.phoneNumber,
            _that.gender,
            _that.imgBase64,
            _that.licenseNumber,
            _that.licenseValidity,
            _that.expirationDatePassport,
            _that.dateOfBirth);
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
            @JsonKey(name: 'cardId') int? cardId,
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'idNumber') String? idNumber,
            @JsonKey(name: 'address') String? address,
            @JsonKey(name: 'issuingAuthority') String? issuingAuthority,
            @JsonKey(name: 'issuedDate') String? issuedDate,
            @JsonKey(name: 'phoneNumber') String? phoneNumber,
            @JsonKey(name: 'gender') GenderCardE? gender,
            @JsonKey(name: 'imgBase64') String? imgBase64,
            @JsonKey(name: 'licenseNumber') String? licenseNumber,
            @JsonKey(name: 'licenseValidity') String? licenseValidity,
            @JsonKey(name: 'expirationDatePassport')
            String? expirationDatePassport,
            @JsonKey(name: 'dateOfBirth') String? dateOfBirth)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCardRequest():
        return $default(
            _that.cardId,
            _that.name,
            _that.idNumber,
            _that.address,
            _that.issuingAuthority,
            _that.issuedDate,
            _that.phoneNumber,
            _that.gender,
            _that.imgBase64,
            _that.licenseNumber,
            _that.licenseValidity,
            _that.expirationDatePassport,
            _that.dateOfBirth);
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
            @JsonKey(name: 'cardId') int? cardId,
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'idNumber') String? idNumber,
            @JsonKey(name: 'address') String? address,
            @JsonKey(name: 'issuingAuthority') String? issuingAuthority,
            @JsonKey(name: 'issuedDate') String? issuedDate,
            @JsonKey(name: 'phoneNumber') String? phoneNumber,
            @JsonKey(name: 'gender') GenderCardE? gender,
            @JsonKey(name: 'imgBase64') String? imgBase64,
            @JsonKey(name: 'licenseNumber') String? licenseNumber,
            @JsonKey(name: 'licenseValidity') String? licenseValidity,
            @JsonKey(name: 'expirationDatePassport')
            String? expirationDatePassport,
            @JsonKey(name: 'dateOfBirth') String? dateOfBirth)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCardRequest() when $default != null:
        return $default(
            _that.cardId,
            _that.name,
            _that.idNumber,
            _that.address,
            _that.issuingAuthority,
            _that.issuedDate,
            _that.phoneNumber,
            _that.gender,
            _that.imgBase64,
            _that.licenseNumber,
            _that.licenseValidity,
            _that.expirationDatePassport,
            _that.dateOfBirth);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateCardRequest implements CreateCardRequest {
  const _CreateCardRequest(
      {@JsonKey(name: 'cardId') this.cardId,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'idNumber') this.idNumber,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'issuingAuthority') this.issuingAuthority,
      @JsonKey(name: 'issuedDate') this.issuedDate,
      @JsonKey(name: 'phoneNumber') this.phoneNumber,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'imgBase64') this.imgBase64,
      @JsonKey(name: 'licenseNumber') this.licenseNumber,
      @JsonKey(name: 'licenseValidity') this.licenseValidity,
      @JsonKey(name: 'expirationDatePassport') this.expirationDatePassport,
      @JsonKey(name: 'dateOfBirth') this.dateOfBirth});
  factory _CreateCardRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCardRequestFromJson(json);

  @override
  @JsonKey(name: 'cardId')
  final int? cardId;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'idNumber')
  final String? idNumber;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'issuingAuthority')
  final String? issuingAuthority;
  @override
  @JsonKey(name: 'issuedDate')
  final String? issuedDate;
  @override
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'gender')
  final GenderCardE? gender;
  @override
  @JsonKey(name: 'imgBase64')
  final String? imgBase64;
  @override
  @JsonKey(name: 'licenseNumber')
  final String? licenseNumber;
  @override
  @JsonKey(name: 'licenseValidity')
  final String? licenseValidity;
  @override
  @JsonKey(name: 'expirationDatePassport')
  final String? expirationDatePassport;
  @override
  @JsonKey(name: 'dateOfBirth')
  final String? dateOfBirth;

  /// Create a copy of CreateCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateCardRequestCopyWith<_CreateCardRequest> get copyWith =>
      __$CreateCardRequestCopyWithImpl<_CreateCardRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateCardRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateCardRequest &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.issuingAuthority, issuingAuthority) ||
                other.issuingAuthority == issuingAuthority) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.imgBase64, imgBase64) ||
                other.imgBase64 == imgBase64) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.licenseValidity, licenseValidity) ||
                other.licenseValidity == licenseValidity) &&
            (identical(other.expirationDatePassport, expirationDatePassport) ||
                other.expirationDatePassport == expirationDatePassport) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cardId,
      name,
      idNumber,
      address,
      issuingAuthority,
      issuedDate,
      phoneNumber,
      gender,
      imgBase64,
      licenseNumber,
      licenseValidity,
      expirationDatePassport,
      dateOfBirth);

  @override
  String toString() {
    return 'CreateCardRequest(cardId: $cardId, name: $name, idNumber: $idNumber, address: $address, issuingAuthority: $issuingAuthority, issuedDate: $issuedDate, phoneNumber: $phoneNumber, gender: $gender, imgBase64: $imgBase64, licenseNumber: $licenseNumber, licenseValidity: $licenseValidity, expirationDatePassport: $expirationDatePassport, dateOfBirth: $dateOfBirth)';
  }
}

/// @nodoc
abstract mixin class _$CreateCardRequestCopyWith<$Res>
    implements $CreateCardRequestCopyWith<$Res> {
  factory _$CreateCardRequestCopyWith(
          _CreateCardRequest value, $Res Function(_CreateCardRequest) _then) =
      __$CreateCardRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cardId') int? cardId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'idNumber') String? idNumber,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'issuingAuthority') String? issuingAuthority,
      @JsonKey(name: 'issuedDate') String? issuedDate,
      @JsonKey(name: 'phoneNumber') String? phoneNumber,
      @JsonKey(name: 'gender') GenderCardE? gender,
      @JsonKey(name: 'imgBase64') String? imgBase64,
      @JsonKey(name: 'licenseNumber') String? licenseNumber,
      @JsonKey(name: 'licenseValidity') String? licenseValidity,
      @JsonKey(name: 'expirationDatePassport') String? expirationDatePassport,
      @JsonKey(name: 'dateOfBirth') String? dateOfBirth});
}

/// @nodoc
class __$CreateCardRequestCopyWithImpl<$Res>
    implements _$CreateCardRequestCopyWith<$Res> {
  __$CreateCardRequestCopyWithImpl(this._self, this._then);

  final _CreateCardRequest _self;
  final $Res Function(_CreateCardRequest) _then;

  /// Create a copy of CreateCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cardId = freezed,
    Object? name = freezed,
    Object? idNumber = freezed,
    Object? address = freezed,
    Object? issuingAuthority = freezed,
    Object? issuedDate = freezed,
    Object? phoneNumber = freezed,
    Object? gender = freezed,
    Object? imgBase64 = freezed,
    Object? licenseNumber = freezed,
    Object? licenseValidity = freezed,
    Object? expirationDatePassport = freezed,
    Object? dateOfBirth = freezed,
  }) {
    return _then(_CreateCardRequest(
      cardId: freezed == cardId
          ? _self.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: freezed == idNumber
          ? _self.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      issuingAuthority: freezed == issuingAuthority
          ? _self.issuingAuthority
          : issuingAuthority // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _self.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderCardE?,
      imgBase64: freezed == imgBase64
          ? _self.imgBase64
          : imgBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _self.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseValidity: freezed == licenseValidity
          ? _self.licenseValidity
          : licenseValidity // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationDatePassport: freezed == expirationDatePassport
          ? _self.expirationDatePassport
          : expirationDatePassport // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$CreateCardResponse {
  @JsonKey(name: 'status')
  int? get status;
  @JsonKey(name: 'errorCode')
  String? get errorCode;
  @JsonKey(name: 'errorDesc')
  String? get errorDesc;
  @JsonKey(name: 'data')
  CreateCardData? get data;

  /// Create a copy of CreateCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateCardResponseCopyWith<CreateCardResponse> get copyWith =>
      _$CreateCardResponseCopyWithImpl<CreateCardResponse>(
          this as CreateCardResponse, _$identity);

  /// Serializes this CreateCardResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateCardResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.errorDesc, errorDesc) ||
                other.errorDesc == errorDesc) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorCode, errorDesc, data);

  @override
  String toString() {
    return 'CreateCardResponse(status: $status, errorCode: $errorCode, errorDesc: $errorDesc, data: $data)';
  }
}

/// @nodoc
abstract mixin class $CreateCardResponseCopyWith<$Res> {
  factory $CreateCardResponseCopyWith(
          CreateCardResponse value, $Res Function(CreateCardResponse) _then) =
      _$CreateCardResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'errorCode') String? errorCode,
      @JsonKey(name: 'errorDesc') String? errorDesc,
      @JsonKey(name: 'data') CreateCardData? data});

  $CreateCardDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CreateCardResponseCopyWithImpl<$Res>
    implements $CreateCardResponseCopyWith<$Res> {
  _$CreateCardResponseCopyWithImpl(this._self, this._then);

  final CreateCardResponse _self;
  final $Res Function(CreateCardResponse) _then;

  /// Create a copy of CreateCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? errorCode = freezed,
    Object? errorDesc = freezed,
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
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as CreateCardData?,
    ));
  }

  /// Create a copy of CreateCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateCardDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $CreateCardDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CreateCardResponse].
extension CreateCardResponsePatterns on CreateCardResponse {
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
    TResult Function(_CreateCardResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateCardResponse() when $default != null:
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
    TResult Function(_CreateCardResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCardResponse():
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
    TResult? Function(_CreateCardResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCardResponse() when $default != null:
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
            @JsonKey(name: 'data') CreateCardData? data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateCardResponse() when $default != null:
        return $default(
            _that.status, _that.errorCode, _that.errorDesc, _that.data);
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
            @JsonKey(name: 'data') CreateCardData? data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCardResponse():
        return $default(
            _that.status, _that.errorCode, _that.errorDesc, _that.data);
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
            @JsonKey(name: 'data') CreateCardData? data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCardResponse() when $default != null:
        return $default(
            _that.status, _that.errorCode, _that.errorDesc, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateCardResponse implements CreateCardResponse {
  const _CreateCardResponse(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'errorCode') this.errorCode,
      @JsonKey(name: 'errorDesc') this.errorDesc,
      @JsonKey(name: 'data') this.data});
  factory _CreateCardResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCardResponseFromJson(json);

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
  @JsonKey(name: 'data')
  final CreateCardData? data;

  /// Create a copy of CreateCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateCardResponseCopyWith<_CreateCardResponse> get copyWith =>
      __$CreateCardResponseCopyWithImpl<_CreateCardResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateCardResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateCardResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.errorDesc, errorDesc) ||
                other.errorDesc == errorDesc) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorCode, errorDesc, data);

  @override
  String toString() {
    return 'CreateCardResponse(status: $status, errorCode: $errorCode, errorDesc: $errorDesc, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$CreateCardResponseCopyWith<$Res>
    implements $CreateCardResponseCopyWith<$Res> {
  factory _$CreateCardResponseCopyWith(
          _CreateCardResponse value, $Res Function(_CreateCardResponse) _then) =
      __$CreateCardResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int? status,
      @JsonKey(name: 'errorCode') String? errorCode,
      @JsonKey(name: 'errorDesc') String? errorDesc,
      @JsonKey(name: 'data') CreateCardData? data});

  @override
  $CreateCardDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$CreateCardResponseCopyWithImpl<$Res>
    implements _$CreateCardResponseCopyWith<$Res> {
  __$CreateCardResponseCopyWithImpl(this._self, this._then);

  final _CreateCardResponse _self;
  final $Res Function(_CreateCardResponse) _then;

  /// Create a copy of CreateCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = freezed,
    Object? errorCode = freezed,
    Object? errorDesc = freezed,
    Object? data = freezed,
  }) {
    return _then(_CreateCardResponse(
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
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as CreateCardData?,
    ));
  }

  /// Create a copy of CreateCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateCardDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $CreateCardDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$CreateCardData {
  @JsonKey(name: 'id')
  int? get cardId;
  @JsonKey(name: 'accessToken')
  String? get accessToken;

  /// Create a copy of CreateCardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateCardDataCopyWith<CreateCardData> get copyWith =>
      _$CreateCardDataCopyWithImpl<CreateCardData>(
          this as CreateCardData, _$identity);

  /// Serializes this CreateCardData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateCardData &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cardId, accessToken);

  @override
  String toString() {
    return 'CreateCardData(cardId: $cardId, accessToken: $accessToken)';
  }
}

/// @nodoc
abstract mixin class $CreateCardDataCopyWith<$Res> {
  factory $CreateCardDataCopyWith(
          CreateCardData value, $Res Function(CreateCardData) _then) =
      _$CreateCardDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? cardId,
      @JsonKey(name: 'accessToken') String? accessToken});
}

/// @nodoc
class _$CreateCardDataCopyWithImpl<$Res>
    implements $CreateCardDataCopyWith<$Res> {
  _$CreateCardDataCopyWithImpl(this._self, this._then);

  final CreateCardData _self;
  final $Res Function(CreateCardData) _then;

  /// Create a copy of CreateCardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_self.copyWith(
      cardId: freezed == cardId
          ? _self.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int?,
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateCardData].
extension CreateCardDataPatterns on CreateCardData {
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
    TResult Function(_CreateCardData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateCardData() when $default != null:
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
    TResult Function(_CreateCardData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCardData():
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
    TResult? Function(_CreateCardData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCardData() when $default != null:
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
    TResult Function(@JsonKey(name: 'id') int? cardId,
            @JsonKey(name: 'accessToken') String? accessToken)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateCardData() when $default != null:
        return $default(_that.cardId, _that.accessToken);
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
    TResult Function(@JsonKey(name: 'id') int? cardId,
            @JsonKey(name: 'accessToken') String? accessToken)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCardData():
        return $default(_that.cardId, _that.accessToken);
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
    TResult? Function(@JsonKey(name: 'id') int? cardId,
            @JsonKey(name: 'accessToken') String? accessToken)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCardData() when $default != null:
        return $default(_that.cardId, _that.accessToken);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateCardData implements CreateCardData {
  const _CreateCardData(
      {@JsonKey(name: 'id') this.cardId,
      @JsonKey(name: 'accessToken') this.accessToken});
  factory _CreateCardData.fromJson(Map<String, dynamic> json) =>
      _$CreateCardDataFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? cardId;
  @override
  @JsonKey(name: 'accessToken')
  final String? accessToken;

  /// Create a copy of CreateCardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateCardDataCopyWith<_CreateCardData> get copyWith =>
      __$CreateCardDataCopyWithImpl<_CreateCardData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateCardDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateCardData &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cardId, accessToken);

  @override
  String toString() {
    return 'CreateCardData(cardId: $cardId, accessToken: $accessToken)';
  }
}

/// @nodoc
abstract mixin class _$CreateCardDataCopyWith<$Res>
    implements $CreateCardDataCopyWith<$Res> {
  factory _$CreateCardDataCopyWith(
          _CreateCardData value, $Res Function(_CreateCardData) _then) =
      __$CreateCardDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? cardId,
      @JsonKey(name: 'accessToken') String? accessToken});
}

/// @nodoc
class __$CreateCardDataCopyWithImpl<$Res>
    implements _$CreateCardDataCopyWith<$Res> {
  __$CreateCardDataCopyWithImpl(this._self, this._then);

  final _CreateCardData _self;
  final $Res Function(_CreateCardData) _then;

  /// Create a copy of CreateCardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cardId = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_CreateCardData(
      cardId: freezed == cardId
          ? _self.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int?,
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

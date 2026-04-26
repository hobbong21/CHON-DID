// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'id_generation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IdGenerationState {
  IdGenStage get stage;
  bool get isLoading;
  String get errorMessage;
  bool get verificationFailed;
  IdGenType get idType;
  String get fullName;
  String get idNumber;
  String get address;
  String get issuedDate;
  String get issuingAuthority;
  String? get frontImageBase64;
  String? get backImageBase64;
  KoreanIdCard? get ocrResult;

  /// Create a copy of IdGenerationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IdGenerationStateCopyWith<IdGenerationState> get copyWith =>
      _$IdGenerationStateCopyWithImpl<IdGenerationState>(
          this as IdGenerationState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IdGenerationState &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.verificationFailed, verificationFailed) ||
                other.verificationFailed == verificationFailed) &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.issuingAuthority, issuingAuthority) ||
                other.issuingAuthority == issuingAuthority) &&
            (identical(other.frontImageBase64, frontImageBase64) ||
                other.frontImageBase64 == frontImageBase64) &&
            (identical(other.backImageBase64, backImageBase64) ||
                other.backImageBase64 == backImageBase64) &&
            (identical(other.ocrResult, ocrResult) ||
                other.ocrResult == ocrResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stage,
      isLoading,
      errorMessage,
      verificationFailed,
      idType,
      fullName,
      idNumber,
      address,
      issuedDate,
      issuingAuthority,
      frontImageBase64,
      backImageBase64,
      ocrResult);

  @override
  String toString() {
    return 'IdGenerationState(stage: $stage, isLoading: $isLoading, errorMessage: $errorMessage, verificationFailed: $verificationFailed, idType: $idType, fullName: $fullName, idNumber: $idNumber, address: $address, issuedDate: $issuedDate, issuingAuthority: $issuingAuthority, frontImageBase64: $frontImageBase64, backImageBase64: $backImageBase64, ocrResult: $ocrResult)';
  }
}

/// @nodoc
abstract mixin class $IdGenerationStateCopyWith<$Res> {
  factory $IdGenerationStateCopyWith(
          IdGenerationState value, $Res Function(IdGenerationState) _then) =
      _$IdGenerationStateCopyWithImpl;
  @useResult
  $Res call(
      {IdGenStage stage,
      bool isLoading,
      String errorMessage,
      bool verificationFailed,
      IdGenType idType,
      String fullName,
      String idNumber,
      String address,
      String issuedDate,
      String issuingAuthority,
      String? frontImageBase64,
      String? backImageBase64,
      KoreanIdCard? ocrResult});
}

/// @nodoc
class _$IdGenerationStateCopyWithImpl<$Res>
    implements $IdGenerationStateCopyWith<$Res> {
  _$IdGenerationStateCopyWithImpl(this._self, this._then);

  final IdGenerationState _self;
  final $Res Function(IdGenerationState) _then;

  /// Create a copy of IdGenerationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? verificationFailed = null,
    Object? idType = null,
    Object? fullName = null,
    Object? idNumber = null,
    Object? address = null,
    Object? issuedDate = null,
    Object? issuingAuthority = null,
    Object? frontImageBase64 = freezed,
    Object? backImageBase64 = freezed,
    Object? ocrResult = freezed,
  }) {
    return _then(_self.copyWith(
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as IdGenStage,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      verificationFailed: null == verificationFailed
          ? _self.verificationFailed
          : verificationFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      idType: null == idType
          ? _self.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as IdGenType,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      idNumber: null == idNumber
          ? _self.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      issuedDate: null == issuedDate
          ? _self.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as String,
      issuingAuthority: null == issuingAuthority
          ? _self.issuingAuthority
          : issuingAuthority // ignore: cast_nullable_to_non_nullable
              as String,
      frontImageBase64: freezed == frontImageBase64
          ? _self.frontImageBase64
          : frontImageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      backImageBase64: freezed == backImageBase64
          ? _self.backImageBase64
          : backImageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      ocrResult: freezed == ocrResult
          ? _self.ocrResult
          : ocrResult // ignore: cast_nullable_to_non_nullable
              as KoreanIdCard?,
    ));
  }
}

/// Adds pattern-matching-related methods to [IdGenerationState].
extension IdGenerationStatePatterns on IdGenerationState {
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
    TResult Function(_IdGenerationState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IdGenerationState() when $default != null:
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
    TResult Function(_IdGenerationState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IdGenerationState():
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
    TResult? Function(_IdGenerationState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IdGenerationState() when $default != null:
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
            IdGenStage stage,
            bool isLoading,
            String errorMessage,
            bool verificationFailed,
            IdGenType idType,
            String fullName,
            String idNumber,
            String address,
            String issuedDate,
            String issuingAuthority,
            String? frontImageBase64,
            String? backImageBase64,
            KoreanIdCard? ocrResult)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IdGenerationState() when $default != null:
        return $default(
            _that.stage,
            _that.isLoading,
            _that.errorMessage,
            _that.verificationFailed,
            _that.idType,
            _that.fullName,
            _that.idNumber,
            _that.address,
            _that.issuedDate,
            _that.issuingAuthority,
            _that.frontImageBase64,
            _that.backImageBase64,
            _that.ocrResult);
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
            IdGenStage stage,
            bool isLoading,
            String errorMessage,
            bool verificationFailed,
            IdGenType idType,
            String fullName,
            String idNumber,
            String address,
            String issuedDate,
            String issuingAuthority,
            String? frontImageBase64,
            String? backImageBase64,
            KoreanIdCard? ocrResult)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IdGenerationState():
        return $default(
            _that.stage,
            _that.isLoading,
            _that.errorMessage,
            _that.verificationFailed,
            _that.idType,
            _that.fullName,
            _that.idNumber,
            _that.address,
            _that.issuedDate,
            _that.issuingAuthority,
            _that.frontImageBase64,
            _that.backImageBase64,
            _that.ocrResult);
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
            IdGenStage stage,
            bool isLoading,
            String errorMessage,
            bool verificationFailed,
            IdGenType idType,
            String fullName,
            String idNumber,
            String address,
            String issuedDate,
            String issuingAuthority,
            String? frontImageBase64,
            String? backImageBase64,
            KoreanIdCard? ocrResult)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IdGenerationState() when $default != null:
        return $default(
            _that.stage,
            _that.isLoading,
            _that.errorMessage,
            _that.verificationFailed,
            _that.idType,
            _that.fullName,
            _that.idNumber,
            _that.address,
            _that.issuedDate,
            _that.issuingAuthority,
            _that.frontImageBase64,
            _that.backImageBase64,
            _that.ocrResult);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _IdGenerationState implements IdGenerationState {
  _IdGenerationState(
      {this.stage = IdGenStage.start,
      this.isLoading = false,
      this.errorMessage = '',
      this.verificationFailed = false,
      this.idType = IdGenType.selfId,
      this.fullName = '',
      this.idNumber = '',
      this.address = '',
      this.issuedDate = '',
      this.issuingAuthority = '',
      this.frontImageBase64 = null,
      this.backImageBase64 = null,
      this.ocrResult = null});

  @override
  @JsonKey()
  final IdGenStage stage;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool verificationFailed;
  @override
  @JsonKey()
  final IdGenType idType;
  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String idNumber;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String issuedDate;
  @override
  @JsonKey()
  final String issuingAuthority;
  @override
  @JsonKey()
  final String? frontImageBase64;
  @override
  @JsonKey()
  final String? backImageBase64;
  @override
  @JsonKey()
  final KoreanIdCard? ocrResult;

  /// Create a copy of IdGenerationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IdGenerationStateCopyWith<_IdGenerationState> get copyWith =>
      __$IdGenerationStateCopyWithImpl<_IdGenerationState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IdGenerationState &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.verificationFailed, verificationFailed) ||
                other.verificationFailed == verificationFailed) &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.issuingAuthority, issuingAuthority) ||
                other.issuingAuthority == issuingAuthority) &&
            (identical(other.frontImageBase64, frontImageBase64) ||
                other.frontImageBase64 == frontImageBase64) &&
            (identical(other.backImageBase64, backImageBase64) ||
                other.backImageBase64 == backImageBase64) &&
            (identical(other.ocrResult, ocrResult) ||
                other.ocrResult == ocrResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stage,
      isLoading,
      errorMessage,
      verificationFailed,
      idType,
      fullName,
      idNumber,
      address,
      issuedDate,
      issuingAuthority,
      frontImageBase64,
      backImageBase64,
      ocrResult);

  @override
  String toString() {
    return 'IdGenerationState(stage: $stage, isLoading: $isLoading, errorMessage: $errorMessage, verificationFailed: $verificationFailed, idType: $idType, fullName: $fullName, idNumber: $idNumber, address: $address, issuedDate: $issuedDate, issuingAuthority: $issuingAuthority, frontImageBase64: $frontImageBase64, backImageBase64: $backImageBase64, ocrResult: $ocrResult)';
  }
}

/// @nodoc
abstract mixin class _$IdGenerationStateCopyWith<$Res>
    implements $IdGenerationStateCopyWith<$Res> {
  factory _$IdGenerationStateCopyWith(
          _IdGenerationState value, $Res Function(_IdGenerationState) _then) =
      __$IdGenerationStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {IdGenStage stage,
      bool isLoading,
      String errorMessage,
      bool verificationFailed,
      IdGenType idType,
      String fullName,
      String idNumber,
      String address,
      String issuedDate,
      String issuingAuthority,
      String? frontImageBase64,
      String? backImageBase64,
      KoreanIdCard? ocrResult});
}

/// @nodoc
class __$IdGenerationStateCopyWithImpl<$Res>
    implements _$IdGenerationStateCopyWith<$Res> {
  __$IdGenerationStateCopyWithImpl(this._self, this._then);

  final _IdGenerationState _self;
  final $Res Function(_IdGenerationState) _then;

  /// Create a copy of IdGenerationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stage = null,
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? verificationFailed = null,
    Object? idType = null,
    Object? fullName = null,
    Object? idNumber = null,
    Object? address = null,
    Object? issuedDate = null,
    Object? issuingAuthority = null,
    Object? frontImageBase64 = freezed,
    Object? backImageBase64 = freezed,
    Object? ocrResult = freezed,
  }) {
    return _then(_IdGenerationState(
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as IdGenStage,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      verificationFailed: null == verificationFailed
          ? _self.verificationFailed
          : verificationFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      idType: null == idType
          ? _self.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as IdGenType,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      idNumber: null == idNumber
          ? _self.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      issuedDate: null == issuedDate
          ? _self.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as String,
      issuingAuthority: null == issuingAuthority
          ? _self.issuingAuthority
          : issuingAuthority // ignore: cast_nullable_to_non_nullable
              as String,
      frontImageBase64: freezed == frontImageBase64
          ? _self.frontImageBase64
          : frontImageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      backImageBase64: freezed == backImageBase64
          ? _self.backImageBase64
          : backImageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      ocrResult: freezed == ocrResult
          ? _self.ocrResult
          : ocrResult // ignore: cast_nullable_to_non_nullable
              as KoreanIdCard?,
    ));
  }
}

// dart format on

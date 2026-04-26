// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BankInfoModel {
  @JsonKey(name: 'id')
  int? get refBank;
  @JsonKey(name: 'bankName')
  String? get name;
  @JsonKey(name: 'iconPath')
  String? get iconPath;

  /// Create a copy of BankInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BankInfoModelCopyWith<BankInfoModel> get copyWith =>
      _$BankInfoModelCopyWithImpl<BankInfoModel>(
          this as BankInfoModel, _$identity);

  /// Serializes this BankInfoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BankInfoModel &&
            (identical(other.refBank, refBank) || other.refBank == refBank) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refBank, name, iconPath);

  @override
  String toString() {
    return 'BankInfoModel(refBank: $refBank, name: $name, iconPath: $iconPath)';
  }
}

/// @nodoc
abstract mixin class $BankInfoModelCopyWith<$Res> {
  factory $BankInfoModelCopyWith(
          BankInfoModel value, $Res Function(BankInfoModel) _then) =
      _$BankInfoModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? refBank,
      @JsonKey(name: 'bankName') String? name,
      @JsonKey(name: 'iconPath') String? iconPath});
}

/// @nodoc
class _$BankInfoModelCopyWithImpl<$Res>
    implements $BankInfoModelCopyWith<$Res> {
  _$BankInfoModelCopyWithImpl(this._self, this._then);

  final BankInfoModel _self;
  final $Res Function(BankInfoModel) _then;

  /// Create a copy of BankInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refBank = freezed,
    Object? name = freezed,
    Object? iconPath = freezed,
  }) {
    return _then(_self.copyWith(
      refBank: freezed == refBank
          ? _self.refBank
          : refBank // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iconPath: freezed == iconPath
          ? _self.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BankInfoModel].
extension BankInfoModelPatterns on BankInfoModel {
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
    TResult Function(_BankInfoModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BankInfoModel() when $default != null:
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
    TResult Function(_BankInfoModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankInfoModel():
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
    TResult? Function(_BankInfoModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankInfoModel() when $default != null:
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
            @JsonKey(name: 'id') int? refBank,
            @JsonKey(name: 'bankName') String? name,
            @JsonKey(name: 'iconPath') String? iconPath)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BankInfoModel() when $default != null:
        return $default(_that.refBank, _that.name, _that.iconPath);
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
            @JsonKey(name: 'id') int? refBank,
            @JsonKey(name: 'bankName') String? name,
            @JsonKey(name: 'iconPath') String? iconPath)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankInfoModel():
        return $default(_that.refBank, _that.name, _that.iconPath);
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
            @JsonKey(name: 'id') int? refBank,
            @JsonKey(name: 'bankName') String? name,
            @JsonKey(name: 'iconPath') String? iconPath)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankInfoModel() when $default != null:
        return $default(_that.refBank, _that.name, _that.iconPath);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BankInfoModel extends BankInfoModel {
  const _BankInfoModel(
      {@JsonKey(name: 'id') this.refBank,
      @JsonKey(name: 'bankName') this.name,
      @JsonKey(name: 'iconPath') this.iconPath})
      : super._();
  factory _BankInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BankInfoModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? refBank;
  @override
  @JsonKey(name: 'bankName')
  final String? name;
  @override
  @JsonKey(name: 'iconPath')
  final String? iconPath;

  /// Create a copy of BankInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BankInfoModelCopyWith<_BankInfoModel> get copyWith =>
      __$BankInfoModelCopyWithImpl<_BankInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BankInfoModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BankInfoModel &&
            (identical(other.refBank, refBank) || other.refBank == refBank) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refBank, name, iconPath);

  @override
  String toString() {
    return 'BankInfoModel(refBank: $refBank, name: $name, iconPath: $iconPath)';
  }
}

/// @nodoc
abstract mixin class _$BankInfoModelCopyWith<$Res>
    implements $BankInfoModelCopyWith<$Res> {
  factory _$BankInfoModelCopyWith(
          _BankInfoModel value, $Res Function(_BankInfoModel) _then) =
      __$BankInfoModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? refBank,
      @JsonKey(name: 'bankName') String? name,
      @JsonKey(name: 'iconPath') String? iconPath});
}

/// @nodoc
class __$BankInfoModelCopyWithImpl<$Res>
    implements _$BankInfoModelCopyWith<$Res> {
  __$BankInfoModelCopyWithImpl(this._self, this._then);

  final _BankInfoModel _self;
  final $Res Function(_BankInfoModel) _then;

  /// Create a copy of BankInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? refBank = freezed,
    Object? name = freezed,
    Object? iconPath = freezed,
  }) {
    return _then(_BankInfoModel(
      refBank: freezed == refBank
          ? _self.refBank
          : refBank // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iconPath: freezed == iconPath
          ? _self.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

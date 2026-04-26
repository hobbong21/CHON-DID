// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'relation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RelationUserModel {
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'gender')
  GenderE? get gender;
  @JsonKey(name: 'parentId')
  int? get parentId;
  @JsonKey(name: 'spouseId')
  int? get spouseId;
  @JsonKey(name: 'certOwnerId')
  int? get certOwnerId;
  @JsonKey(name: 'certRelatedId')
  int? get certRelatedId;
  @JsonKey(name: 'certRelatedName')
  String? get certRelatedName;
  @JsonKey(name: 'certRelatedPhone')
  String? get certRelatedPhone;
  @JsonKey(name: 'isActive')
  int? get isActive;
  @JsonKey(name: 'status')
  StatusRelationE get status;
  @JsonKey(name: 'relationType')
  RelationType? get relationType;
  @JsonKey(name: 'isCollapsed')
  bool? get isCollapsed;
  @JsonKey(name: 'imgPath')
  String? get imgPath;
  @JsonKey(name: 'cardName')
  String? get cardName;
  @JsonKey(name: 'certOwnerName')
  String? get certOwnerName;
  @JsonKey(name: 'certOwnerPhone')
  String? get certOwnerPhone;

  /// Create a copy of RelationUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RelationUserModelCopyWith<RelationUserModel> get copyWith =>
      _$RelationUserModelCopyWithImpl<RelationUserModel>(
          this as RelationUserModel, _$identity);

  /// Serializes this RelationUserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RelationUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.spouseId, spouseId) ||
                other.spouseId == spouseId) &&
            (identical(other.certOwnerId, certOwnerId) ||
                other.certOwnerId == certOwnerId) &&
            (identical(other.certRelatedId, certRelatedId) ||
                other.certRelatedId == certRelatedId) &&
            (identical(other.certRelatedName, certRelatedName) ||
                other.certRelatedName == certRelatedName) &&
            (identical(other.certRelatedPhone, certRelatedPhone) ||
                other.certRelatedPhone == certRelatedPhone) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.relationType, relationType) ||
                other.relationType == relationType) &&
            (identical(other.isCollapsed, isCollapsed) ||
                other.isCollapsed == isCollapsed) &&
            (identical(other.imgPath, imgPath) || other.imgPath == imgPath) &&
            (identical(other.cardName, cardName) ||
                other.cardName == cardName) &&
            (identical(other.certOwnerName, certOwnerName) ||
                other.certOwnerName == certOwnerName) &&
            (identical(other.certOwnerPhone, certOwnerPhone) ||
                other.certOwnerPhone == certOwnerPhone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      gender,
      parentId,
      spouseId,
      certOwnerId,
      certRelatedId,
      certRelatedName,
      certRelatedPhone,
      isActive,
      status,
      relationType,
      isCollapsed,
      imgPath,
      cardName,
      certOwnerName,
      certOwnerPhone);

  @override
  String toString() {
    return 'RelationUserModel(id: $id, gender: $gender, parentId: $parentId, spouseId: $spouseId, certOwnerId: $certOwnerId, certRelatedId: $certRelatedId, certRelatedName: $certRelatedName, certRelatedPhone: $certRelatedPhone, isActive: $isActive, status: $status, relationType: $relationType, isCollapsed: $isCollapsed, imgPath: $imgPath, cardName: $cardName, certOwnerName: $certOwnerName, certOwnerPhone: $certOwnerPhone)';
  }
}

/// @nodoc
abstract mixin class $RelationUserModelCopyWith<$Res> {
  factory $RelationUserModelCopyWith(
          RelationUserModel value, $Res Function(RelationUserModel) _then) =
      _$RelationUserModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'gender') GenderE? gender,
      @JsonKey(name: 'parentId') int? parentId,
      @JsonKey(name: 'spouseId') int? spouseId,
      @JsonKey(name: 'certOwnerId') int? certOwnerId,
      @JsonKey(name: 'certRelatedId') int? certRelatedId,
      @JsonKey(name: 'certRelatedName') String? certRelatedName,
      @JsonKey(name: 'certRelatedPhone') String? certRelatedPhone,
      @JsonKey(name: 'isActive') int? isActive,
      @JsonKey(name: 'status') StatusRelationE status,
      @JsonKey(name: 'relationType') RelationType? relationType,
      @JsonKey(name: 'isCollapsed') bool? isCollapsed,
      @JsonKey(name: 'imgPath') String? imgPath,
      @JsonKey(name: 'cardName') String? cardName,
      @JsonKey(name: 'certOwnerName') String? certOwnerName,
      @JsonKey(name: 'certOwnerPhone') String? certOwnerPhone});
}

/// @nodoc
class _$RelationUserModelCopyWithImpl<$Res>
    implements $RelationUserModelCopyWith<$Res> {
  _$RelationUserModelCopyWithImpl(this._self, this._then);

  final RelationUserModel _self;
  final $Res Function(RelationUserModel) _then;

  /// Create a copy of RelationUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? gender = freezed,
    Object? parentId = freezed,
    Object? spouseId = freezed,
    Object? certOwnerId = freezed,
    Object? certRelatedId = freezed,
    Object? certRelatedName = freezed,
    Object? certRelatedPhone = freezed,
    Object? isActive = freezed,
    Object? status = null,
    Object? relationType = freezed,
    Object? isCollapsed = freezed,
    Object? imgPath = freezed,
    Object? cardName = freezed,
    Object? certOwnerName = freezed,
    Object? certOwnerPhone = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderE?,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      spouseId: freezed == spouseId
          ? _self.spouseId
          : spouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      certOwnerId: freezed == certOwnerId
          ? _self.certOwnerId
          : certOwnerId // ignore: cast_nullable_to_non_nullable
              as int?,
      certRelatedId: freezed == certRelatedId
          ? _self.certRelatedId
          : certRelatedId // ignore: cast_nullable_to_non_nullable
              as int?,
      certRelatedName: freezed == certRelatedName
          ? _self.certRelatedName
          : certRelatedName // ignore: cast_nullable_to_non_nullable
              as String?,
      certRelatedPhone: freezed == certRelatedPhone
          ? _self.certRelatedPhone
          : certRelatedPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusRelationE,
      relationType: freezed == relationType
          ? _self.relationType
          : relationType // ignore: cast_nullable_to_non_nullable
              as RelationType?,
      isCollapsed: freezed == isCollapsed
          ? _self.isCollapsed
          : isCollapsed // ignore: cast_nullable_to_non_nullable
              as bool?,
      imgPath: freezed == imgPath
          ? _self.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String?,
      cardName: freezed == cardName
          ? _self.cardName
          : cardName // ignore: cast_nullable_to_non_nullable
              as String?,
      certOwnerName: freezed == certOwnerName
          ? _self.certOwnerName
          : certOwnerName // ignore: cast_nullable_to_non_nullable
              as String?,
      certOwnerPhone: freezed == certOwnerPhone
          ? _self.certOwnerPhone
          : certOwnerPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RelationUserModel].
extension RelationUserModelPatterns on RelationUserModel {
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
    TResult Function(_RelationUserModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RelationUserModel() when $default != null:
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
    TResult Function(_RelationUserModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RelationUserModel():
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
    TResult? Function(_RelationUserModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RelationUserModel() when $default != null:
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
            @JsonKey(name: 'gender') GenderE? gender,
            @JsonKey(name: 'parentId') int? parentId,
            @JsonKey(name: 'spouseId') int? spouseId,
            @JsonKey(name: 'certOwnerId') int? certOwnerId,
            @JsonKey(name: 'certRelatedId') int? certRelatedId,
            @JsonKey(name: 'certRelatedName') String? certRelatedName,
            @JsonKey(name: 'certRelatedPhone') String? certRelatedPhone,
            @JsonKey(name: 'isActive') int? isActive,
            @JsonKey(name: 'status') StatusRelationE status,
            @JsonKey(name: 'relationType') RelationType? relationType,
            @JsonKey(name: 'isCollapsed') bool? isCollapsed,
            @JsonKey(name: 'imgPath') String? imgPath,
            @JsonKey(name: 'cardName') String? cardName,
            @JsonKey(name: 'certOwnerName') String? certOwnerName,
            @JsonKey(name: 'certOwnerPhone') String? certOwnerPhone)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RelationUserModel() when $default != null:
        return $default(
            _that.id,
            _that.gender,
            _that.parentId,
            _that.spouseId,
            _that.certOwnerId,
            _that.certRelatedId,
            _that.certRelatedName,
            _that.certRelatedPhone,
            _that.isActive,
            _that.status,
            _that.relationType,
            _that.isCollapsed,
            _that.imgPath,
            _that.cardName,
            _that.certOwnerName,
            _that.certOwnerPhone);
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
            @JsonKey(name: 'gender') GenderE? gender,
            @JsonKey(name: 'parentId') int? parentId,
            @JsonKey(name: 'spouseId') int? spouseId,
            @JsonKey(name: 'certOwnerId') int? certOwnerId,
            @JsonKey(name: 'certRelatedId') int? certRelatedId,
            @JsonKey(name: 'certRelatedName') String? certRelatedName,
            @JsonKey(name: 'certRelatedPhone') String? certRelatedPhone,
            @JsonKey(name: 'isActive') int? isActive,
            @JsonKey(name: 'status') StatusRelationE status,
            @JsonKey(name: 'relationType') RelationType? relationType,
            @JsonKey(name: 'isCollapsed') bool? isCollapsed,
            @JsonKey(name: 'imgPath') String? imgPath,
            @JsonKey(name: 'cardName') String? cardName,
            @JsonKey(name: 'certOwnerName') String? certOwnerName,
            @JsonKey(name: 'certOwnerPhone') String? certOwnerPhone)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RelationUserModel():
        return $default(
            _that.id,
            _that.gender,
            _that.parentId,
            _that.spouseId,
            _that.certOwnerId,
            _that.certRelatedId,
            _that.certRelatedName,
            _that.certRelatedPhone,
            _that.isActive,
            _that.status,
            _that.relationType,
            _that.isCollapsed,
            _that.imgPath,
            _that.cardName,
            _that.certOwnerName,
            _that.certOwnerPhone);
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
            @JsonKey(name: 'gender') GenderE? gender,
            @JsonKey(name: 'parentId') int? parentId,
            @JsonKey(name: 'spouseId') int? spouseId,
            @JsonKey(name: 'certOwnerId') int? certOwnerId,
            @JsonKey(name: 'certRelatedId') int? certRelatedId,
            @JsonKey(name: 'certRelatedName') String? certRelatedName,
            @JsonKey(name: 'certRelatedPhone') String? certRelatedPhone,
            @JsonKey(name: 'isActive') int? isActive,
            @JsonKey(name: 'status') StatusRelationE status,
            @JsonKey(name: 'relationType') RelationType? relationType,
            @JsonKey(name: 'isCollapsed') bool? isCollapsed,
            @JsonKey(name: 'imgPath') String? imgPath,
            @JsonKey(name: 'cardName') String? cardName,
            @JsonKey(name: 'certOwnerName') String? certOwnerName,
            @JsonKey(name: 'certOwnerPhone') String? certOwnerPhone)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RelationUserModel() when $default != null:
        return $default(
            _that.id,
            _that.gender,
            _that.parentId,
            _that.spouseId,
            _that.certOwnerId,
            _that.certRelatedId,
            _that.certRelatedName,
            _that.certRelatedPhone,
            _that.isActive,
            _that.status,
            _that.relationType,
            _that.isCollapsed,
            _that.imgPath,
            _that.cardName,
            _that.certOwnerName,
            _that.certOwnerPhone);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RelationUserModel implements RelationUserModel {
  const _RelationUserModel(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'parentId') this.parentId,
      @JsonKey(name: 'spouseId') this.spouseId,
      @JsonKey(name: 'certOwnerId') this.certOwnerId,
      @JsonKey(name: 'certRelatedId') this.certRelatedId,
      @JsonKey(name: 'certRelatedName') this.certRelatedName,
      @JsonKey(name: 'certRelatedPhone') this.certRelatedPhone,
      @JsonKey(name: 'isActive') this.isActive,
      @JsonKey(name: 'status') this.status = StatusRelationE.unVerified,
      @JsonKey(name: 'relationType') this.relationType,
      @JsonKey(name: 'isCollapsed') this.isCollapsed,
      @JsonKey(name: 'imgPath') this.imgPath,
      @JsonKey(name: 'cardName') this.cardName,
      @JsonKey(name: 'certOwnerName') this.certOwnerName,
      @JsonKey(name: 'certOwnerPhone') this.certOwnerPhone});
  factory _RelationUserModel.fromJson(Map<String, dynamic> json) =>
      _$RelationUserModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'gender')
  final GenderE? gender;
  @override
  @JsonKey(name: 'parentId')
  final int? parentId;
  @override
  @JsonKey(name: 'spouseId')
  final int? spouseId;
  @override
  @JsonKey(name: 'certOwnerId')
  final int? certOwnerId;
  @override
  @JsonKey(name: 'certRelatedId')
  final int? certRelatedId;
  @override
  @JsonKey(name: 'certRelatedName')
  final String? certRelatedName;
  @override
  @JsonKey(name: 'certRelatedPhone')
  final String? certRelatedPhone;
  @override
  @JsonKey(name: 'isActive')
  final int? isActive;
  @override
  @JsonKey(name: 'status')
  final StatusRelationE status;
  @override
  @JsonKey(name: 'relationType')
  final RelationType? relationType;
  @override
  @JsonKey(name: 'isCollapsed')
  final bool? isCollapsed;
  @override
  @JsonKey(name: 'imgPath')
  final String? imgPath;
  @override
  @JsonKey(name: 'cardName')
  final String? cardName;
  @override
  @JsonKey(name: 'certOwnerName')
  final String? certOwnerName;
  @override
  @JsonKey(name: 'certOwnerPhone')
  final String? certOwnerPhone;

  /// Create a copy of RelationUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RelationUserModelCopyWith<_RelationUserModel> get copyWith =>
      __$RelationUserModelCopyWithImpl<_RelationUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RelationUserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RelationUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.spouseId, spouseId) ||
                other.spouseId == spouseId) &&
            (identical(other.certOwnerId, certOwnerId) ||
                other.certOwnerId == certOwnerId) &&
            (identical(other.certRelatedId, certRelatedId) ||
                other.certRelatedId == certRelatedId) &&
            (identical(other.certRelatedName, certRelatedName) ||
                other.certRelatedName == certRelatedName) &&
            (identical(other.certRelatedPhone, certRelatedPhone) ||
                other.certRelatedPhone == certRelatedPhone) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.relationType, relationType) ||
                other.relationType == relationType) &&
            (identical(other.isCollapsed, isCollapsed) ||
                other.isCollapsed == isCollapsed) &&
            (identical(other.imgPath, imgPath) || other.imgPath == imgPath) &&
            (identical(other.cardName, cardName) ||
                other.cardName == cardName) &&
            (identical(other.certOwnerName, certOwnerName) ||
                other.certOwnerName == certOwnerName) &&
            (identical(other.certOwnerPhone, certOwnerPhone) ||
                other.certOwnerPhone == certOwnerPhone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      gender,
      parentId,
      spouseId,
      certOwnerId,
      certRelatedId,
      certRelatedName,
      certRelatedPhone,
      isActive,
      status,
      relationType,
      isCollapsed,
      imgPath,
      cardName,
      certOwnerName,
      certOwnerPhone);

  @override
  String toString() {
    return 'RelationUserModel(id: $id, gender: $gender, parentId: $parentId, spouseId: $spouseId, certOwnerId: $certOwnerId, certRelatedId: $certRelatedId, certRelatedName: $certRelatedName, certRelatedPhone: $certRelatedPhone, isActive: $isActive, status: $status, relationType: $relationType, isCollapsed: $isCollapsed, imgPath: $imgPath, cardName: $cardName, certOwnerName: $certOwnerName, certOwnerPhone: $certOwnerPhone)';
  }
}

/// @nodoc
abstract mixin class _$RelationUserModelCopyWith<$Res>
    implements $RelationUserModelCopyWith<$Res> {
  factory _$RelationUserModelCopyWith(
          _RelationUserModel value, $Res Function(_RelationUserModel) _then) =
      __$RelationUserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'gender') GenderE? gender,
      @JsonKey(name: 'parentId') int? parentId,
      @JsonKey(name: 'spouseId') int? spouseId,
      @JsonKey(name: 'certOwnerId') int? certOwnerId,
      @JsonKey(name: 'certRelatedId') int? certRelatedId,
      @JsonKey(name: 'certRelatedName') String? certRelatedName,
      @JsonKey(name: 'certRelatedPhone') String? certRelatedPhone,
      @JsonKey(name: 'isActive') int? isActive,
      @JsonKey(name: 'status') StatusRelationE status,
      @JsonKey(name: 'relationType') RelationType? relationType,
      @JsonKey(name: 'isCollapsed') bool? isCollapsed,
      @JsonKey(name: 'imgPath') String? imgPath,
      @JsonKey(name: 'cardName') String? cardName,
      @JsonKey(name: 'certOwnerName') String? certOwnerName,
      @JsonKey(name: 'certOwnerPhone') String? certOwnerPhone});
}

/// @nodoc
class __$RelationUserModelCopyWithImpl<$Res>
    implements _$RelationUserModelCopyWith<$Res> {
  __$RelationUserModelCopyWithImpl(this._self, this._then);

  final _RelationUserModel _self;
  final $Res Function(_RelationUserModel) _then;

  /// Create a copy of RelationUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? gender = freezed,
    Object? parentId = freezed,
    Object? spouseId = freezed,
    Object? certOwnerId = freezed,
    Object? certRelatedId = freezed,
    Object? certRelatedName = freezed,
    Object? certRelatedPhone = freezed,
    Object? isActive = freezed,
    Object? status = null,
    Object? relationType = freezed,
    Object? isCollapsed = freezed,
    Object? imgPath = freezed,
    Object? cardName = freezed,
    Object? certOwnerName = freezed,
    Object? certOwnerPhone = freezed,
  }) {
    return _then(_RelationUserModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderE?,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      spouseId: freezed == spouseId
          ? _self.spouseId
          : spouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      certOwnerId: freezed == certOwnerId
          ? _self.certOwnerId
          : certOwnerId // ignore: cast_nullable_to_non_nullable
              as int?,
      certRelatedId: freezed == certRelatedId
          ? _self.certRelatedId
          : certRelatedId // ignore: cast_nullable_to_non_nullable
              as int?,
      certRelatedName: freezed == certRelatedName
          ? _self.certRelatedName
          : certRelatedName // ignore: cast_nullable_to_non_nullable
              as String?,
      certRelatedPhone: freezed == certRelatedPhone
          ? _self.certRelatedPhone
          : certRelatedPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusRelationE,
      relationType: freezed == relationType
          ? _self.relationType
          : relationType // ignore: cast_nullable_to_non_nullable
              as RelationType?,
      isCollapsed: freezed == isCollapsed
          ? _self.isCollapsed
          : isCollapsed // ignore: cast_nullable_to_non_nullable
              as bool?,
      imgPath: freezed == imgPath
          ? _self.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String?,
      cardName: freezed == cardName
          ? _self.cardName
          : cardName // ignore: cast_nullable_to_non_nullable
              as String?,
      certOwnerName: freezed == certOwnerName
          ? _self.certOwnerName
          : certOwnerName // ignore: cast_nullable_to_non_nullable
              as String?,
      certOwnerPhone: freezed == certOwnerPhone
          ? _self.certOwnerPhone
          : certOwnerPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$RelationModel {
  @JsonKey(name: 'id')
  int? get id; // @JsonKey(name: 'name') String? name,
  @JsonKey(name: 'type', unknownEnumValue: RelationType.otherGrand)
  RelationType? get type;

  /// Create a copy of RelationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RelationModelCopyWith<RelationModel> get copyWith =>
      _$RelationModelCopyWithImpl<RelationModel>(
          this as RelationModel, _$identity);

  /// Serializes this RelationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RelationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type);

  @override
  String toString() {
    return 'RelationModel(id: $id, type: $type)';
  }
}

/// @nodoc
abstract mixin class $RelationModelCopyWith<$Res> {
  factory $RelationModelCopyWith(
          RelationModel value, $Res Function(RelationModel) _then) =
      _$RelationModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'type', unknownEnumValue: RelationType.otherGrand)
      RelationType? type});
}

/// @nodoc
class _$RelationModelCopyWithImpl<$Res>
    implements $RelationModelCopyWith<$Res> {
  _$RelationModelCopyWithImpl(this._self, this._then);

  final RelationModel _self;
  final $Res Function(RelationModel) _then;

  /// Create a copy of RelationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RelationType?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RelationModel].
extension RelationModelPatterns on RelationModel {
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
    TResult Function(_RelationModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RelationModel() when $default != null:
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
    TResult Function(_RelationModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RelationModel():
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
    TResult? Function(_RelationModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RelationModel() when $default != null:
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
            @JsonKey(name: 'type', unknownEnumValue: RelationType.otherGrand)
            RelationType? type)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RelationModel() when $default != null:
        return $default(_that.id, _that.type);
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
            @JsonKey(name: 'type', unknownEnumValue: RelationType.otherGrand)
            RelationType? type)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RelationModel():
        return $default(_that.id, _that.type);
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
            @JsonKey(name: 'type', unknownEnumValue: RelationType.otherGrand)
            RelationType? type)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RelationModel() when $default != null:
        return $default(_that.id, _that.type);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RelationModel implements RelationModel {
  const _RelationModel(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'type', unknownEnumValue: RelationType.otherGrand)
      this.type});
  factory _RelationModel.fromJson(Map<String, dynamic> json) =>
      _$RelationModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
// @JsonKey(name: 'name') String? name,
  @override
  @JsonKey(name: 'type', unknownEnumValue: RelationType.otherGrand)
  final RelationType? type;

  /// Create a copy of RelationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RelationModelCopyWith<_RelationModel> get copyWith =>
      __$RelationModelCopyWithImpl<_RelationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RelationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RelationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type);

  @override
  String toString() {
    return 'RelationModel(id: $id, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$RelationModelCopyWith<$Res>
    implements $RelationModelCopyWith<$Res> {
  factory _$RelationModelCopyWith(
          _RelationModel value, $Res Function(_RelationModel) _then) =
      __$RelationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'type', unknownEnumValue: RelationType.otherGrand)
      RelationType? type});
}

/// @nodoc
class __$RelationModelCopyWithImpl<$Res>
    implements _$RelationModelCopyWith<$Res> {
  __$RelationModelCopyWithImpl(this._self, this._then);

  final _RelationModel _self;
  final $Res Function(_RelationModel) _then;

  /// Create a copy of RelationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
  }) {
    return _then(_RelationModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RelationType?,
    ));
  }
}

// dart format on

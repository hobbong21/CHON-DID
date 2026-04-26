// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_relationship_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConfirmRelationshipState {
  bool get isLoading;
  bool get isLoadingBlock;
  String get messageError;
  CardInfoItem? get info;
  CardInfoItem? get owner;
  RelationUserModel? get relation;

  /// Create a copy of ConfirmRelationshipState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfirmRelationshipStateCopyWith<ConfirmRelationshipState> get copyWith =>
      _$ConfirmRelationshipStateCopyWithImpl<ConfirmRelationshipState>(
          this as ConfirmRelationshipState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfirmRelationshipState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingBlock, isLoadingBlock) ||
                other.isLoadingBlock == isLoadingBlock) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.relation, relation) ||
                other.relation == relation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isLoadingBlock,
      messageError, info, owner, relation);

  @override
  String toString() {
    return 'ConfirmRelationshipState(isLoading: $isLoading, isLoadingBlock: $isLoadingBlock, messageError: $messageError, info: $info, owner: $owner, relation: $relation)';
  }
}

/// @nodoc
abstract mixin class $ConfirmRelationshipStateCopyWith<$Res> {
  factory $ConfirmRelationshipStateCopyWith(ConfirmRelationshipState value,
          $Res Function(ConfirmRelationshipState) _then) =
      _$ConfirmRelationshipStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingBlock,
      String messageError,
      CardInfoItem? info,
      CardInfoItem? owner,
      RelationUserModel? relation});

  $CardInfoItemCopyWith<$Res>? get info;
  $CardInfoItemCopyWith<$Res>? get owner;
  $RelationUserModelCopyWith<$Res>? get relation;
}

/// @nodoc
class _$ConfirmRelationshipStateCopyWithImpl<$Res>
    implements $ConfirmRelationshipStateCopyWith<$Res> {
  _$ConfirmRelationshipStateCopyWithImpl(this._self, this._then);

  final ConfirmRelationshipState _self;
  final $Res Function(ConfirmRelationshipState) _then;

  /// Create a copy of ConfirmRelationshipState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingBlock = null,
    Object? messageError = null,
    Object? info = freezed,
    Object? owner = freezed,
    Object? relation = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingBlock: null == isLoadingBlock
          ? _self.isLoadingBlock
          : isLoadingBlock // ignore: cast_nullable_to_non_nullable
              as bool,
      messageError: null == messageError
          ? _self.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String,
      info: freezed == info
          ? _self.info
          : info // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
      relation: freezed == relation
          ? _self.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as RelationUserModel?,
    ));
  }

  /// Create a copy of ConfirmRelationshipState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardInfoItemCopyWith<$Res>? get info {
    if (_self.info == null) {
      return null;
    }

    return $CardInfoItemCopyWith<$Res>(_self.info!, (value) {
      return _then(_self.copyWith(info: value));
    });
  }

  /// Create a copy of ConfirmRelationshipState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardInfoItemCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $CardInfoItemCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }

  /// Create a copy of ConfirmRelationshipState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationUserModelCopyWith<$Res>? get relation {
    if (_self.relation == null) {
      return null;
    }

    return $RelationUserModelCopyWith<$Res>(_self.relation!, (value) {
      return _then(_self.copyWith(relation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ConfirmRelationshipState].
extension ConfirmRelationshipStatePatterns on ConfirmRelationshipState {
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
    TResult Function(_ConfirmRelationshipState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConfirmRelationshipState() when $default != null:
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
    TResult Function(_ConfirmRelationshipState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfirmRelationshipState():
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
    TResult? Function(_ConfirmRelationshipState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfirmRelationshipState() when $default != null:
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
            bool isLoading,
            bool isLoadingBlock,
            String messageError,
            CardInfoItem? info,
            CardInfoItem? owner,
            RelationUserModel? relation)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConfirmRelationshipState() when $default != null:
        return $default(_that.isLoading, _that.isLoadingBlock,
            _that.messageError, _that.info, _that.owner, _that.relation);
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
            bool isLoading,
            bool isLoadingBlock,
            String messageError,
            CardInfoItem? info,
            CardInfoItem? owner,
            RelationUserModel? relation)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfirmRelationshipState():
        return $default(_that.isLoading, _that.isLoadingBlock,
            _that.messageError, _that.info, _that.owner, _that.relation);
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
            bool isLoading,
            bool isLoadingBlock,
            String messageError,
            CardInfoItem? info,
            CardInfoItem? owner,
            RelationUserModel? relation)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfirmRelationshipState() when $default != null:
        return $default(_that.isLoading, _that.isLoadingBlock,
            _that.messageError, _that.info, _that.owner, _that.relation);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ConfirmRelationshipState implements ConfirmRelationshipState {
  const _ConfirmRelationshipState(
      {this.isLoading = false,
      this.isLoadingBlock = false,
      this.messageError = '',
      this.info,
      this.owner,
      this.relation});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingBlock;
  @override
  @JsonKey()
  final String messageError;
  @override
  final CardInfoItem? info;
  @override
  final CardInfoItem? owner;
  @override
  final RelationUserModel? relation;

  /// Create a copy of ConfirmRelationshipState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConfirmRelationshipStateCopyWith<_ConfirmRelationshipState> get copyWith =>
      __$ConfirmRelationshipStateCopyWithImpl<_ConfirmRelationshipState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConfirmRelationshipState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingBlock, isLoadingBlock) ||
                other.isLoadingBlock == isLoadingBlock) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.relation, relation) ||
                other.relation == relation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isLoadingBlock,
      messageError, info, owner, relation);

  @override
  String toString() {
    return 'ConfirmRelationshipState(isLoading: $isLoading, isLoadingBlock: $isLoadingBlock, messageError: $messageError, info: $info, owner: $owner, relation: $relation)';
  }
}

/// @nodoc
abstract mixin class _$ConfirmRelationshipStateCopyWith<$Res>
    implements $ConfirmRelationshipStateCopyWith<$Res> {
  factory _$ConfirmRelationshipStateCopyWith(_ConfirmRelationshipState value,
          $Res Function(_ConfirmRelationshipState) _then) =
      __$ConfirmRelationshipStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingBlock,
      String messageError,
      CardInfoItem? info,
      CardInfoItem? owner,
      RelationUserModel? relation});

  @override
  $CardInfoItemCopyWith<$Res>? get info;
  @override
  $CardInfoItemCopyWith<$Res>? get owner;
  @override
  $RelationUserModelCopyWith<$Res>? get relation;
}

/// @nodoc
class __$ConfirmRelationshipStateCopyWithImpl<$Res>
    implements _$ConfirmRelationshipStateCopyWith<$Res> {
  __$ConfirmRelationshipStateCopyWithImpl(this._self, this._then);

  final _ConfirmRelationshipState _self;
  final $Res Function(_ConfirmRelationshipState) _then;

  /// Create a copy of ConfirmRelationshipState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? isLoadingBlock = null,
    Object? messageError = null,
    Object? info = freezed,
    Object? owner = freezed,
    Object? relation = freezed,
  }) {
    return _then(_ConfirmRelationshipState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingBlock: null == isLoadingBlock
          ? _self.isLoadingBlock
          : isLoadingBlock // ignore: cast_nullable_to_non_nullable
              as bool,
      messageError: null == messageError
          ? _self.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String,
      info: freezed == info
          ? _self.info
          : info // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
      relation: freezed == relation
          ? _self.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as RelationUserModel?,
    ));
  }

  /// Create a copy of ConfirmRelationshipState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardInfoItemCopyWith<$Res>? get info {
    if (_self.info == null) {
      return null;
    }

    return $CardInfoItemCopyWith<$Res>(_self.info!, (value) {
      return _then(_self.copyWith(info: value));
    });
  }

  /// Create a copy of ConfirmRelationshipState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardInfoItemCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $CardInfoItemCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }

  /// Create a copy of ConfirmRelationshipState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationUserModelCopyWith<$Res>? get relation {
    if (_self.relation == null) {
      return null;
    }

    return $RelationUserModelCopyWith<$Res>(_self.relation!, (value) {
      return _then(_self.copyWith(relation: value));
    });
  }
}

// dart format on
